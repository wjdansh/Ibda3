import 'dart:ui';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'resetpassController.dart';

// ignore: camel_case_types
class resetpasswordview extends StatefulWidget {
  @override
  _resetpasswordviewState createState() => _resetpasswordviewState();
}

class _resetpasswordviewState extends State<resetpasswordview> {
  final resetpassController _resetpassController =
      Get.put(resetpassController());

  LocalizationService tran = new LocalizationService();
  String val;
  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
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
              image: AssetImage(
                Global.lan == 'Arabic'
                    ? 'assets/images/logoAr.png'
                    : 'assets/images/logoEn.png',
              ),
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
                      'Current Password', TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 16),
                  Global.TF(_resetpassController.NewpassTextController,
                      'New Password', TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 16),
                  Global.TF(_resetpassController.Newpass2TextController,
                      'Confirm Password', TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 36),
                  Global.Custom_Botton(
                    'Submit',
                    function: () {
                      _resetpassController.apirest();
                    },
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
