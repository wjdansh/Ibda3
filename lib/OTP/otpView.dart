import 'dart:ui';

import 'package:ibda3/Loanrequest/LoanrequestController.dart';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

final loanrequestController _loanrequestController =
    Get.put(loanrequestController());

// ignore: camel_case_types
class otpview extends StatefulWidget {
  @override
  _otpviewState createState() => _otpviewState();
}

class _otpviewState extends State<otpview> {
  TextEditingController otpTextController = TextEditingController();

  LocalizationService tran = new LocalizationService();
  String val;
  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  @override
  Widget build(BuildContext context) {
    _loanrequestController.onInit();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Theme.of(context).secondaryHeaderColor,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          flexibleSpace: Center(
            child: Image(
              height: 100,
              width: 150,
              image: AssetImage(Global.lan == 'Arabic'
                  ? 'assets/images/logoAr.png'
                  : 'assets/images/logoEn.png'),
              // fit: BoxFit.scaleDown,
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/icons/otp.png',
                    width: Get.width / 2,
                    height: Get.width / 2,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Code sent by SMS message'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    ' Enter the Code'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Global.TF(
                      otpTextController, 'OTP'.tr, TextInputType.number, false,
                      icon: "mobile"),
                  SizedBox(height: 16),
                  Global.Custom_Botton(
                    'Submit',
                    function: () => Get.offAllNamed('/mainpage'),
                    //'mainpage',
                    formkey: _formKey,
                  ),
                  // MaterialButton(
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: new BorderRadius.circular(30.0),
                  //   ),
                  //   color: Theme.of(context).secondaryHeaderColor,
                  //   splashColor: Colors.white,
                  //   height: 50,
                  //   minWidth: Get.width / 2,
                  //   child: Text(
                  //     'Submit'.tr,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  //   onPressed: () {
                  //     if (_formKey.currentState.validate()) {
                  //       // _loginController.isLoading
                  //       //                                 ? showDialog(
                  //       //                                     context: context,
                  //       //                                     child: CircularProgressIndicator())
                  //       //                                 :
                  //
                  //       bool isLoading;
                  //       if (isLoading = true) {
                  //         showDialog(
                  //             builder: (context) => Center(
                  //                     child: SpinKitFadingCircle(
                  //                   color: Color(0xff8e0016),
                  //                 )),
                  //             barrierColor: Colors.white.withOpacity(0.5),
                  //             context: context);
                  //       }
                  //       // Get.offNamed(page);
                  //
                  //       // if (_loginController.isLoading = false) {
                  //       //
                  //       // print('login');
                  //       //
                  //       // _loginController.apiLogin();
                  //     }
                  //   },
                  // ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () {},
                        color: Theme.of(context).accentColor,
                      ),
                      TextButton(
                        // splashColor: Colors.white,
                        onPressed: () {},
                        child: Text(
                          'ReSend Code'.tr,
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 16,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
