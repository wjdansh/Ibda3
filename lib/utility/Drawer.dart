import 'dart:async';

import 'package:animated_drawer/bloc/home_page_bloc.dart';
import 'package:animated_drawer/views/animated_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ibda3/Login/loginController.dart';
import 'package:share/share.dart';
import '../QRcode/QrController.dart';
import '../global/globalVars.dart' as Global;
import 'langServices.dart';

final loanrequestController _loanrequestController =
    Get.put(loanrequestController());
final LoginController _loginController = Get.put(LoginController());
final QrController _qrController = Get.put(QrController());
LocalizationService tran = new LocalizationService();
int initialIndex = Global.lan == 'Arabic' ? 1 : 0;
Timer timer;
drawer(Scaffold scaffold) {
  return AnimatedDrawer(
    homePageXValue: Global.lan == 'Arabic' ? -150 : 150,
    homePageYValue: Global.lan == 'Arabic' ? -80 : 80,
    homePageAngle: Global.lan == 'Arabic' ? 0.2 : -0.2,
    homePageSpeed: 250,
    shadowXValue: Global.lan == 'Arabic' ? -122 : 122,
    shadowYValue: Global.lan == 'Arabic' ? -110 : 110,
    shadowAngle: Global.lan == 'Arabic' ? 0.275 : -0.275,
    shadowSpeed: 550,
    openIcon: Icon(
      Icons.menu_rounded,
      color: Colors.grey,
      size: 40,
    ),
    closeIcon: Icon(
      Icons.menu_open,
      color: Colors.grey,
      size: 40,
    ),
    shadowColor: Color(0xff0EBDC8).withOpacity(0.6),
    backgroundGradient: LinearGradient(
      begin: Alignment.lerp(Alignment.topLeft, Alignment.bottomRight, 0.3),
      //begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.09, 0.4],
      colors: [
        Color(0xff0E2947),
        Color(0xff0EBDC8),
      ],
    ),
    menuPageContent: Padding(
      padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/reguser.png',
                  width: 100,
                  height: Get.width / 5,
                ),
                Row(
                  textDirection: Global.lan == 'Arabic'
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  children: [
                    // Text(
                    //   "User",
                    //   style: TextStyle(
                    //       fontSize: 17,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // Text(
                    //   " Name",
                    //   style: TextStyle(
                    //       fontSize: 17,
                    //       color: Colors.blue[200],
                    //       fontWeight: FontWeight.bold),
                    // )
                    Text(
                      _loanrequestController.Kyc_List != null
                          ? _loanrequestController.Kyc_List.result.firstName
                          : 'First Name'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      _loanrequestController.Kyc_List != null
                          ? _loanrequestController.Kyc_List.result.lastName
                          : 'Last Name'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 22),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              //  Get.toNamed('/profile');
            },
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Container(
            height: Get.height / 1.6,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                //  mainAxisAlignment: MainAxisAlignment.,
                children: [
                  TextButton(
                    child: Text(
                      "Home Screen".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      HomePageBloc().closeDrawer();
                      Get.offAllNamed('/mainpage');
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  // ),

                  TextButton(
                    child: Text(
                      "loan guide".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/LendingGuide');
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  // ),
                  TextButton(
                    child: Text(
                      "saving guide".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/SavingGuide');
                    },
                  ),
                  // FlatButton(
                  //   child: Text(
                  //     "Message".tr,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     Get.toNamed('/Message');
                  //   },
                  // ),
                  TextButton(
                    child: Text(
                      'Complaint'.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/complaint');
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Products'.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('/Products');
                    },
                  ),

                  TextButton(
                    child: Text(
                      "Check Balance".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      print('w ${_qrController.accountBalance}');
                      // Future.delayed(Duration(microseconds: 0), () {
                      //   while (_qrController.accountBalance == 0) {
                      //     Get.dialog(
                      //       Center(
                      //           child: SpinKitFadingCircle(
                      //         color: Get.theme.accentColor,
                      //       )),
                      //       barrierColor: Colors.white.withOpacity(0.5),
                      //     );
                      //   }
                      //   ;
                      // }).then((value) => _qrController.getBalance(0));

                      _qrController.getBalance(0);
                    },
                  ),
                  // FlatButton(
                  //   child: Text(
                  //     "test".tr,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     // Get.toNamed('/QRcode');
                  //     _loanrequestController.apiGetBasicInfo();
                  //   },
                  // ),

                  ExpansionTile(
                    title: Row(
                      children: [
                        Text(
                          "Settings".tr,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          color: Colors.white,
                          // size: 170,
                        ),
                      ],
                    ),
                    //   tilePadding: EdgeInsets.all(1),
                    expandedCrossAxisAlignment: CrossAxisAlignment.start,
                    expandedAlignment: Global.lan == 'Arabic'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    childrenPadding: EdgeInsets.all(1),
                    children: [
                      TextButton(
                        child: Text(
                          'Reset Password'.tr,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {
                          Get.toNamed('/restpass');
                        },
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(bottom: 20),
                      // ),
                    ],
                  ),
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  // ),
                  TextButton(
                    child: Text(
                      "Maps".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      //  Get.toNamed('/map');
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  // ),
                  TextButton(
                    child: Text(
                      "Log Out".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      // _loanrequestController.dispose();
                      // _loanrequestController.onClose();
                      Global.Gtoken = '';
                      HomePageBloc().closeDrawer();
                      Get.offAllNamed('/login');
                    },
                  ),
                  // Padding(
                  //   padding: EdgeInsets.only(bottom: 20),
                  // ),
                  Divider(
                    color: Color(0xff0E2947),
                    thickness: 2,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                        child: Text('Language'.tr,
                            style: TextStyle(
                              color: Colors.white,
                            )),
                        onPressed: () {},
                      ),
                      ToggleSwitch(
                        minWidth: 50.0,
                        minHeight: 30,
                        cornerRadius: 20.0,
                        //  animate: true,
                        activeBgColors: [
                          [
                            Color(0xff0E2947),
                          ],
                          [
                            Color(0xff0E2947),
                          ],
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.grey,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex: initialIndex,
                        totalSwitches: 2,
                        labels: ['EN', 'AR'],
                        radiusStyle: true,
                        onToggle: (index) {
                          //   setState(() {
                          initialIndex = index;
                          // });

                          HomePageBloc().closeDrawer();
                          timer = Timer.periodic(
                              Duration(seconds: 1),
                              (Timer t) => {
                                    index == 1
                                        ? Global.lan = 'Arabic'
                                        : Global.lan = 'English',
                                    tran.change(Global.lan),
                                    timer.cancel(),
                                  });
                          print('switched to: $index');
                        },
                      ),
                    ],
                  ),
                  TextButton(
                    child: Text(
                      "Share app".tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Share.share(
                          'Download our app from link: \n\n https://cutt.ly/cAIiS3N ');
                    },
                  ),

                  TextButton(
                    child: Text("About".tr,
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {
                      Get.toNamed('/About');
                    },
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     //  margin: EdgeInsets.symmetric(vertical: 10),
          //     width: double.infinity,
          //     height: Get.height,
          //     child: Align(
          //       alignment: Global.lan == 'Arabic'
          //           ? Alignment.bottomRight
          //           : Alignment.bottomLeft,
          //       child: Container(
          //         height: Get.height,
          //         child: Row(
          //           //mainAxisSize: MainAxisSize.min,
          //           //  mainAxisAlignment: MainAxisAlignment.end,
          //           textDirection: Global.lan == 'Arabic'
          //               ? TextDirection.rtl
          //               : TextDirection.ltr,
          //           children: [
          //             Tab(
          //               icon: Image.asset(
          //                 'assets/images/icons/web3.png',
          //                 height: Get.height / 25,
          //                 width: Get.height / 25,
          //               ),
          //               // color: Colors.white,
          //             ),
          //             SizedBox(
          //               width: 2,
          //             ),
          //             RichText(
          //               text: new TextSpan(
          //                 children: [
          //                   new TextSpan(
          //                     text: 'www.ibdaa.com',
          //                     style: new TextStyle(
          //                         color: // Colors.blue,
          //                             Color(0xff2a66a7),
          //                         fontSize: 20,
          //                         letterSpacing: 2,
          //                         decoration: TextDecoration.underline),
          //                     recognizer: new TapGestureRecognizer()
          //                       ..onTap = () {
          //                         launch('http://madarat.ois-sy.com:3090');
          //                       },
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    ),
    homePageContent: scaffold,
  );
}
