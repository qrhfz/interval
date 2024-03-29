package dev.qori.interval

import android.annotation.SuppressLint
import android.app.Notification
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.IBinder
import android.os.PowerManager
import androidx.core.app.NotificationCompat
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject


class TimerService : Service() {
    private val handler: Handler by inject()
    private val job = SupervisorJob()
    private val scope = CoroutineScope(Dispatchers.IO + job)
    private lateinit var wakeLock: PowerManager.WakeLock

    @SuppressLint("WakelockTimeout")
    override fun onCreate() {
        super.onCreate()
        wakeLock = (getSystemService(Context.POWER_SERVICE) as PowerManager).run {
            newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "MyApp::MyWakelockTag").apply {
                acquire()
            }
        }
    }

    override fun onDestroy() {
        job.cancel()
        wakeLock.release()
        super.onDestroy()
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent !== null) {
            when (intent.action) {
                ACTION_SHOW -> {
                    val taskName = intent.getStringExtra("taskName")!!
                    val formattedTime = intent.getStringExtra("formattedTime")!!
                    val isPaused = intent.getBooleanExtra("isPaused", false)
                    startForeground(1, makeNotif(taskName, formattedTime, isPaused))
                }

                ACTION_STOP -> {

                    scope.launch {
                        handler.stopped.emit(Unit)
                    }
                }
                ACTION_PAUSE ->{
                    scope.launch {
                        handler.paused.emit(Unit)
                    }
                }
                ACTION_DISMISS->{
//                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                        stopForeground(STOP_FOREGROUND_REMOVE)
//                    } else {
//                        @Suppress("DEPRECATION")
//                        stopForeground(true)
//                    }

                    stopSelf()
                }

                else -> Unit

            }
        }
        return START_NOT_STICKY
    }


    private fun makeNotif(taskName: String, formattedTime: String, isPaused:Boolean): Notification {

        val notifBuilder = NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)

        return notifBuilder
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(taskName)
            .setContentText(formattedTime)
            .setOnlyAlertOnce(true)
            .addAction(makeStopAction())
            .addAction(makePauseAction(isPaused))
            .build()
    }

    private fun makeStopAction(): NotificationCompat.Action {
        val stopIntent = Intent(this, this::class.java)
        stopIntent.action = ACTION_STOP
        val stopPendingIntent = PendingIntent
            .getService(this, 1, stopIntent, PendingIntent.FLAG_IMMUTABLE)

        return NotificationCompat
            .Action(R.drawable.baseline_stop_24, "Stop", stopPendingIntent)
    }

    private fun makePauseAction(isPaused: Boolean): NotificationCompat.Action {
        val intent = Intent(this, this::class.java)
        intent.action = ACTION_PAUSE
        val pendingIntent = PendingIntent
            .getService(this, 1, intent, PendingIntent.FLAG_IMMUTABLE)

        return NotificationCompat
            .Action(R.drawable.baseline_stop_24, if (isPaused) "Resume" else "Pause", pendingIntent)
    }

    override fun onBind(intent: Intent?): IBinder? = null

    class Handler{
        val stopped = MutableSharedFlow<Unit>()
        val paused = MutableSharedFlow<Unit>()
    }
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "TimerServiceNotificationChannelID"
        const val ACTION_STOP = "ACTION_STOP"
        const val ACTION_SHOW = "ACTION_SHOW"
        const val ACTION_PAUSE = "ACTION_PAUSE"
        const val ACTION_DISMISS = "ACTION_DISMISS"

        fun showTimer(ctx: Context, taskName: String, formattedTime: String, isPaused: Boolean) {
            val i = Intent(ctx, TimerService::class.java)
            i.action = ACTION_SHOW
            i.putExtra("taskName", taskName)
            i.putExtra("formattedTime", formattedTime)
            i.putExtra("isPaused", isPaused)
            ctx.startService(i)
        }

        fun dismissTimer(ctx: Context) {
            val i = Intent(ctx, TimerService::class.java)
            i.action = ACTION_DISMISS
            ctx.startService(i)
        }

        fun stopTimer(ctx: Context) {
            val i = Intent(ctx, TimerService::class.java)
            i.action = ACTION_STOP
            ctx.startService(i)
        }

//        private fun start(ctx: Context, i: Intent) {
//            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
//                ctx.startForegroundService(i)
//            }
//            ctx.startService(i)
//        }
    }
}