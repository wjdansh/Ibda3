import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibda3/Error/Error.dart';
import 'package:ibda3/global/globalVars.dart' as Global;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibda3/api_MyLoans/models/getCustomerModel.dart';

class EpayController extends GetxController {
  bool Confirm = false;
  ErrorRe _errorRe;

  @override
  void onInit() async {
    super.onInit();
    //   await getBalance();
    //  digitalAModel =  digitalAccountModel;
  }

  Future createDigitalAccount() async {
    print("api create my DA called");
    final url = Global.url + 'api/AccountCreation/CreateCustomerDegitalAccount';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': Global.Gtoken,
    };
    //await getDigitalAccount();
    try {
      var response = await http.post(
        Uri.parse(url),
        headers: header,
        body: jsonEncode({
          "confirmed": Confirm,
        }),
      );

      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        _errorRe = ErrorRe.fromJson(json.decode(response.body));
        _errorRe.hasErrors == true
            ? {
                Get.back(),
                Get.snackbar('Error'.tr,
                    _errorRe.validationErrors[0].errors.toString().tr,
                    duration: Duration(seconds: 6),
                    backgroundColor: Color(0xc3cff6fa),
                    icon: Icon(
                      Icons.error_sharp,
                      color: Color(0xff8e0016),
                    )),
              }
            // Get.dialog(
            //     Padding(
            //       padding: const EdgeInsets.all(20.0),
            //       child: Container(
            //         width: 50,
            //         height: 70,
            //         decoration: BoxDecoration(
            //           color: Colors.black.withOpacity(0.3),
            //           // image: DecorationImage(
            //           //   image: ExactAssetImage('assets/images/createAccount.png'),
            //           //   //  fit: BoxFit.contain,
            //           // )
            //         ),
            //         child: Align(
            //           alignment: Alignment.bottomCenter,
            //           child: Padding(
            //             padding: const EdgeInsets.only(bottom: 25, top: 25),
            //             child: Column(
            //               children: [
            //                 Image.asset(
            //                   'assets/images/createAccount.png',
            //                   width: Get.width / 2,
            //                   height: Get.height / 2.5,
            //                 ),
            //                 SizedBox(
            //                   height: Get.height / 8,
            //                 ),
            //                 Text(
            //                   'Request sent successfully'.tr,
            //                   style: TextStyle(
            //                       color: Colors.white,
            //                       fontSize: 25,
            //                       inherit: false),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         // ),
            //       ),
            //     ),
            //     barrierColor: Colors.black.withOpacity(0.3),
            //     barrierDismissible: false);
            //
            // Future.delayed(Duration(seconds: 5), () {
            : {
                // getDigitalAccount();
                Get.back(),
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
                                  'Digital Account successfully created'.tr,
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
                    barrierDismissible: false),

                Future.delayed(Duration(seconds: 5), () {
                  Get.back();
                })
              };
        // });

        // Future.delayed(Duration(seconds: 5), () {
        //   Get.back();
        // });
      } else {
        //  Get.back();
        Get.back();
        Get.snackbar('Error'.tr, 'Please check  vv Internet connection'.tr,
            duration: Duration(seconds: 6),
            backgroundColor: Color(0xc3cff6fa),
            icon: Icon(
              Icons.error_sharp,
              color: Color(0xff8e0016),
            ));
      }
    } catch (e) {
      print(e);
      //  Get.back();
      Get.back();
      Get.snackbar('Error'.tr, 'Please check nn Internet connection'.tr,
          duration: Duration(seconds: 6),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));
    }
  }

  ConfirmDigitlAccount() async {
    // await getDigitalAccount();
    Confirm == false
        ? Global.GetShDialog(
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/icons/terms_conditions.png',
                  height: 75,
                  width: 75,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 2,
                ),
                child: Text(
                  'terms and Conditions'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 5.0, right: 5, top: 20, bottom: 40),
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: SingleChildScrollView(
                    child: Text(
                      'Conditions and termsdis'.tr,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Get.theme.primaryColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
            'Agreed',
            () {
              Get.back();
              // Get.back();
              Confirm = true;
              createDigitalAccount();
            },
            t2: 'Close',
            fun2: () {
              //  Get.back();
              Get.back();
            },
          )
        : createDigitalAccount();
  }
// Future ConfirmDigitlAccount() async {
//   final url =
//       Global.url + 'api/AccountCreation/ConfirmCustomerDegitalAccount';
//   Map<String, String> header = {
//     'Content-Type': 'application/json',
//     'Authorization': Global.Gtoken,
//   };
//   try {
//     var response = await http.get(
//       Uri.parse(url),
//       headers: header,
//     );
//
//     print(response.statusCode);
//     print(response.body);
//
//     if (response.statusCode == 200) {
//       Confirm = true;
//       // Get.back();
//       // Get.back();
//       Get.dialog(
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Container(
//               width: 50,
//               height: 70,
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.3),
//                 // image: DecorationImage(
//                 //   image: ExactAssetImage('assets/images/createAccount.png'),
//                 //   //  fit: BoxFit.contain,
//                 // )
//               ),
//               child: Align(
//                 alignment: Alignment.bottomCenter,
//                 child: Padding(
//                   padding: const EdgeInsets.only(bottom: 25, top: 25),
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         'assets/images/createAccount.png',
//                         width: Get.width / 2,
//                         height: Get.height / 2.5,
//                       ),
//                       SizedBox(
//                         height: Get.height / 8,
//                       ),
//                       Text(
//                         'Request sent successfully'.tr,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 25,
//                             inherit: false),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // ),
//             ),
//           ),
//           barrierColor: Colors.black.withOpacity(0.3),
//           barrierDismissible: false);
//
//       Future.delayed(Duration(seconds: 5), () {
//         getDigitalAccount();
//         Get.back();
//         Get.dialog(
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(
//                 width: 50,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   color: Colors.black.withOpacity(0.3),
//                   // image: DecorationImage(
//                   //   image: ExactAssetImage('assets/images/createAccount.png'),
//                   //   //  fit: BoxFit.contain,
//                   // )
//                 ),
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Padding(
//                     padding: const EdgeInsets.only(bottom: 25, top: 25),
//                     child: Column(
//                       children: [
//                         Image.asset(
//                           'assets/images/createAccount.png',
//                           width: Get.width / 2,
//                           height: Get.height / 2.5,
//                         ),
//                         SizedBox(
//                           height: Get.height / 8,
//                         ),
//                         Text(
//                           'Account successfully created'.tr,
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 25,
//                               inherit: false),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 // ),
//               ),
//             ),
//             barrierColor: Colors.black.withOpacity(0.3),
//             barrierDismissible: false);
//         Future.delayed(Duration(seconds: 5), () {
//           Get.back();
//         });
//       });
//     } else {
//       Get.back();
//       //  Get.back();
//       Get.snackbar('Error'.tr, 'Please check jj Internet connection'.tr,
//           duration: Duration(seconds: 6),
//           backgroundColor: Color(0xc3cff6fa),
//           icon: Icon(
//             Icons.error_sharp,
//             color: Color(0xff8e0016),
//           ));
//     }
//   } catch (e) {
//     print(e);
//     Get.back();
//     //   Get.back();
//     Get.snackbar('Error'.tr, 'Please check  oo  Internet connection'.tr,
//         duration: Duration(seconds: 6),
//         backgroundColor: Color(0xc3cff6fa),
//         icon: Icon(
//           Icons.error_sharp,
//           color: Color(0xff8e0016),
//         ));
//   }
// }

}
