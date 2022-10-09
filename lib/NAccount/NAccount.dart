import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:ibda3/Login/loginController.dart';
import 'dart:ui';
import '../global/globalVars.dart' as Global;

//import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'NAccountController.dart';

class NAccount extends StatefulWidget {
  @override
  _NAccountState createState() => _NAccountState();
}

class _NAccountState extends State<NAccount> with TickerProviderStateMixin {
  final NAccountController _NAccountController = Get.put(NAccountController());
  final LoginController _loginController = Get.put(LoginController());
  Timer timer;
  List<String> account_Type = ['Saving Account'.tr, 'Current Account'.tr];
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 2), (Timer t) => build(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListStatment(String title, String icon, Function function,
        {IconData check}) {
      return InkWell(
          child: Row(
            children: [
              Tab(icon: Image.asset('assets/images/icons/${icon}.png')),
              Text("  |  ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff0EBDC8),
                  )),
              Text(title.tr, //"fill  the personal information",
                  style: TextStyle(fontSize: 18, color: Colors.white)),
              SizedBox(
                width: 5,
              ),
              Check(title),
            ],
          ),
          onTap: function);
    }

    // Center(
    //   child: Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.stretch,
    //       children: [
    //         SizedBox(
    //           height: 40,
    //         ),
    //         Row(
    //           children: [
    //             Tab(icon: Image.asset('assets/images/icons/Pi.png')),
    //             Text("  |  ",
    //                 style: TextStyle(
    //                   fontSize: 25,
    //                   color: Color(0xff0EBDC8),
    //                 )),
    //             Text('fill the personal information'.tr,
    //                 style: TextStyle(fontSize: 18, color: Colors.white)),
    //             SizedBox(
    //               width: 5,
    //             ),
    //             Icon(Icons.done, color: Colors.white),
    //           ],
    //         ),
    //         Row(
    //           children: [
    //             Tab(icon: Image.asset('assets/images/icons/Dloan.png')),
    //             Text("  |  ",
    //                 style: TextStyle(
    //                   fontSize: 25,
    //                   color: Color(0xff0EBDC8),
    //                 )),
    //             Text('fill the open account data'.tr,
    //                 style: TextStyle(fontSize: 18, color: Colors.white)),
    //             SizedBox(
    //               width: 20,
    //             ),
    //             Icon(Icons.close, color: Colors.white),
    //           ],
    //         ),
    //
    //         SizedBox(
    //           height: 80,
    //         ),
    //
    //         MaterialButton(
    //           shape: RoundedRectangleBorder(
    //             borderRadius: new BorderRadius.circular(30.0),
    //           ),
    //           color: Color(0xff0EBDC8),
    //           splashColor: Colors.white,
    //           height: 50,
    //           minWidth: Get.width / 2,
    //           child: Text(
    //             'Open Account'.tr,
    //             //login == true ? 'Login'.tr : 'Register'.tr,
    //             style: TextStyle(
    //               color: Colors.white,
    //               fontSize: 20,
    //             ),
    //           ),
    //           onPressed: () {
    //             // Get.offNamed('/loanrequest');
    //           },
    //         ),
    //
    //         // Global.buildFabCircularMenu(Get.context)
    //         //  MainPage(),
    //       ],
    //     ),
    //   ),
    // ),
    setState(() {});
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          flex: 3,
          child: ListView(
            children: [
              ListStatment("fill the personal information", 'Pi', () {
                Get.toNamed('/loanrequest');
              }),
              SizedBox(
                height: 40,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Row(
              //     //crossAxisAlignment: CrossAxisAlignment.start,
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Branch'.tr,
              //         style: TextStyle(fontSize: 20, color: Colors.grey),
              //       ),
              //       Container(
              //         height: 30,
              //         // width: 150,
              //         padding: EdgeInsets.only(left: 10.0, right: 10),
              //         decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(15.0),
              //           border: Border.all(
              //               color: Colors.white,
              //               style: BorderStyle.solid,
              //               width: 0.20),
              //         ),
              //         child:
              //             GetBuilder<NAccountController>(builder: (controller) {
              //           while (_NAccountController.Branchlist == null) {
              //             return Center(
              //                 child: SpinKitFadingCircle(
              //               color: Theme.of(context).accentColor,
              //             ));
              //           }
              //           return DropdownButton(
              //               iconSize: 40,
              //               isDense: true,
              //               iconEnabledColor:
              //                   Theme.of(context).secondaryHeaderColor,
              //               iconDisabledColor: Colors.blue,
              //               underline: SizedBox(),
              //               focusColor: Colors.blue,
              //               elevation: 3,
              //               style: TextStyle(
              //                 color: Colors.black,
              //               ),
              //               items: _NAccountController.Branchlist.map((item) {
              //                 return DropdownMenuItem(
              //                   child: new Text(item.name),
              //                   value: item.id,
              //                 );
              //               }).toList(),
              //               onChanged: (newVal) {
              //                 setState(() {
              //                   _NAccountController.valBranch = newVal;
              //                 });
              //               },
              //               value: _NAccountController
              //                   .valBranch // complaintController.time,
              //               );
              //         }),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 10,
              ),
              Row(
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Account Type'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  Container(
                    height: 30,
                    // width: 150,
                    padding: EdgeInsets.only(left: 10.0, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.20),
                    ),
                    child: DropdownButton(
                      iconSize: 40,
                      isDense: true,
                      iconEnabledColor: Theme.of(context).secondaryHeaderColor,
                      iconDisabledColor: Colors.blue,
                      underline: SizedBox(),
                      focusColor: Colors.blue,
                      elevation: 3,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      items: account_Type.map((item) {
                        return DropdownMenuItem(
                          child: new Text(item.tr),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (newVal) {
                        setState(() {
                          _NAccountController.valAccountType = newVal;
                        });
                      },
                      value: _NAccountController.valAccountType,
                      // _loanrequestController
                      //     .valProjectStates // complaintController.time,
                    ),
                    // }),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),
                color: Color(0xff0EBDC8),
                splashColor: Colors.white,
                height: 50,
                minWidth: Get.width / 2,
                child: Text(
                  'Open Account'.tr,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onPressed: () {
                  !Global.checkP_info
                      ? Global.ShDialog(
                          context,
                          [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Image.asset(
                                'assets/images/icons/missfill.png',
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 5, top: 20, bottom: 40),
                              child: Text(
                                'Personal information is blank!!\n\nPlease fill out personal data and then request a digital account.'
                                    .tr,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                          'OK',
                          () {
                            Get.back();
                          },
                        )
                      : _NAccountController.apiGetBAccount();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Check(titel) {
    if (titel == 'fill the personal information') {
      if (Global.checkP_info == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    } else if (titel == 'fill the Loan data') {
      if (Global.checkL_info == true) {
        return Icon(
            //check
            Icons.done,
            color: Colors.white);
      } else
        return Icon(
            //check
            Icons.close,
            color: Colors.white);
    }
  }
}
