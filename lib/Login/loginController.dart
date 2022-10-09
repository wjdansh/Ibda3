import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/io_client.dart';
import 'package:http/io_client.dart';
import 'package:ibda3/questions/questionModel.dart';

import '../global/globalVars.dart' as Global;
import 'loginModel.dart';

class LoginController extends GetxController {
  TextEditingController emailTextController;
  TextEditingController passwordTextController;

  TextEditingController usernameTextController;
  TextEditingController password2TextController;
  TextEditingController mobileTextController;

  var isLoading = true.obs;
  bool log;
  // var lan;
  String firstTime;
  String PIN;
  logInUserModel logUserModel;
  logInUserModel logModel;
  Error err;

  List<dynamic> errorlist;
  List<quetionModel> quetionlist;
  @override
  void onInit() {
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    usernameTextController = TextEditingController();
    password2TextController = TextEditingController();
    mobileTextController = TextEditingController();

    super.onInit();
  }

  Future apiLogin() async {
    print('api called');
    final url = Global.url + 'Auth/Login';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };
    try {
      // bool _certificateCheck(X509Certificate cert, String host, int port) =>
      //     host == 'e-services.ibdaabanksyria.com.sy';
      // bool trustSelfSigned = true;
      // HttpClient httpClient = new HttpClient()
      //   ..badCertificateCallback =
      //       ((X509Certificate cert, String host, int port) => trustSelfSigned);
      // IOClient ioClient = new IOClient(httpClient);
      // final http.Response response = await ioClient.post(
      //   Uri.parse(url),
      //   headers: header,
      //   body: jsonEncode(<String, String>{
      //     // 'email': emailTextController.text,
      //     'userName': usernameTextController.text,
      //     'Password': passwordTextController.text,
      //   }),
      // );
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(<String, String>{
          // 'email': emailTextController.text,
          'userName': usernameTextController.text,
          'Password': passwordTextController.text,
        }),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode != 200) {
        // print(err);
        Get.back();
        Get.snackbar('Error'.tr, 'Not a valid email address'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      } else {
        print('121');
        logModel = logInUserModel.fromJson(json.decode(response.body));
        print('121 ${logModel.successed}');
        log = logModel.successed;
        print('121  ');
        if (log) {
          firstTime = Global.parseJwt(logModel.token);

          //print('token   ${firstTime} ');
          firstTime == ' True'
              ? print('ft')
              : firstTime == ' False'
                  ? print('rr')
                  : print('dd');
          print('121');
          if (response.statusCode == 200 && log && firstTime == ' False') {
            Global.Gtoken = 'Bearer ' + logModel.token;
            Global.fTime = false;
            firstTime = Global.parseJwt(logModel.token);

            Global.GPassword = passwordTextController.text;
            Get.back();

            //  Get.toNamed("/otp");
            //////////////////////////////////////
            Get.offAllNamed('/mainpage');
            usernameTextController.clear();
            passwordTextController.clear();
          } else if (response.statusCode == 200 &&
              log &&
              firstTime == ' True') {
            Global.Gtoken = 'Bearer ' + logModel.token;
            Global.fTime = true;

            firstTime = Global.parseJwt(logModel.token);

            Global.GPassword = passwordTextController.text;
            Get.back();
            Get.toNamed('/restpass');
            usernameTextController.clear();
            passwordTextController.clear();
          }
        } else if (response.statusCode == 200 && log == false) {
          Get.back();
          Get.snackbar(
              'Error'.tr,
              'Please check Email & Password '
                  .tr, //logUserModel.errors.toString().tr,
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));
        }
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'Please check Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  Future apiRegister(body) async {
    print('api called');
    final url = Global.url + 'Auth/CustomerRegister';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        //'Auth/Register',
        headers: header,
        body: body,
        // jsonEncode(<String, String>{
        //   'email': emailTextController.text,
        //   // 'Password': passwordTextController.text,
        //   'userName': 'gg', // usernameTextController.text,
        //   'phoneNumber': mobileTextController.text,
        //   // 'confirmPassword': password2TextController.text,
        //   // 'userVerificationAnswers': [
        //   //   {_QuestionsController.firstQuestion}
        //   // ]
        //  }
        //  ),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 400) {
        print('111');

        errorlist = json.decode(response.body);

        Get.back();
        Get.snackbar('Error'.tr, errorlist[0]['errors'].toString(),
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      } else {
        logUserModel = logInUserModel.fromJson(json.decode(response.body));

        Global.Gtoken = logUserModel.token;
        log = logUserModel.successed;
        print('token   ${Global.Gtoken} ');

        if (response.statusCode == 200 && log == false) {
          Get.back();
          Get.snackbar(
              'Error'.tr,
              logUserModel.errors[0]
                  .toString()
                  .tr, // 'Passwords must be at least 6 characters'.tr,
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));
        } else if (response.statusCode == 200 && log) {
          Get.back();
          Get.dialog(
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 25),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/createAccount.png',
                            width: Get.width / 2,
                            height: Get.height / 2.5,
                          ),
                          SizedBox(
                            height: Get.height / 8,
                          ),
                          Text(
                            'Account successfully created \n'
                            'Password will arrive by text message for your number',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                inherit: false),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ),
                ),
              ),
              barrierColor: Colors.black.withOpacity(0.3),
              barrierDismissible: false);

          Future.delayed(Duration(seconds: 5), () {
            Get.back();
            Get.offAllNamed("/login");
          });
        }
      }
      // isLoading(false);
      //   logUserModel = logInUserModel.fromJson(json.decode(response.body));
      //
      //   userListData = logUserModel.data;
      //   // Global.Gtoken = userListData.token as RxString;
      //   logToken = userListData.token.toString();
      //
      //   PIN = userListData.pinCode.toString();
      //
      //   if (response.statusCode == 200 && userListData.firstTime) {
      //     Get.toNamed("/allQuestions", arguments: [
      //       logToken,
      //       passwordTextController.text.toString(),
      //       'false',
      //       PIN
      //     ]);
      //   }
      // else if (response.statusCode == 200 && log == "false") {
      //   Get.back();
      //   Get.snackbar('Error'.tr, 'Please check Email and password'.tr,
      //       duration: Duration(seconds: 6),
      //       // backgroundColor: Color(0xff8e0016).withOpacity(0.2),
      //       backgroundColor: Color(0XFFFFDDDA),
      //       icon: Icon(
      //         Icons.error_sharp,
      //         color: Color(0xff8e0016),
      //       ));
      //   Get.back();
      // }
      //   } else if (response.statusCode == 200 && !logUserModel.data.firstTime) {
      //     // _globalVars.G_token = logToken as RxString;
      //     // _globalVars.G_passWord = passwordTextController.text as RxString;
      //     print(passwordTextController.text);
      //     Get.toNamed('/confirm',
      //         arguments: [logToken, passwordTextController.text]);
      //   }
    } catch (e) {
      print(e);
      Get.back();
      Get.snackbar('Error'.tr, 'Please check Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  // @override
  // void onClose() {

  //   super.onClose();
  // }
}
