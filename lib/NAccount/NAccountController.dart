import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import 'package:ibda3/Loanrequest/MilitaryModel.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibda3/api_MyLoans/models/getCustomerModel.dart';

class NAccountController extends GetxController {
  String valBranch;
  String valAccountType;

  List<LoanOfficerModel> Branchmod;
  List<LoanOfficerModel> Branchlist;
  ErrorRe result;
  ErrorRe resultt;

  @override
  void onInit() async {
    Branchlist = await apiGetBranches();
    //   resultt = await apiGetBAccount();
    super.onInit();
  }

  Future apiGetBranches() async {
    print('api get all B is called');
    final url = Global.url + 'api/Branches/IndexGet';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.https(url, ''), // Uri.parse(url),
              headers: header);

      print(response.statusCode);
      print(response.body);
      Branchmod = LoanOfficerModelFromJson(response.body);
      if (response.statusCode == 200) {
        //  print(LoanOfficermod);
        //isLoading = false;
        print(' B is');
        return Branchmod;
      }
    } catch (e) {
      print(e);
    }
  }

  Future apiGetBAccount() async {
    print('api get all B is called');
    final url = Global.url + 'api/AccountCreation/GetCustomerAccountsInfo';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);
      print(response.body);
      result = ErrorRe.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        return result.hasErrors == true
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
                      result.validationErrors[0].errors.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
                'OK',
                () {
                  Get.back();
                },
              )
            : await apiCreateBAccount();
        // return result;
      }
    } catch (e) {
      print(e);
    }
  }

  Future apiCreateBAccount() async {
    print('api create all B is called');
    final url = Global.url + 'api/AccountCreation/CreateBankAccountRequest';

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    try {
      final http.Response response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode(<String, String>{
          'branchId': valBranch,
          'accountType': valAccountType,
        }),
      );

      print(response.statusCode);
      print(response.body);

      if (response.statusCode == 200) {
        Get.dialog(
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: 50,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  // image: DecorationImage(
                  //   image: ExactAssetImage('assets/images/createAccount.png'),
                  //   //  fit: BoxFit.contain,
                  // )
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
                          'Account successfully created'.tr,
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
      } else {
        Get.back();
        Get.snackbar(
            'Error'.tr, 'Please select the branch and the type of account'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0XFFFFDDDA),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
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
