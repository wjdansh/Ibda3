import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'billerModel.dart';
import 'biller_form_model.dart';
import 'form_model.dart';
import 'infoPayModel.dart';

class billesController extends GetxController {
  TextEditingController accountNumberController;

  List<BilllerModel> billermod;
  List<BilllerModel> billerList;

  String errorBills = '';

  InfoPayModel infoPayMod;
  PayModel PayMod;
  RxList<BillingsRec> infoPayList = RxList();
  List<BillingsRec> resultList = [];
  RxList<BillingsRec> checkedBills = RxList();
  RxList<bool> isChecked = RxList();

  FormModel formValues;

  int Id;
  String billerName;
  String billerIcon;
  bool errorB = false;

  RxDouble totalUnpaid = 0.0.obs;
  int unpaided = 0;
  RxDouble totalSelected = 0.0.obs;

  @override
  void onInit() async {
    formValues = Get.arguments[0];

    checkedBills.value = List<BillingsRec>.empty(growable: true);
    infoPayList.value = await getCustomerBills();
    isChecked.value = List<bool>.filled(infoPayList.length, false).obs;

    super.onInit();
  }

  Future getCustomerBills() async {
    final url = 'http://185.194.124.200:8089/api/SEP/presentment';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    // 98813489000
    var body = formValues;
    print("body: ${jsonEncode(body)}");

    //  getBills();
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        print("response body: ${response.body}");
        infoPayMod = infoPayModelFromJson(response.body);
        print("infoPayMod: ${infoPayMod.toString()}");

        if (infoPayMod.errorCode == "000") {
          print("billingsRec ${infoPayMod.billingsRec.toString()}");
          resultList = infoPayMod.billingsRec;
          resultList.forEach((element) {
            if (element.billStatus == "BillNew") {
              unpaided++;
              totalUnpaid.value = totalUnpaid.value + element.dueAmount;
            }
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

  void onBillSelected(int index, bool isSelected) {
    isChecked.value[index] = isSelected;
    isChecked.value[index] == true
        ? checkedBills.value.add(infoPayList[index])
        : checkedBills.value.remove(infoPayList[index]);
    totalSelected.value = checkedBills
        .map((e) => e.dueAmount)
        .fold(0.0, (previousValue, element) => previousValue + element);
  }

  Future payBills() async {
    final url = 'http://185.194.124.200:8089/api/SEP/seppayment';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    // 98813489000
    var body = {
      "billerid": formValues.billerId,
      "accountNumber": "",
      "bkBillingsReco": checkedBills.value
    };
    print("body: ${jsonEncode(body)}");

    //  getBills();
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(body),
      );
      // Get.snackbar(response.statusCode.toString(), response.body.toString(),
      //     duration: Duration(seconds: 6),
      //     backgroundColor: Color(0xc3cff6fa),
      //     icon: Icon(
      //       Icons.error_sharp,
      //       color: Color(0xff8e0016),
      //     ));
      if (response.statusCode == 200) {
        PayMod = payModelFromJson(response.body);

        if (PayMod.errorcode == "00") {
          Get.back();
          Get.dialog(
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 75,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 25),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/icons/andone.gif',
                            width: Get.width / 2,
                            height: Get.height / 2.5,
                          ),
                          SizedBox(
                            height: Get.height / 12,
                          ),
                          Column(
                            children: [
                              Text(
                                'Payment Done'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    inherit: false),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 300,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        '${PayMod.description}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            inherit: false),
                                        maxLines: 5,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   '${}',
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       fontSize: 20,
                                  //       inherit: false),
                                  // ),
                                  // Text(
                                  //   'SPY'.tr,
                                  //   // textAlign: TextAlign.center,
                                  //   style: TextStyle(
                                  //       color: Colors.white,
                                  //       inherit: false,
                                  //       fontSize: 18),
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              barrierColor: Colors.black.withOpacity(0.3),
              barrierDismissible: false);
          Future.delayed(Duration(seconds: 5), () {
            Get.back();
            Get.offAllNamed('/mainpage');
          });
        } else {
          Get.back();
          Get.snackbar('Error', PayMod.description,
              duration: Duration(seconds: 6),
              backgroundColor: Color(0xc3cff6fa),
              icon: Icon(
                Icons.error_sharp,
                color: Color(0xff8e0016),
              ));

          return;
        }
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Error', e.toString(),
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }
}
