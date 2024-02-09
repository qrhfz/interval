package dev.qori.interval

import android.Manifest
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.pm.PackageManager
import android.media.AudioAttributes
import android.media.MediaPlayer
import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import androidx.lifecycle.lifecycleScope
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.launch
import org.koin.android.ext.android.inject

class MainActivity : FlutterActivity() {
    private val timerServiceHandler: TimerService.Handler by inject()


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

        makeNotificationChannel()
        requestNotificationPermission()
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        setupTimerPlatformChannel(flutterEngine)
        setupAudioPlatformChannel(flutterEngine)
    }

    private fun handleShowTimer(call: MethodCall) {
        val taskName = call.argument<String>("taskName")!!
        val formattedDuration = call.argument<String>("formattedDuration")!!
        val isPaused = call.argument<Boolean>("isPaused")!!

        TimerService.showTimer(this, taskName, formattedDuration, isPaused)
    }

    private fun handleDismissTimer() {
        TimerService.dismissTimer(this)
    }

    private fun handleStopTimer() {
        TimerService.stopTimer(this)
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

    private fun makeNotificationChannel(){
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
    }

    private fun setupTimerPlatformChannel(flutterEngine: FlutterEngine){
        val channel = MethodChannel(flutterEngine .dartExecutor.binaryMessenger, "interval.qori.dev/notification")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "showTimer" -> handleShowTimer(call)
                "stopTimer" -> handleStopTimer()
                "dismissTimer" -> handleDismissTimer()
                else -> result.notImplemented()
            }
        }

        lifecycleScope.launch {
            timerServiceHandler.paused.collect{
                channel.invokeMethod("onTimerPaused", null)
            }
        }

        lifecycleScope.launch {
            timerServiceHandler.stopped.collect{
                channel.invokeMethod("onTimerDismissed", null)
            }
        }
    }

    private fun setupAudioPlatformChannel(flutterEngine: FlutterEngine){
        val bell = audioPlayer("flutter_assets/assets/sounds/bell.ogg")
        val bell2 = audioPlayer("flutter_assets/assets/sounds/bell2.ogg")


        val audioFlutterChannel = MethodChannel(flutterEngine .dartExecutor.binaryMessenger, "interval.qori.dev/audio")
        audioFlutterChannel.setMethodCallHandler { call, result ->
            when(call.method){
                "bell"->{
                    bell.start()
                }
                "bell2"->{
                    bell2.start()
                }
                "setVolume"->{
                    val volume = call.argument<Double>("volume")?.toFloat() ?: return@setMethodCallHandler
                    bell.setVolume(volume, volume)
                    bell2.setVolume(volume, volume)
                }
                else->result.notImplemented()
            }
        }
    }

    private fun audioPlayer(asset:String):MediaPlayer{
        val assetFd = assets.openFd(asset)
        return MediaPlayer().apply {
            setAudioAttributes(
                AudioAttributes.Builder()
                    .setContentType(AudioAttributes.CONTENT_TYPE_SONIFICATION)
                    .setUsage(AudioAttributes.USAGE_MEDIA)
                    .build()
            )

            setDataSource(assetFd)
            prepare()
        }
    }
}
