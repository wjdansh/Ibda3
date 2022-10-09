import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Error/Error.dart';
import '../Login/loginModel.dart';
import 'QrModel.dart';

class QrController extends GetxController {
  TextEditingController invoice_NumController;
  TextEditingController invoice_valController;

  String account_number;
  List<QrInfo> _qrInfo;
  List<QrInfo> QrInfoList;
  List<QrInfo> infoList = [];
  double accountBalance = 0;
  ErrorRe _errorRe;
  QrModel _qrModel;
  logInUserModel _userModel;

  @override
  void onInit() async {
    invoice_NumController = TextEditingController();
    invoice_valController = TextEditingController();

    // QrInfoList = await apiCryptography(Global.GQRResult);
    QrInfoList = await apiGetNodeId();

    super.onInit();
  }

  // apiCryptography(String s) async {
  //   print('api get all B is called');
  //   final url =
  //       'http://185.194.124.200:8041/api/Cryptography/Decrypt?cipher=${s}';
  //
  //   Map<String, String> header = {
  //     'Content-Type': 'application/json',
  //     'Authorization': Global.Gtoken,
  //   };
  //   try {
  //     final http.Response response =
  //         await http.get(Uri.parse(url), headers: header);
  //
  //     print(response.statusCode);
  //     print(response.body);
  //     List<infoModel> infoList = [];
  //     if (response.statusCode == 200) {
  //       var data = jsonDecode(response.body);
  //       final mapInfo = Map<String, dynamic>.from(data);
  //       mapInfo.forEach((k, v) => {
  //             (k != 'AccountNum' && k != 'Node Id')
  //                 ? infoList
  //                     .add(infoModel(id: k.toString(), name: v.toString()))
  //                 : (k == 'AccountNum')
  //                     ? {
  //                         account_number = v,
  //                       }
  //                     : print('g'),
  //           });
  //     } else {
  //       infoList.add(infoModel(id: 'no', name: 'no'));
  //     }
  //
  //     return infoList;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Login() async {
    final url = 'http://185.194.124.200:8041/Auth/Login';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };
    var body = jsonEncode(
        <String, String>{'email': 'Admin@app.com', 'password': 'Admin@123'});

    try {
      final http.Response response =
          await http.post(Uri.parse(url), headers: header, body: body);

      print(response.statusCode);
      print(response.body);

      // List<infoModel> infoList = [];
      if (response.statusCode == 200) {
        _userModel = logInUserModelFromJson(response.body);

        Global.Gtoken41 = 'Bearer ' + _userModel.token;
      }
    } catch (e) {
      print(e);
    }
  }

  apiGetNodeId() async {
    await Login();
    // QrInfoList.add(QrInfo(key: 'no', value: 'no'));
    try {
      _qrModel = qrModelFromJson(Global.GQRResult);
      final id = int.parse(_qrModel.nodeId);
      print('api get all B is called');
      final url =
          'http://185.194.124.200:8041/api/ParticipantsTree/GetNodeData/${id}';

      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Authorization': Global.Gtoken41,
      };
      try {
        final http.Response response =
            await http.get(Uri.parse(url), headers: header);

        print(response.statusCode);
        print(response.body);

        if (response.statusCode == 200) {
          _qrInfo = qrInfoFromJson(response.body);
          // var data = jsonDecode(response.body);
          // final mapInfo = Map<String, dynamic>.from(data);
          _qrInfo.forEach((v) => {
                (v.key != 'AccountNumber')
                    ? infoList.add(v)
                    : (v.key == 'AccountNumber')
                        ? {
                            account_number = v.value,
                          }
                        : print('g'),
              });
        } else {
          infoList.add(QrInfo(key: 'no', value: 'no'));
        }
      } catch (e) {
        print(e);
      }
    } catch (e) {
      infoList.add(QrInfo(key: 'no', value: 'no'));
    }
    return infoList;
  }

  Future getBalance(int index) async {
    print("api get my balance called");
    final url = Global.url + 'api/DigitalAccounts/GetBalance';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    try {
      var response = await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        _errorRe = ErrorRe.fromJson(json.decode(response.body));
        _errorRe.hasErrors == true
            ? Global.GetShDialog(
                [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      'assets/images/icons/alreadyAccount.png',
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5, top: 20, bottom: 40),
                    child: Text(
                      _errorRe.validationErrors[0].errors[0],
                      style: TextStyle(
                          color: Get.theme.primaryColor, fontSize: 20),
                    ),
                  ),
                ],
                'OK',
                () {
                  Get.back();
                  Get.back();
                },
              )
            : {
                accountBalance = double.parse(_errorRe.result),
                index == 1
                    ? {
                        (accountBalance <=
                                double.parse(invoice_valController.text))
                            ? Global.GetShDialog(
                                [
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Image.asset(
                                      'assets/images/icons/alreadyAccount.png',
                                      height: 70,
                                      width: 70,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0,
                                        right: 5,
                                        top: 20,
                                        bottom: 40),
                                    child: Column(
                                      children: [
                                        Text(
                                          'The bill is worth more than the current balance!!! \n  Please feed the account to an amount greater than the bill value'
                                              .tr,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'Your current balance is'.tr,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontSize: 20,
                                              inherit: false),
                                        ),
                                        Text(
                                          '$accountBalance',
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              fontSize: 22,
                                              inherit: false),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                'OK',
                                () {
                                  Get.back();
                                  Get.back();
                                },
                              )
                            : double.parse(invoice_valController.text) < 100
                                ? Get.snackbar(
                                    'Note'.tr,
                                    'Please enter a bill value greater than 100'
                                        .tr,
                                    duration: Duration(seconds: 6),
                                    backgroundColor: Color(0xc3cff6fa),
                                    icon: Icon(
                                      Icons.warning,
                                      color: Colors.yellow,
                                    ))
                                : Global.GetShDialog(
                                    [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/images/icons/tax.png',
                                          height: 70,
                                          width: 70,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: 10.0,
                                            right: 10,
                                            top: 20,
                                            bottom: 40),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '${invoice_valController.text} ',
                                                  // textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      // fontWeight:
                                                      //     FontWeight
                                                      //         .bold,
                                                      fontSize: 18),
                                                ),
                                                Text(
                                                  'SPY'.tr,
                                                  // textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      // fontWeight:
                                                      //     FontWeight
                                                      //         .bold,
                                                      fontSize: 14),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'amount will be deducted from your balance '
                                                  .tr,
                                              // textAlign: TextAlign.center,
                                              // overflow: TextOverflow.fade,
                                              // maxLines: 2,
                                              style: TextStyle(
                                                  color: Get.theme.primaryColor,
                                                  // fontWeight:
                                                  //     FontWeight
                                                  //         .bold,
                                                  fontSize: 18),
                                            ),
                                            SizedBox(
                                              height: 40,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'Your current balance is'.tr,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      // fontWeight:
                                                      //     FontWeight
                                                      //         .bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  '${accountBalance} ',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      // fontWeight:
                                                      //     FontWeight
                                                      //         .bold,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  'SPY'.tr,
                                                  // textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Get
                                                          .theme.primaryColor,
                                                      // fontWeight:
                                                      //     FontWeight
                                                      //         .bold,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                    'Agreed',
                                    () {
                                      Get.back();

                                      Get.back();
                                      EPay();
                                      // Confirm = true;
                                      // createDigitalAccount();
                                    },
                                    t2: 'Close',
                                    fun2: () {
                                      Get.back();
                                      Get.back();
                                    },
                                  )
                      }
                    : Global.GetShDialog(
                        [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              'assets/images/icons/tax.png',
                              height: 70,
                              width: 70,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10, top: 20, bottom: 40),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Your current balance is'.tr,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Get.theme.primaryColor,
                                          // fontWeight:
                                          //     FontWeight
                                          //         .bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '${accountBalance} ',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              // fontWeight:
                                              //     FontWeight
                                              //         .bold,
                                              fontSize: 16),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          'SPY'.tr,
                                          // textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Get.theme.primaryColor,
                                              // fontWeight:
                                              //     FontWeight
                                              //         .bold,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                        'OK',
                        () {
                          Get.back();
                          //Get.back();
                        },
                      )
              };
        update();
      } else {
        Get.back();
        Get.back();
        Get.snackbar('Error'.tr, 'Please check Internet connection'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      print(e);
      Get.back();
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

  Future EPay() async {
    print("api called");

    final amount = double.parse(invoice_valController.text);
    final url = Global.url + 'api/DigitalAccounts/EPay';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };

    final body = jsonEncode(<String, String>{
      // "customerAccount": "1000098923",//2010022341
      "sellerAccount": account_number,
      "billNumber": invoice_NumController.text,
      "amount": invoice_valController.text,
    });

    try {
      var response =
          await http.post(Uri.parse(url), headers: header, body: body);

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        _errorRe = ErrorRe.fromJson(json.decode(response.body));
        _errorRe.hasErrors == true
            ? Global.GetShDialog(
                [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Image.asset(
                      'assets/images/icons/alreadyAccount.png',
                      height: 70,
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 5.0, right: 5, top: 20, bottom: 40),
                    child: Text(
                      _errorRe.validationErrors[0].errors[0],
                      style: TextStyle(
                          color: Get.theme.primaryColor, fontSize: 20),
                    ),
                  ),
                ],
                'OK',
                () {
                  Get.back();
                  Get.back();
                },
              )
            : Get.dialog(
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
                                    Text(
                                      'Your current balance is'.tr,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          inherit: false),
                                    ),
                                    Text(
                                      '${accountBalance - double.parse(invoice_valController.text)}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          inherit: false),
                                    ),
                                    Text(
                                      'SPY'.tr,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          inherit: false,
                                          fontSize: 18),
                                    ),
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
          Get.back();
          Get.back();
        });

        update();
      } else {
        Get.back();
        Get.back();
        Get.snackbar('Error'.tr, 'Please check  bb  Internet connection'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      print(e);
      Get.back();
      Get.back();
      Get.snackbar('Error'.tr, 'Please check ff Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }
}
