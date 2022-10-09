import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import 'package:ibda3/Loanrequest/MilitaryModel.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibda3/api_MyLoans/models/getCustomerModel.dart';

import 'billerModel.dart';
import 'biller_form_model.dart';
import 'form_model.dart';
import 'infoPayModel.dart';

class ServicesController extends GetxController {
  TextEditingController accountNumberController;

  String cityVal;
  String carCatVal;

  List<BilllerModel> billermod;
  List<BilllerModel> billerList;

  String errorBills = '';

  InfoPayModel infoPayMod;
  List<BillingsRec> infoPayList;
  List<BillingsRec> resultList = [];
  //List<BillingsRec> checkedBills;

  RxList<BillerForm> billerFormFields = RxList();
  List<TextEditingController> textControllers =
      List<TextEditingController>.empty(growable: true);

  var selectedValues = <int, String>{}.obs;
  FormModel formValues = new FormModel();

  int Id;
  String billerName;
  String billerIcon;
  bool errorB = false;

  double totalUnpaid = 0.0;
  double totalSelected = 0.0;

  @override
  void onInit() async {
    Id = Get.arguments[0];

    print("id biller $Id");
    billerName = Get.arguments[1];
    billerIcon = Get.arguments[2];

    accountNumberController = TextEditingController();
    // checkedBills = List<BillingsRec>.empty(growable: true);
    // billerList = await apiGetBiller();
    await apiGetFormFields();

    //  infoPayList = await getCustomerBills();

    super.onInit();
  }

  // Future apiGetBiller() async {
  //   final url1 = 'http://185.194.124.200:8089/api/SEP/AllBillers';
  //   Map<String, String> header = {
  //     'Content-Type': 'application/json',
  //     'Authorization': Global.Gtoken,
  //   };
  //   try {
  //     final http.Response response =
  //         await http.get(Uri.parse(url1), headers: header);
  //
  //     //  print(response.statusCode);
  //     // print(response.body);
  //     billermod = billlerModelFromJson(response.body);
  //     if (response.statusCode == 200) {
  //       print(billermod);
  //       //isLoading = false;
  //       //  if (mod.length != 0)
  //       return billermod;
  //       //  else
  //       //  return 1;
  //     }
  //     update();
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future getCustomerBills() async {
    Get.snackbar('1', '1',
        duration: Duration(seconds: 6),
        backgroundColor: Color(0xc3cff6fa),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ));
    // getBills();
    final url = 'http://185.194.124.200:8089/api/SEP/sepbillpresentment';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    Get.snackbar('2', '2',
        duration: Duration(seconds: 6),
        backgroundColor: Color(0xc3cff6fa),
        icon: Icon(
          Icons.error_sharp,
          color: Color(0xff8e0016),
        ));
    var body = {
      "billerId": Id,
      "billerNumber": formValues

      // "98813529456"
    };

    //  getBills();

    try {
      Get.snackbar('3', '3',
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      Get.snackbar('4', '4',
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
      if (response.statusCode == 200) {
        // print(response.body.length);
        // print(response.body);
        Get.snackbar(response.statusCode.toString(), response.body.toString(),
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
        infoPayMod = infoPayModelFromJson(response.body);

        if (infoPayMod.errorCode == "000") {
          print('222 ${infoPayMod}');

          // res.addAll(decoded);

          infoPayMod.billingsRec.forEach((v) {
            //  print('23335566  ${v.account}  .....  ${v}');

            resultList.add(v);
          });
          // resultList.addAll(infoPayMod.billingsRec);
          resultList.forEach((element) {
            totalUnpaid = totalUnpaid + element.dueAmount;
          });
          return resultList;
        } else {
          errorBills = infoPayMod.errorDescription;
          errorB = true;
          return;
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  apiGetFormFields() async {
    final url = 'http://185.194.124.200:8089/api/SEP/BillerInfo?id=$Id';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    try {
      var response = await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);

      if (response.statusCode == 200) {
        billerFormFields.value =
            BillerForm().listFromJson(jsonDecode(response.body));
        billerFormFields.value.forEach((element) {
          if (element.type == "TEXT")
            textControllers.add(new TextEditingController());
          else {
            selectedValues[element.order] = element.inputSelects[0].value;
          }
        });
      } else {
        Get.snackbar('Error'.tr, "can't get fields",
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      print(e);
      Get.snackbar('Error'.tr, 'Please checkout Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  getBills() {
    int index = 0;
    List<FormValue> values = List();
    billerFormFields.forEach((element) {
      if (element.type == "TEXT") {
        selectedValues[element.order] = textControllers[index].text;
        values.add(new FormValue(
            order: element.order,
            value: textControllers[index].text,
            inputId: 0));
        index++;
      } else {
        values.add(FormValue(
            order: element.order,
            inputId: 0,
            value: selectedValues[element.order].toString()));
      }
    });
    formValues.billerId = billerFormFields.value.first.billerId;
    formValues.formValues = values;
    print("field id ${formValues.toJson()}");
  }
}
