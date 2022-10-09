import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ibda3/provideri.dart';
import 'package:ibda3/splash.dart';
import 'package:provider/provider.dart';
import './utility/langServices.dart';
import 'utility/routes.dart';
import './global/globalVars.dart' as Global;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Global.privacPolicy();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    HttpOverrides.global = new MyHttpOverrides();
    runApp(ibda3());
  });
  // runApp(MyApp());
}

class ibda3 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var _androidAppRetain = MethodChannel("android_app_retain");
        print("on will pop");
        try {
          if (Platform.isAndroid) {
            print("plateform is android");
            if (Navigator.of(context).canPop()) {
              print("can pop");
              return Future.value(true);
            } else {
              var result =
                  await _androidAppRetain.invokeMethod("sendToBackground");
              print("result is $result");
              return Future.value(false);
            }
          } else {
            print("plateform is ios");
            return Future.value(true);
          }
        } catch (e) {
          print("Error: $e");
          return Future.value(true);
        }
      },
      child: ChangeNotifierProvider<provideri>(
        create: (_) => provideri(),
        child: GetMaterialApp(
          title: 'Al Ibdaa',
          debugShowCheckedModeBanner: false,
          defaultTransition: Transition.upToDown,
          getPages: viewsRouter.route,
          initialRoute: '/SplashScreen',
          locale: LocalizationService.locale,
          fallbackLocale: LocalizationService.fallbackLocale,
          translations: LocalizationService(),
          theme: ThemeData(
            scaffoldBackgroundColor: Color(0xff0E2947),
            //primarySwatch: Colors.lightGreen,
            primaryColor: Color(0xff0E2947),
            accentColor: Color(0xff92ca64),
            secondaryHeaderColor: Color(0xff0EBDC8),
            unselectedWidgetColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
