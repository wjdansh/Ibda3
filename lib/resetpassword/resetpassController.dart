import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import 'package:ibda3/Login/loginModel.dart';
import 'package:ibda3/firstTime/firstTime.dart';
import '../global/globalVars.dart' as Global;

class resetpassController extends GetxController {
  TextEditingController currntpassTextController;
  TextEditingController NewpassTextController;
  TextEditingController Newpass2TextController;
  var isLoading = true.obs;
  bool log;
  String PIN;
  ErrorRe err;
  // ErrorR errorR;
  ErrorRResult errorR;
  logInUserModel logUserModel;

  List<dynamic> errorlist;

  @override
  void onInit() {
    currntpassTextController = TextEditingController();
    NewpassTextController = TextEditingController();
    Newpass2TextController = TextEditingController();

    super.onInit();
  }

  Future apirest() async {
    print('api called');
    final url = Global.url + 'api/Administration/ResetPassword';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(<String, String>{
          'currentPassword': currntpassTextController.text,
          'password': NewpassTextController.text,
          'passwordConfirm': Newpass2TextController.text,
        }),
      );
      print(response.statusCode);
      print(response.body);

      if (Global.GPassword != currntpassTextController.text) {
        Get.back();
        Get.snackbar(
          'currentPassError'.tr,
          'old password not correct'.tr,
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ),
        );
        return;
      } else if (NewpassTextController.text != Newpass2TextController.text) {
        Get.back();
        Get.snackbar(
          'newpassError'.tr,
          'NewPassword not match'.tr,
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ),
        );
        print('not equal');
        return;
      } else if (NewpassTextController.text == currntpassTextController.text) {
        Get.back();
        Get.snackbar(
          'newpassError'.tr,
          'the new password should not equal the old password'.tr,
          backgroundColor: Color(0xc3cff6fa),
          duration: Duration(seconds: 6),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ),
        );

        return;
      }
      // else if (response.statusCode != 200) {
      //   print('11 ');
      //   err_2 = ErrorR.fromJson(json.decode(response.body));
      //   print('22  ${err_2.errors.toString()}');
      //   Get.snackbar(
      //       'Error'.tr,
      //       err_2.errors[0]
      //           .toString()
      //           .tr, // 'Passwords must be at least 6 characters'.tr,
      //       duration: Duration(seconds: 6),
      //       backgroundColor: Color(0XFFFFDDDA),
      //       icon: Icon(
      //         Icons.error_sharp,
      //         color: Color(0xff8e0016),
      //       ));
      // }
      else if (response.statusCode == 200) {
        print('22');
        // print('232 ${response.body.split('}')[0]}' + '}]}');
        // var d = response.body.split('}')[0] + '}]}';
        errorR = ErrorRResult.fromJson(json.decode(response.body));
        print('33 ${errorR.hasErrors}');
        //print('232 ${errorR.result.validationErrors[0]['errors'][0]}');
        if (errorR.hasErrors == false) {
          Get.back();
          Get.back();
          Global.GPassword = NewpassTextController.text;
          Get.snackbar("  ", 'Password changed successfully'.tr,
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.check_circle,
                color: Colors.green,
              ));
        } else {
          print('234');
          Get.back();
          Get.snackbar(
              'Error'.tr,
              errorR.validationErrors[0]['errors'][0]
                  .toString()
                  .tr, // 'Passwords must be at least 6 characters'.tr,
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));
        }
      } else {
        //Get.back();
        Get.snackbar(
            'Error'.tr,
            logUserModel.errors
                .toString()
                .tr, // 'Passwords must be at least 6 characters'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
      //     if (response.statusCode != 200) {
      //       print(err);
      //       Get.back();
      //       Get.snackbar('Error'.tr, 'Not a valid email address'.tr,
      //           duration: Duration(seconds: 6),
      //           backgroundColor: Color(0XFFFFDDDA),
      //           icon: Icon(
      //             Icons.error_sharp,
      //             color: Color(0xff8e0016),
      //           ));
      //     } else {
      //       logUserModel = logInUserModel.fromJson(json.decode(response.body));
      //       log = logUserModel.successed;
      //
      //       if (response.statusCode == 200 && log == true) {
      //         Global.Gtoken = logUserModel.token;
      //         Get.back();
      //         Get.toNamed("/otp");
      //         emailTextController.clear();
      //         passwordTextController.clear();
      //       } else if (response.statusCode == 200 && log == false) {
      //         Get.back();
      //         Get.snackbar('Error'.tr, logUserModel.errors.toString().tr,
      //             duration: Duration(seconds: 6),
      //             backgroundColor: Color(0XFFFFDDDA),
      //             icon: Icon(
      //               Icons.error_sharp,
      //               color: Color(0xff8e0016),
      //             ));
      //       }
      //     }
    } catch (e) {
      Get.back();
      Get.snackbar(
          'Error'.tr,
          // logUserModel.errors
          //     .toString()
          ''.tr, // 'Passwords must be at least 6 characters'.tr,
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
