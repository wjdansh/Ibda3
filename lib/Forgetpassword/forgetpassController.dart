import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import '../global/globalVars.dart' as Global;

class forgetpassController extends GetxController {
  TextEditingController userTextController;
  TextEditingController passwordTextController;

  var isLoading = true.obs;
  bool log;
  String PIN;
  ErrorRe err;

  List<dynamic> errorlist;

  @override
  void onInit() {
    userTextController = TextEditingController();
    passwordTextController = TextEditingController();

    super.onInit();
  }

  Future apiforget(body) async {
    print('api rest called');
    final url = Global.url + 'api/Administration/ExternalResetPassword';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };
    try {
      final http.Response response =
          await http.post(Uri.parse(url), headers: header, body: body);
      print(response.statusCode);
      print(response.body);
      err = ErrorRe.fromJson(json.decode(response.body));
      print('ww  ${err.hasErrors}');

      if (response.statusCode == 200 && err.hasErrors == false) {
        Get.back();
        Get.dialog(
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Container(
                width: 100,
                height: 150,
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    image: DecorationImage(
                      image:
                          ExactAssetImage('assets/images/icons/changpass.png'),
                      // fit: BoxFit.contain,
                    )),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 25),
                    child: Text(
                      "Reset Password Successfully",
                      style: TextStyle(
                          color: Colors.white, fontSize: 25, inherit: false),
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
      } else {
        Get.back();
        Get.snackbar('Error'.tr, err.validationErrors[0].errors.toString().tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
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

  // @override
  // void onClose() {

  //   super.onClose();
  // }
}
