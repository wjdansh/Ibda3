import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'package:http/http.dart' as http;

import 'billerModel.dart';
import 'biller_form_model.dart';
import 'form_model.dart';
import 'infoPayModel.dart';

class billerController extends GetxController {
  TextEditingController accountNumberController;

  List<BilllerModel> billermod;
  RxList<BilllerModel> billerList = RxList();

  String errorBills = '';

  int Id;
  String billerName;
  String billerIcon;
  bool errorB = false;

  double totalUnpaid = 0.0;
  double totalSelected = 0.0;

  @override
  void onInit() async {
    billerList.value = await apiGetBiller();

    super.onInit();
  }

  Future apiGetBiller() async {
    final url1 = 'http://185.194.124.200:8089/api/SEP/AllBillers';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url1), headers: header);

      billermod = billlerModelFromJson(response.body);
      if (response.statusCode == 200) {
        print(billermod);
        return billermod;
      }
      update();
    } catch (e) {
      print(e);
    }
  }
}
