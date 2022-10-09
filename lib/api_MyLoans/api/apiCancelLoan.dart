import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:get/get.dart';

import '../MyLoans.dart';

Future apiCancelLoan() async {
  print('api cancel loan called');
  final url = Global.url + 'api/LoanProcess/LoanCancelRequest';
  Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': Global.Gtoken,
  };
  try {
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: header,
      body: jsonEncode(<String, String>{
        'loanProcessId': loanProcess_id.toString(),
        'cancelationReason': cancelationReasonController.text,
      }),
    );
    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      print("StatusCode ! = 200 ${response.statusCode}");
      Get.back();
      Get.snackbar('Error'.tr, 'The request does not send'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    } else if (cancelationReasonController.text.isEmpty) {
      print("controller is empty");
      Get.back();
      Get.snackbar(
          'Reason field can not be empty'.tr, 'Loan has not canceled'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    } else if (response.statusCode == 200) {
      print("StatusCode  = 200");
      print("aaaa $loanProcess_id");
      Get.back();

      Get.snackbar('Sended'.tr, 'The request has sended'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.check_circle,
            color: Colors.green,
          ));
    }
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
