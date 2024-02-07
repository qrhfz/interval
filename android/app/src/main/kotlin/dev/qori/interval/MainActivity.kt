package dev.qori.interval

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.content.pm.PackageManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        const val FLUTTER_CHANNEL_ID = "interval.qori.dev/notification"
    }

    private var onTimerDismissed:((Unit)->Unit)? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            // Create the NotificationChannel.
            val name = "timer notification"
            val descriptionText = "to show the remaining time when doing a task"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val mChannel = NotificationChannel(TimerService.NOTIFICATION_CHANNEL_ID, name, importance)
            mChannel.description = descriptionText
            // Register the channel with the system. You can't change the importance
            // or other notification behaviors after this.
            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(mChannel)
        }


        val channel = MethodChannel(flutterEngine .dartExecutor.binaryMessenger, FLUTTER_CHANNEL_ID)

        channel.setMethodCallHandler { call, result ->
                when (call.method) {
                    "showTimer" -> handleShowTimer(call)
                    "dismissTimer" -> handleDismissTimer(call)
                    else -> result.notImplemented()
                }
            }

        val onTimerDismissed = {_:Unit->
            channel.invokeMethod("onTimerDismissed", null)
        }
        TimerService.timerDismissedObservable.addSubscriber(onTimerDismissed)
        this.onTimerDismissed = onTimerDismissed

        requestNotificationPermission()
    }

    override fun onDestroy() {
        super.onDestroy()
        val cb = onTimerDismissed
        if (cb!==null){
            TimerService.timerDismissedObservable.removeSubscriber(cb)
        }
    }

    private fun handleShowTimer(call: MethodCall) {
        val taskName = call.argument<String>("taskName")!!
        val formattedDuration = call.argument<String>("formattedDuration")!!
        val isPaused = call.argument<Boolean>("isPaused")!!

        TimerService.showTimer(this, taskName, formattedDuration, isPaused)
    }

    private fun handleDismissTimer(call: MethodCall) {
        TimerService.dismissTimer(this)
    }

    private fun requestNotificationPermission(){
        if (Build.VERSION.SDK_INT<33){
            return
        }
        if (this.checkSelfPermission(Manifest.permission.POST_NOTIFICATIONS)==PackageManager.PERMISSION_GRANTED){
            return
        }
        requestPermissions(arrayOf(Manifest.permission.POST_NOTIFICATIONS),1)
    }
}
