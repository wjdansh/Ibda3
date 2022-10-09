import 'dart:ui';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'forgetpassController.dart';

// ignore: camel_case_types
class forgetpasswordview extends StatefulWidget {
  @override
  _forgetpasswordviewState createState() => _forgetpasswordviewState();
}

class _forgetpasswordviewState extends State<forgetpasswordview> {
  final forgetpassController _forgetpassController =
      Get.put(forgetpassController());

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
        padding: EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/icons/changpass.png',
                    width: Get.width / 1.5,
                    height: Get.width / 1.5,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'forget Password'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 30),
                  Global.TF(_forgetpassController.userTextController,
                      'User Name'.tr, TextInputType.text, false,
                      icon: "user"),
                  SizedBox(height: 30),
                  Global.TF(_forgetpassController.passwordTextController,
                      'New password'.tr, TextInputType.text, true,
                      icon: "password"),
                  SizedBox(height: 36),
                  Global.Custom_Botton(
                    'Next',
                    function: () {
                      Global.register = false;
                      Get.back();
                      Get.toNamed('/Questions');
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
