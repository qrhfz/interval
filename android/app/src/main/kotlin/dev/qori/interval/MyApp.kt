package dev.qori.interval

import android.app.Application
import io.flutter.app.FlutterApplication
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import org.koin.core.context.startKoin
import org.koin.core.module.dsl.named
import org.koin.core.module.dsl.withOptions
import org.koin.dsl.module

class MyApp: FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        startKoin{
            modules(appModule)
        }
    }

    private val appModule = module{
        single { TimerService.Handler() }

    }
}