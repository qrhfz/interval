package dev.qori.interval

import android.app.Notification
import android.app.PendingIntent
import android.app.Service
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.IBinder
import androidx.core.app.NotificationCompat

class TimerService : Service() {
    companion object {
        const val NOTIFICATION_CHANNEL_ID = "TimerServiceNotificationChannelID"
        const val ACTION_STOP = "ACTION_STOP"
        const val ACTION_SHOW = "ACTION_SHOW"
        val timerDismissedObservable = Observable<Unit>()

        fun showTimer(ctx: Context, taskName: String, formattedTime: String) {
            val i = Intent(ctx, TimerService::class.java)
            i.action = ACTION_SHOW
            i.putExtra("taskName", taskName)
            i.putExtra("formattedTime", formattedTime)
            start(ctx, i)
        }

        fun dismissTimer(ctx: Context) {
            val i = Intent(ctx, TimerService::class.java)
            i.action = ACTION_STOP
            start(ctx, i)
        }

        private fun start(ctx: Context, i: Intent) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                ctx.startForegroundService(i)
            }
            ctx.startService(i)
        }
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent !== null) {
            when (intent.action) {
                ACTION_SHOW -> {
                    val taskName = intent.getStringExtra("taskName")!!
                    val formattedTime = intent.getStringExtra("formattedTime")!!
                    startForeground(1, makeNotif(taskName, formattedTime))
                }

                ACTION_STOP -> {
                    timerDismissedObservable.notifySubscribers(Unit)
                    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
                        stopForeground(STOP_FOREGROUND_REMOVE)
                    } else {
                        @Suppress("DEPRECATION")
                        stopForeground(true)
                    }
                }

                else -> Unit

            }
        }
        return START_NOT_STICKY
    }


    private fun makeNotif(taskName: String, formattedTime: String): Notification {

        val notifBuilder = NotificationCompat.Builder(this, NOTIFICATION_CHANNEL_ID)

        return notifBuilder
            .setSmallIcon(R.mipmap.ic_launcher)
            .setContentTitle(taskName)
            .setContentText(formattedTime)
            .setOnlyAlertOnce(true)
            .addAction(makeStopAction())
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

    override fun onBind(intent: Intent?): IBinder? = null
}