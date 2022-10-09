import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';
import '../Guides/LendingGuideView.dart';
import '../global/globalVars.dart' as Global;

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class privacy_policy extends StatefulWidget {
  @override
  _privacy_policyState createState() => _privacy_policyState();
}

class _privacy_policyState extends State<privacy_policy> {
  String val;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 10, bottom: 20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            // key: _formKey,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    Global.lan == 'Arabic'
                        ? 'assets/images/logoAr.png'
                        : 'assets/images/logoEn.png',
                    width: 180,
                    height: 70,
                  ),
                ),
                // SizedBox(height: 20),
                Expanded(
                  flex: 10,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      //  height: MediaQuery.of(context).size.height / 1.5,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Theme.of(context)
                            .primaryColor, //Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(40),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black,
                        //       offset: Offset(0, 10),
                        //       blurRadius: 10),
                        // ]
                      ),
                      // child: SingleChildScrollView(
                      //   physics: NeverScrollableScrollPhysics(),

                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 6),
                            Text(
                              'Privacy policy'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors
                                    .white, //Theme.of(context).primaryColor,
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(height: 6),
                            buildPP(
                              context,
                              'General Terms of Participation in Electronic Banking Tariffs',
                              t1: 'Bank',
                              t2: 'Bank:dis',
                              t3: 'location',
                              t4: 'location:dis',
                              t5: 'application',
                              t6: 'application:dis',
                              t7: 'client',
                              t8: 'client:dis',
                              t9: 'Electronic Banking',
                              t10: 'Electronic Banking:dis',
                              t11: 'Provision of services',
                              t12: 'Provision of services:dis',
                              t13: 'Customer Obligations',
                              t14: 'Customer Obligations:dis',
                              t15: 'Ibdaa Obligations',
                              t16: 'Ibdaa Obligations:dis',
                              t17: 'Transfer of information',
                              t18: 'Transfer of information:dis',
                              t19: 'Limitation of Liability',
                              t20: 'Limitation of Liability:dis',
                              t21: 'Risk of loss',
                              t22: 'Risk of loss:dis',
                              t23: 'Compensation',
                              t24: 'Compensation:dis',
                              t25: 'Transaction Registration',
                              t26: 'Transaction Registration:dis',
                              t27: 'Property Rights',
                              t28: 'Property Rights:dis',
                              t29:
                                  'Termination of subscription to electronic banking services',
                              t30:
                                  'Termination of subscription to electronic banking services:dis',
                            ),

                            // buildSguide(
                            //   context,
                            //   'General Terms of Participation in Electronic Banking Tariffs',
                            //   t1: '',
                            //   t2: 'Bank',
                            //   t3: '',
                            //   t4: 'Bank:dis',
                            //   t5: 'location',
                            //   t6: '',
                            //   t7: 'location:dis',
                            //   t8: 'application',
                            //   t9: '',
                            //   t10: 'application:dis',
                            //   t11: 'client',
                            //   t12: 'client:dis',
                            //   t13: 'Electronic Banking',
                            //   t14: 'Electronic Banking:dis',
                            // ),
                            // buildSguide(
                            //   context,
                            //   ' ',
                            //   t1: ' ',
                            //   t2: 'Provision of services',
                            //   t3: '',
                            //   t4: 'Provision of services:dis',
                            //   t5: 'Customer Obligations',
                            //   t6: '',
                            //   t7: 'Customer Obligations:dis',
                            //   t8: 'Ibdaa Obligations',
                            //   t9: '',
                            //   t10: 'Ibdaa Obligations:dis',
                            //   t11: 'Transfer of information',
                            //   t12: 'Transfer of information:dis',
                            //   t13: 'Limitation of Liability',
                            //   t14: 'Limitation of Liability:dis',
                            // ),
                            // buildSguide(
                            //   context,
                            //   ' ',
                            //   t1: '',
                            //   t2: 'Risk of loss',
                            //   t3: '',
                            //   t4: 'Risk of loss:dis',
                            //   t5: 'Compensation',
                            //   t6: '',
                            //   t7: 'Compensation:dis',
                            //   t8: 'Transaction Registration',
                            //   t9: '',
                            //   t10: 'Transaction Registration:dis',
                            //   t11: 'Property Rights',
                            //   t12: 'Property Rights:dis',
                            //   t13:
                            //       'Termination of subscription to electronic banking services',
                            //   t14:
                            //       'Termination of subscription to electronic banking services:dis',
                            // ),
                            // buildSguide(
                            //   context,
                            //   'Identification Methods',
                            //   t3: 'Enter codes',
                            //   t4: 'Enter codes:dis',
                            //   t6: 'Symbols are confidential',
                            //   t7: 'Symbols are confidential:dis',
                            //   t9: 'signature',
                            //   t10: 'signature:dis',
                            // ),
                            // buildSguide(
                            //   context,
                            //   'user rights',
                            //   t1: 'user rights:dis',
                            //   t2: 'User infringement of usage policy',
                            //   t4: 'User infringement of usage policy:dis',
                            //   t5: 'Amend User Policy',
                            //   t7: 'Amend User Policy:dis',
                            // ),
                          ],
                        ),
                      ),

                      // ),
                    ),
                  ),
                ),

                // SizedBox(height: 10),

                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Accept'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              splashRadius: 0.8,
                              activeColor: Colors.white,
                              focusColor: Colors.white,
                              value: 'yes',
                              groupValue: val,
                              onChanged: (newVal) {
                                setState(() {
                                  val = newVal;
                                });

                                accept();
                              },
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            'Not Accept'.tr,
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          leading: Transform.scale(
                            scale: 1.5,
                            child: Radio(
                              hoverColor: Colors.white,
                              activeColor: Colors.white,
                              focusColor: Colors.white,
                              value: 'no',
                              groupValue: val,
                              onChanged: (newVal) {
                                setState(() {
                                  val = newVal;
                                });

                                accept();
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void accept() async {
    if (val == "yes") {
      Get.offAllNamed('/login');
      //  Get.offAllNamed('/mainpage');

      await addStringToSF();
    } else
      exit(0);
  }

  addStringToSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String decision = val;
    prefs.setString('xx', val);
  }

  buildPP(
    BuildContext context,
    String title, {
    String t1 = '',
    String t2 = '',
    String t3 = '',
    String t4 = '',
    String t5 = '',
    String t6 = '',
    String t7 = '',
    String t8 = '',
    String t9 = '',
    String t10 = '',
    String t11 = '',
    String t12 = '',
    String t13 = '',
    String t14 = '',
    String t15 = '',
    String t16 = '',
    String t17 = '',
    String t18 = '',
    String t19 = '',
    String t20 = '',
    String t21 = '',
    String t22 = '',
    String t23 = '',
    String t24 = '',
    String t25 = '',
    String t26 = '',
    String t27 = '',
    String t28 = '',
    String t29 = '',
    String t30 = '',
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              // height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 5, top: 65, right: 5, bottom: 20),
              //  margin: EdgeInsets.only(top: 45),
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Theme.of(context).accentColor),
                  //  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.transparent,
                        offset: Offset(0, 10),
                        blurRadius: 10),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    RichText(
                      text: new TextSpan(
                        children: [
                          WidgetSpan(
                            child: Row(
                              children: [
                                Text(t1.tr,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          WidgetSpan(
                              child: Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t2.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Row(
                              children: [
                                Text(t3.tr,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t6.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Row(
                              children: [
                                Text(t7.tr,
                                    style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontSize: 16,
                                    )),
                              ],
                            ),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t8.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t9.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t10.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t11.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t12.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t13.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t14.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t15.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t16.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t17.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t18.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t19.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t20.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t21.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t22.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t23.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t24.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t25.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t26.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t27.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t28.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                          WidgetSpan(
                            child: Text(t29.tr,
                                style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                )),
                          ),
                          WidgetSpan(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(t30.tr,
                                style: new TextStyle(
                                  color: Colors.white,
                                  // color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16,
                                  //letterSpacing: 2,
                                )),
                          )),
                        ],
                      ),
                    ),
                    // Text(
                    //   description,
                    //   style: TextStyle(color: Colors.white, fontSize: 18),
                    //   textAlign: TextAlign.start,
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            right: 30,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              child: Container(
                padding: const EdgeInsets.only(top: 10.0),
                color: Theme.of(context).primaryColor,
                child: Text(
                  title.tr,
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  // textDirection:
                  //     !isRTL(title) ? TextDirection.rtl : TextDirection.ltr,
                ),
              ),
            ),
          ),
          // Positioned(
          //   // left: 75,
          //   // right: 75,
          //   // top: 15,
          //   // bottom: 80,
          //   left: 75,
          //   right: 75,
          //   top: 175,
          //   bottom: 175,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.all(Radius.circular(20)),
          //     child: Container(
          //       color: Theme.of(context).primaryColor,
          //       child: Center(
          //         child: Text(
          //           title,
          //           style: TextStyle(
          //             color: Theme.of(context).accentColor,
          //             fontSize: 16,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   // )
          // ),
        ],
      ),
    );
  }
}
