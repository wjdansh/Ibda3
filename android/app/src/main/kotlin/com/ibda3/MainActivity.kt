package com.ibda3

import io.flutter.embedding.android.FlutterActivity

import android.view.WindowManager.LayoutParams
import io.flutter.embedding.engine.FlutterEngine

import android.os.Build
import android.view.ViewTreeObserver
import android.view.WindowManager
import io.flutter.plugins.pathprovider.PathProviderPlugin
import io.flutter.plugin.common.MethodChannel
import kotlin.system.exitProcess


class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        window.addFlags(LayoutParams.FLAG_SECURE)
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android_app_retain").setMethodCallHandler { call, result ->
            if (call.method == "sendToBackground") {
                finishAndRemoveTask();
                result.success(0);
                exitProcess(0);
            }
        }

    }
}



////////////////////////////////////////////////////////////////////////////




//import io.flutter.embedding.android.FlutterActivity
//
//import android.os.Build
//import android.view.ViewTreeObserver
//import android.view.WindowManager
//import io.flutter.plugins.pathprovider.PathProviderPlugin
//
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugin.common.MethodChannel
//import kotlin.system.exitProcess
//
//class MainActivity: FlutterActivity() {
//    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
//        super.configureFlutterEngine(flutterEngine)
//        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android_app_retain").setMethodCallHandler {
//            call, result ->
//            if (call.method == "sendToBackground") {
//                finishAndRemoveTask();
//                result.success(0);
//                exitProcess(0);
//            }
//        }
//    }
//}