import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/questions/questionController.dart';
import 'package:ibda3/questions/questionModel.dart';
import '../global/globalVars.dart' as Global;

class MessageController extends GetxController {
  TextEditingController messageTextController;

  var isLoading = true.obs;
  bool log;
  String firstTime;
  String PIN;

  Error err;

  List<dynamic> errorlist;
  List<quetionModel> quetionlist;
  @override
  void onInit() {
    messageTextController = TextEditingController();

    super.onInit();
  }

  Future apiMessage() async {
    print('api called');
    final url = Global.url + 'api/CustomerContacts/AddMessage';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(<String, String>{
          //  "title": emailTextController.text,
          'description': messageTextController.text,
        }),
      );
      print(response.statusCode);
      print(response.body);

      if (response.statusCode != 200) {
        Get.back();
        Get.snackbar('Error'.tr, 'Message not sent '.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0XFFFFDDDA),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      } else {
        messageTextController.clear();
        Get.back();
        Get.back();
        Get.snackbar('Done'.tr, 'Message sent successfully'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.check_circle,
              color: Colors.green,
            ));
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'Please check Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0XFFFFDDDA),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }
}
