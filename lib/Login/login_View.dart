import 'dart:ui';
import 'package:flutter/rendering.dart';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'loginController.dart';

// ignore: camel_case_types
class Login_view extends StatefulWidget {
  @override
  _Login_viewState createState() => _Login_viewState();
}

class _Login_viewState extends State<Login_view> {
  final LoginController _loginController = Get.put(LoginController());
  LocalizationService tran = new LocalizationService();
  String val;

  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(top: 70, bottom: 20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButtonHideUnderline(
                    child: Padding(
                      padding: EdgeInsets.only(right: 8, bottom: 15
                          //left: MediaQuery.of(context).size.width / 1.4
                          ),
                      //alignedDropdown: true,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: DropdownButton<dynamic>(
                          hint: Text(
                            'AR/EN',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                            textAlign: TextAlign.end,
                          ),
                          //isExpanded: true,

                          //underline: SizedBox(),
                          icon: Icon(
                            Icons.language,
                            color: Colors.white,
                            size: 30,
                          ),
                          onChanged: (val) {
                            setState(() {
                              Global.lan = val.toString(); //.substring(0, 2);
                              tran.change(val);
                              // _loginController.lan = val;
                              // tran.change(_loginController.lan);
                            });
                          },
                          items: tran.langs.map((item) {
                            return DropdownMenuItem(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Icon(item == 'Arabic'
                                  //     ?
                                  Container(
                                    width: 25,
                                    height: 30,
                                    child: item == 'Arabic'
                                        ? Image.asset("assets/images/sy.jpg")
                                        : Image.asset("assets/images/en.jpg"),
                                  ),
                                  Text(item),
                                ],
                              ),
                              value: item.toString(),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 40,
                      right: 40,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          Global.lan == 'Arabic'
                              ? 'assets/images/logoAr.png'
                              : 'assets/images/logoEn.png',
                          width: Get.width / 3,
                          height: Get.width / 5,
                        ),
                        SizedBox(height: 10),
                        img(),
                        SizedBox(height: 10),

                        Text(
                          login == true ? 'Login'.tr : 'Register'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.7),
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        // Global.TF(_loginController.emailTextController, 'Email'.tr,
                        //     TextInputType.emailAddress, false,
                        //     icon: "user"),
                        // SizedBox(height: 16),
                        // Global.TF(_loginController.usernameTextController,
                        //     ' User Name'.tr, TextInputType.text, false,
                        //     icon: "user"),

                        // SizedBox(height: 16),
                        Global.TF(_loginController.usernameTextController,
                            'User Name', TextInputType.text, false,
                            icon: "user"),
                        SizedBox(height: 16),
                        //  reguser(),
                        login == true
                            ? Global.TF(_loginController.passwordTextController,
                                'password', TextInputType.text, true,
                                icon: "password")
                            : Global.TF(_loginController.mobileTextController,
                                'Mobile', TextInputType.number, false,
                                icon: "mobile"),

                        SizedBox(height: 16),
                        //  reg(),
                        SizedBox(height: 10),
                        login == true
                            ? Global.Custom_Botton('Login',
                                function: _loginController.apiLogin,
                                formkey: _formKey)
                            : Global.Custom_Botton('Next',
                                function: () => {
                                      Get.back(),
                                      Get.toNamed('/Questions'),
                                      Global.register = true
                                    }, //_loginController.apiRegister,
                                formkey: _formKey),
                        // MaterialButton(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: new BorderRadius.circular(30.0),
                        //   ),
                        //   color: Theme.of(context).secondaryHeaderColor,
                        //   splashColor: Colors.white,
                        //   height: 50,
                        //   minWidth: Get.width / 2,
                        //   child: Text(
                        //     login == true ? 'Login'.tr : 'Register'.tr,
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
                        //       Get.offNamed('/otp');
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
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextButton(
                            // splashColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                login = !login;
                              });
                              _loginController.emailTextController.clear();
                              _loginController.passwordTextController.clear();
                            },
                            child: Text(
                              login == true ? 'Create Account'.tr : 'Login'.tr,
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 16,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          forget(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  reg() {
    if (login == false) {
      return Column(
        children: [
          Global.TF(_loginController.password2TextController,
              ' Comfirm Password'.tr, TextInputType.text, true,
              icon: "password"),
          SizedBox(height: 16),
          Global.TF(_loginController.mobileTextController, 'Mobile'.tr,
              TextInputType.number, false,
              icon: "mobile"),
        ],
      );
    } else
      return SizedBox(height: 20);
  }

  reguser() {
    if (login == false) {
      return Column(
        children: [
          Global.TF(_loginController.usernameTextController, 'User Name',
              TextInputType.text, false,
              icon: "user"),
          SizedBox(height: 16),
        ],
      );
    } else
      return SizedBox(height: 1);
  }

  img() {
    if (login == false) {
      return Image.asset(
        'assets/images/reguser.png',
        width: 100,
        height: Get.width / 5,
      );
    } else
      return SizedBox(height: 80);
  }

  forget() {
    if (login == true) {
      return TextButton(
        // splashColor: Colors.white,
        onPressed: () {
          Get.toNamed('/forgetpass');
        },
        child: Row(
          children: [
            Text(
              '|',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 16,
              ),
            ),
            Text(
              'Forget Password'.tr,
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
          ],
        ),
      );
    } else {
      return Text(
        ' ',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 16,
        ),
      );
    }
  }
}
