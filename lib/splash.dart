import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ibda3/Loanrequest/loanrequest.dart';
import 'package:ibda3/utility/langServices.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import './global/globalVars.dart' as Global;
import 'Loanrequest/LoanStatements.dart';
import 'Login/login_View.dart';
import 'MainPage/MainPage.dart';
import 'Map/map.dart';
import 'Payment/bills.dart';
import 'privacy policy/privacy policy.dart';

class SplashScreen1 extends StatefulWidget {
  static const String id = 'splash_screen';

  @override
  _SplashScreen1State createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  // LocalizationService tran = new LocalizationService();

  @override
  Widget build(BuildContext context) {
    // setState(() {
    //   tran.change(Global.lan);
    // });

    return SplashScreen(
      seconds: 3,
      backgroundColor: Theme.of(context).primaryColor,
      navigateAfterSeconds:
          Global.PP != 'yes' ? privacy_policy() : Login_view(),
      // MyBills(),
      //loanrequest(),
      //  MapPage(),
      //  MainPage(),
      // LoanStatements(),

      image: Image.asset(
        Global.lan == 'Arabic'
            ? 'assets/images/logoAr.png'
            : 'assets/images/logoEn.png',
        height: 300,
        width: 250,
      ),
      loadingText: Text("Starting...",
          style: TextStyle(color: Colors.white, fontSize: 22)),
      photoSize: 170.0,
      loaderColor: Colors.white,
    );
  }
}
