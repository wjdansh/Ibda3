import 'dart:ui';
import 'package:ibda3/resetpassword/resetpassController.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

class firstTime extends StatefulWidget {
  @override
  _firstTimeState createState() => _firstTimeState();
}

class _firstTimeState extends State<firstTime> {
  LocalizationService tran = new LocalizationService();
  String val;
  final _formKey = GlobalKey<FormState>();
  final resetpassController _resetpassController =
      Get.put(resetpassController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/icons/changpass.png',
                    width: Get.width / 2,
                    height: Get.width / 2,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Reset Password'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Global.TF(_resetpassController.currntpassTextController,
                      'Current Password'.tr, TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 16),
                  Global.TF(_resetpassController.NewpassTextController,
                      'New Password'.tr, TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 16),
                  Global.TF(_resetpassController.Newpass2TextController,
                      ' Comfirm New Password'.tr, TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 36),
                  Global.Custom_Botton(
                    'Submit', function: _resetpassController.apirest,
                    //'Questions',
                    formkey: _formKey,
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
