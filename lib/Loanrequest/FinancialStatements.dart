import 'dart:math';
import 'dart:ui';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../provideri.dart';
import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';

import 'LoanrequestController.dart';

// ignore: camel_case_types
class FinancialStatements extends StatefulWidget {
  @override
  _FinancialStatementsState createState() => _FinancialStatementsState();
}

class _FinancialStatementsState extends State<FinancialStatements> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  final loanrequestController _loanrequestController =
      Get.put(loanrequestController());
  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  static final now = DateTime.now();
  final dropdownDatePicker = DropdownDatePicker(
    firstDate: ValidDate(year: now.year - 100, month: 1, day: 1),
    lastDate: ValidDate(year: now.year, month: now.month, day: now.day),
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, //color: Color(0xff0EBDC8)
        color: Color(0xff0E2947).withOpacity(0.8)),
    dropdownColor: Colors.blue[50],
    dateHint: DateHint(year: 'year', month: 'month', day: 'day'),
    ascending: false,
    underLine: SizedBox(),
  );

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((page ?? 0) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Job Type'.tr,
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.JobTypelist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.JobTypelist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valjob = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valjob, newVal);
                        },
                        value: _loanrequestController
                            .valjob // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Global.Custom_TF(_loanrequestController.numdependantsTextController,
                "number of dependants", TextInputType.number),
            MS(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Education Level".tr,
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.EducationLevelslist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        // hint: (_loanrequestController.C_List.educationLevel !=
                        //         null)
                        //     ? Text(
                        //         _loanrequestController
                        //             .C_List.educationLevel.name
                        //             .toString(),
                        //         style:
                        //             TextStyle(fontSize: 14, color: Colors.grey),
                        //       )
                        //     : Text(' '),
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        // decoration: InputDecoration(
                        //   labelText: 'Gender'.tr,
                        //   labelStyle: TextStyle(color: Colors.grey),
                        //   border: OutlineInputBorder(),
                        //   enabledBorder: InputBorder.none,
                        //),

                        //  isExpanded: true,
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.EducationLevelslist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valelevel = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valelevel, newVal);
                        },
                        value: _loanrequestController
                            .valelevel // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Residency'.tr,
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.ResidencySlist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        // hint: (_loanrequestController.C_List.residencyStatus !=
                        //         null)
                        //     ? Text(
                        //         _loanrequestController
                        //             .C_List.residencyStatus.name
                        //             .toString(),
                        //         style:
                        //             TextStyle(fontSize: 14, color: Colors.grey),
                        //       )
                        //     : Text('  '),
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        // decoration: InputDecoration(
                        //   labelText: 'Gender'.tr,
                        //   labelStyle: TextStyle(color: Colors.grey),
                        //   border: OutlineInputBorder(),
                        //   enabledBorder: InputBorder.none,
                        //),

                        //  isExpanded: true,
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.ResidencySlist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valresidencyS = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valresidency, newVal);
                        },
                        value: _loanrequestController
                            .valresidencyS // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            _loanrequestController.valresidency == 3
                ? Global.Custom_TF(
                    _loanrequestController.home_rentTextController,
                    "Home rent value",
                    TextInputType.number)
                : SizedBox(),
            // SizedBox(
            //   height: 20,
            // ),
            // gender(),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: ListView(
          shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            gender(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Job Type'.tr,
            //       style: TextStyle(fontSize: 20, color: Colors.grey),
            //     ),
            //     Container(
            //       height: 30,
            //       // width: 150,
            //       padding: EdgeInsets.only(left: 10.0, right: 10),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(15.0),
            //         border: Border.all(
            //             color: Colors.white,
            //             style: BorderStyle.solid,
            //             width: 0.20),
            //       ),
            //       child:
            //           GetBuilder<loanrequestController>(builder: (controller) {
            //         while (_loanrequestController.JobTypelist == null) {
            //           return Center(
            //               child: SpinKitFadingCircle(
            //             color: Theme.of(context).accentColor,
            //           ));
            //         }
            //         return DropdownButton(
            //             iconSize: 40,
            //             isDense: true,
            //             iconEnabledColor:
            //                 Theme.of(context).secondaryHeaderColor,
            //             iconDisabledColor: Colors.blue,
            //             underline: SizedBox(),
            //             focusColor: Colors.blue,
            //             elevation: 3,
            //             style: TextStyle(
            //               color: Colors.black,
            //             ),
            //             items: _loanrequestController.JobTypelist
            //                 // _Compulsory_service
            //                 .map((item) {
            //               return DropdownMenuItem(
            //                   child: new Text(item.name), value: item.name);
            //             }).toList(),
            //             onChanged: (newVal) {
            //               setState(() {
            //                 _loanrequestController.valjob = newVal;
            //               });
            //               // _loanrequestController.updateValue(
            //               //     _loanrequestController.valjob, newVal);
            //             },
            //             value: _loanrequestController
            //                 .valjob // complaintController.time,
            //             );
            //       }),
            //     ),
            //   ],
            // ),
            // Global.Custom_TF(_loanrequestController.numdependantsTextController,
            //     "number of dependants", TextInputType.number),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       "Education Level".tr,
            //       style: TextStyle(fontSize: 20, color: Colors.grey),
            //     ),
            //     Container(
            //       height: 30,
            //       // width: 150,
            //       padding: EdgeInsets.only(left: 10.0, right: 10),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(15.0),
            //         border: Border.all(
            //             color: Colors.white,
            //             style: BorderStyle.solid,
            //             width: 0.20),
            //       ),
            //       child:
            //           GetBuilder<loanrequestController>(builder: (controller) {
            //         while (_loanrequestController.EducationLevelslist == null) {
            //           return Center(
            //               child: SpinKitFadingCircle(
            //             color: Theme.of(context).accentColor,
            //           ));
            //         }
            //         return DropdownButton(
            //             hint: (_loanrequestController.C_List.educationLevel !=
            //                     null)
            //                 ? Text(
            //                     _loanrequestController
            //                         .C_List.educationLevel.name
            //                         .toString(),
            //                     style:
            //                         TextStyle(fontSize: 14, color: Colors.grey),
            //                   )
            //                 : Text(' '),
            //             iconSize: 40,
            //             isDense: true,
            //             iconEnabledColor:
            //                 Theme.of(context).secondaryHeaderColor,
            //             iconDisabledColor: Colors.blue,
            //             underline: SizedBox(),
            //             // decoration: InputDecoration(
            //             //   labelText: 'Gender'.tr,
            //             //   labelStyle: TextStyle(color: Colors.grey),
            //             //   border: OutlineInputBorder(),
            //             //   enabledBorder: InputBorder.none,
            //             //),
            //
            //             //  isExpanded: true,
            //             focusColor: Colors.blue,
            //             elevation: 3,
            //             style: TextStyle(
            //               color: Colors.black,
            //             ),
            //             items: _loanrequestController.EducationLevelslist
            //                 // _Compulsory_service
            //                 .map((item) {
            //               return DropdownMenuItem(
            //                 child: new Text(item.name),
            //                 value: item.id,
            //               );
            //             }).toList(),
            //             onChanged: (newVal) {
            //               setState(() {
            //                 _loanrequestController.valelevel = newVal;
            //               });
            //               // _loanrequestController.updateValue(
            //               //     _loanrequestController.valelevel, newVal);
            //             },
            //             value: _loanrequestController
            //                 .valelevel // complaintController.time,
            //             );
            //       }),
            //     ),
            //   ],
            // ),
            // Global.Custom_TF(_loanrequestController.home_rentTextController,
            //     "Home rent value", TextInputType.number),
            // Global.Custom_TF(_loanrequestController.MonthlyIncomeController,
            //     "Monthly income", TextInputType.number),

            Global.Custom_TF(_loanrequestController.MonthlyexpensesController,
                "Monthly expenses", TextInputType.number),
            // Global.Custom_TF(_loanrequestController.PremiumAController,
            //     "Premium of assembly", TextInputType.number),
            Global.Custom_TF(_loanrequestController.loanPaymentController,
                "loan payment", TextInputType.number),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Deal with other banks'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.DealTypelist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        // isExpanded: true,
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.DealTypelist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valdeal = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valdeal, newVal);

                          //  complaintController.updateValuedu(newVal);
                        },
                        value: _loanrequestController
                            .valdeal // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'name of the bank'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.Bankslist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.Bankslist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valbanks = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valbanks, newVal);
                        },
                        value: _loanrequestController
                            .valbanks // complaintController.time,
                        );
                  }),
                ),
              ],
            ),

            // Global.Custom_TF(_loanrequestController.loanamountController,
            //     "loan amount", TextInputType.number),
            SizedBox(
              height: 40,
            ),

            Global.Custom_Botton('Submit', function: () {
              _loanrequestController.apiloanreq(context);
            }, formkey: _formKey)
            // MaterialButton(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: new BorderRadius.circular(30.0),
            //     ),
            //     color: Color(0xff0EBDC8),
            //     splashColor: Colors.white,
            //     height: 50,
            //     minWidth: Get.width / 2,
            //     child: Text(
            //       'Submit'.tr,
            //       style: TextStyle(
            //         color: Colors.white,
            //         fontSize: 20,
            //       ),
            //     ),
            //     onPressed: () {
            //       // print('11  ${dropdownDatePicker.getDate()}');
            //       // print('12  ${_loanrequestController.valbirthday}');
            //       // print('11  ${_loanrequestController.valmilitary}');
            //       while (_loanrequestController.isLoading == true) {
            //         return Center(
            //             child: SpinKitFadingCircle(
            //           color: Theme.of(context).accentColor,
            //         ));
            //       }
            //       _loanrequestController.apiloanreq(context);
            //       // showDialog(
            //       //     context: context,
            //       //     builder: (_) {
            //       //       Future.delayed(Duration(seconds: 5), () {
            //       //         Navigator.of(context).pop(true);
            //       //       });
            //       //       return Dialog(
            //       //         backgroundColor: Colors.transparent,
            //       //         child: Container(
            //       //           width: 200,
            //       //           height: 300,
            //       //           decoration: BoxDecoration(
            //       //               color: Colors.black.withOpacity(0.1),
            //       //               image: DecorationImage(
            //       //                 image:
            //       //                     ExactAssetImage('assets/images/done.png'),
            //       //                 //fit: BoxFit.scaleDown
            //       //               )),
            //       //         ),
            //       //       );
            //       //     }).then((value) => {Get.back(), Get.back()});
            //     }),
          ],
        ),
      ),
    ];

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //SizedBox(width: 55),
                      Image.asset(
                        Global.lan == 'Arabic'
                            ? 'assets/images/logoAr.png'
                            : 'assets/images/logoEn.png',
                        width: 180,
                        height: 90,
                      ),
                      //  SizedBox(width: 25),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/FS.png',
                          width: 50,
                          height: 30,
                        ),
                        Text("Financial Statements".tr,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: Theme.of(context).secondaryHeaderColor,
                      thickness: 2,
                    ),
                  ),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  Container(
                    //color: Colors.white.withOpacity(0.2),
                    height: 600,
                    width: 120,
                    child:
                        // Container(
                        //   height: MediaQuery.of(context).size.height,
                        //   color: Color(0xff0E2947),
                        //   child: ListView(
                        //     shrinkWrap: true,
                        //     physics: NeverScrollableScrollPhysics(),
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Job Type'.tr,
                        //             style:
                        //                 TextStyle(fontSize: 20, color: Colors.grey),
                        //           ),
                        //           Container(
                        //             height: 30,
                        //             // width: 150,
                        //             padding: EdgeInsets.only(left: 10.0, right: 10),
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(15.0),
                        //               border: Border.all(
                        //                   color: Colors.white,
                        //                   style: BorderStyle.solid,
                        //                   width: 0.20),
                        //             ),
                        //             child: GetBuilder<loanrequestController>(
                        //                 builder: (controller) {
                        //               while (_loanrequestController.JobTypelist ==
                        //                   null) {
                        //                 return Center(
                        //                     child: SpinKitFadingCircle(
                        //                   color: Theme.of(context).accentColor,
                        //                 ));
                        //               }
                        //               return DropdownButton(
                        //                   // hint: (_loanrequestController
                        //                   //             .C_List.jobType !=
                        //                   //         null)
                        //                   //     ? Text(
                        //                   //         _loanrequestController
                        //                   //             .C_List.jobType.name
                        //                   //             .toString(),
                        //                   //         style: TextStyle(
                        //                   //             fontSize: 14,
                        //                   //             color: Colors.grey),
                        //                   //       )
                        //                   //     : Text('  ',
                        //                   //         style: TextStyle(
                        //                   //             fontSize: 14,
                        //                   //             color: Colors.grey)),
                        //                   iconSize: 40,
                        //                   isDense: true,
                        //                   iconEnabledColor: Theme.of(context)
                        //                       .secondaryHeaderColor,
                        //                   iconDisabledColor: Colors.blue,
                        //                   underline: SizedBox(),
                        //                   focusColor: Colors.blue,
                        //                   elevation: 3,
                        //                   style: TextStyle(
                        //                     color: Colors.black,
                        //                   ),
                        //                   items: _loanrequestController.JobTypelist
                        //                       // _Compulsory_service
                        //                       .map((item) {
                        //                     return DropdownMenuItem(
                        //                         child: new Text(item.name),
                        //                         value: item.id);
                        //                   }).toList(),
                        //                   onChanged: (newVal) {
                        //                     setState(() {
                        //                       _loanrequestController.valjob =
                        //                           newVal;
                        //                     });
                        //                     // _loanrequestController.updateValue(
                        //                     //     _loanrequestController.valjob, newVal);
                        //                   },
                        //                   value: _loanrequestController
                        //                       .valjob // complaintController.time,
                        //                   );
                        //             }),
                        //           ),
                        //         ],
                        //       ),
                        //       // JT(),
                        //       Global.Custom_TF(
                        //           _loanrequestController.MonthlyexpensesController,
                        //           "Monthly expenses",
                        //           TextInputType.number),
                        //       Global.Custom_TF(
                        //           _loanrequestController.PremiumAController,
                        //           "Premium of assembly",
                        //           TextInputType.number),
                        //       Global.Custom_TF(
                        //           _loanrequestController.loanPaymentController,
                        //           "loan payment",
                        //           TextInputType.number),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'Deal with other banks'.tr,
                        //             style:
                        //                 TextStyle(fontSize: 18, color: Colors.grey),
                        //           ),
                        //           Container(
                        //             height: 30,
                        //             // width: 150,
                        //             padding: EdgeInsets.only(left: 10.0, right: 10),
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(15.0),
                        //               border: Border.all(
                        //                   color: Colors.white,
                        //                   style: BorderStyle.solid,
                        //                   width: 0.20),
                        //             ),
                        //             child: GetBuilder<loanrequestController>(
                        //                 builder: (controller) {
                        //               while (_loanrequestController.DealTypelist ==
                        //                   null) {
                        //                 return Center(
                        //                     child: SpinKitFadingCircle(
                        //                   color: Theme.of(context).accentColor,
                        //                 ));
                        //               }
                        //               return DropdownButton(
                        //
                        //                   // isExpanded: true,
                        //                   iconSize: 40,
                        //                   isDense: true,
                        //                   iconEnabledColor: Theme.of(context)
                        //                       .secondaryHeaderColor,
                        //                   iconDisabledColor: Colors.blue,
                        //                   underline: SizedBox(),
                        //                   focusColor: Colors.blue,
                        //                   elevation: 3,
                        //                   style: TextStyle(
                        //                     color: Colors.black,
                        //                   ),
                        //                   items: _loanrequestController.DealTypelist
                        //                       // _Compulsory_service
                        //                       .map((item) {
                        //                     return DropdownMenuItem(
                        //                       child: new Text(item.name),
                        //                       value: item.id,
                        //                     );
                        //                   }).toList(),
                        //                   onChanged: (newVal) {
                        //                     setState(() {
                        //                       _loanrequestController.valdeal =
                        //                           newVal;
                        //                     });
                        //                     // _loanrequestController.updateValue(
                        //                     //     _loanrequestController.valdeal, newVal);
                        //
                        //                     //  complaintController.updateValuedu(newVal);
                        //                   },
                        //                   value: _loanrequestController
                        //                       .valdeal // complaintController.time,
                        //                   );
                        //             }),
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             'name of the bank'.tr,
                        //             style:
                        //                 TextStyle(fontSize: 18, color: Colors.grey),
                        //           ),
                        //           Container(
                        //             height: 30,
                        //             // width: 150,
                        //             padding: EdgeInsets.only(left: 10.0, right: 10),
                        //             decoration: BoxDecoration(
                        //               color: Colors.white,
                        //               borderRadius: BorderRadius.circular(15.0),
                        //               border: Border.all(
                        //                   color: Colors.white,
                        //                   style: BorderStyle.solid,
                        //                   width: 0.20),
                        //             ),
                        //             child: GetBuilder<loanrequestController>(
                        //                 builder: (controller) {
                        //               while (_loanrequestController.Bankslist ==
                        //                   null) {
                        //                 return Center(
                        //                     child: SpinKitFadingCircle(
                        //                   color: Theme.of(context).accentColor,
                        //                 ));
                        //               }
                        //               return DropdownButton(
                        //                   iconSize: 40,
                        //                   isDense: true,
                        //                   iconEnabledColor: Theme.of(context)
                        //                       .secondaryHeaderColor,
                        //                   iconDisabledColor: Colors.blue,
                        //                   underline: SizedBox(),
                        //                   focusColor: Colors.blue,
                        //                   elevation: 3,
                        //                   style: TextStyle(
                        //                     color: Colors.black,
                        //                   ),
                        //                   items: _loanrequestController.Bankslist
                        //                       // _Compulsory_service
                        //                       .map((item) {
                        //                     return DropdownMenuItem(
                        //                       child: new Text(item.name),
                        //                       value: item.id,
                        //                     );
                        //                   }).toList(),
                        //                   onChanged: (newVal) {
                        //                     setState(() {
                        //                       _loanrequestController.valbanks =
                        //                           newVal;
                        //                     });
                        //                     // _loanrequestController.updateValue(
                        //                     //     _loanrequestController.valbanks, newVal);
                        //                   },
                        //                   value: _loanrequestController
                        //                       .valbanks // complaintController.time,
                        //                   );
                        //             }),
                        //           ),
                        //         ],
                        //       ),
                        //
                        //       // Global.Custom_TF(_loanrequestController.loanamountController,
                        //       //     "loan amount", TextInputType.number),
                        //       SizedBox(
                        //         height: 20,
                        //       ),
                        //       MaterialButton(
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: new BorderRadius.circular(30.0),
                        //           ),
                        //           color: Color(0xff0EBDC8),
                        //           splashColor: Colors.white,
                        //           height: 50,
                        //           minWidth: Get.width / 2,
                        //           child: Text(
                        //             'Submit'.tr,
                        //             style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 20,
                        //             ),
                        //           ),
                        //           onPressed: () async {
                        //             print('11  ${dropdownDatePicker.getDate()}');
                        //             print(
                        //                 '12  ${_loanrequestController.valbirthday}');
                        //             print(
                        //                 '11  ${_loanrequestController.valmilitary}');
                        //             await _loanrequestController
                        //                 .apiloanreq(context);
                        //             // showDialog(
                        //             //     context: context,
                        //             //     builder: (_) {
                        //             //       Future.delayed(Duration(seconds: 5), () {
                        //             //         Navigator.of(context).pop(true);
                        //             //       });
                        //             //       return Dialog(
                        //             //         backgroundColor: Colors.transparent,
                        //             //         child: Container(
                        //             //           width: 200,
                        //             //           height: 300,
                        //             //           decoration: BoxDecoration(
                        //             //               color: Colors.black.withOpacity(0.1),
                        //             //               image: DecorationImage(
                        //             //                 image:
                        //             //                     ExactAssetImage('assets/images/done.png'),
                        //             //                 //fit: BoxFit.scaleDown
                        //             //               )),
                        //             //         ),
                        //             //       );
                        //             //     }).then((value) => {Get.back(), Get.back()});
                        //           }),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      //   child: Expanded(
                      child: Builder(
                          builder: (ctx) => Stack(
                                //  fit: StackFit.expand,
                                //   overflow: Overflow.visible,
                                children: <Widget>[
                                  LiquidSwipe(
                                    pages: pages,
                                    positionSlideIcon: 0.97,
                                    slideIconWidget: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    onPageChangeCallback: pageChangeCallback,
                                    waveType: WaveType.liquidReveal,
                                    liquidController: liquidController,
                                    ignoreUserGestureWhileAnimating: true,
                                    enableLoop: false,
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        // mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          Expanded(child: SizedBox()),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: List<Widget>.generate(
                                                pages.length, _buildDot),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Align(
                                  //   alignment: Alignment.bottomRight,
                                  //   child: Padding(
                                  //     padding: const EdgeInsets.all(25.0),
                                  //     child: FlatButton(
                                  //       onPressed: () {
                                  //         liquidController.animateToPage(
                                  //             page: pages.length - 1,
                                  //             duration: 700);
                                  //       },
                                  //       child: Text("Skip to End"),
                                  //       color: Colors.white.withOpacity(0.01),
                                  //     ),
                                  //   ),
                                  // ),
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 1),
                                      child: TextButton(
                                        onPressed: () {
                                          liquidController.jumpToPage(
                                              page:
                                                  liquidController.currentPage +
                                                              1 >
                                                          pages.length - 1
                                                      ? 0
                                                      : liquidController
                                                              .currentPage +
                                                          1);
                                        },
                                        child: Text(
                                          "Next >>",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        // color: Colors.white.withOpacity(0.01),
                                      ),
                                    ),
                                  )
                                ],
                              )),
                      //  ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

      // ),
    );
  }

  JT() {
    return _loanrequestController.valjob == 4
        ? Global.Custom_TF(_loanrequestController.MonthlyIncomeController,
            "Monthly income", TextInputType.number)
        : SizedBox(
            height: 2,
          );
  }

  gender() {
    return (_loanrequestController.C_List != null &&
            (_loanrequestController.C_List.gender == 'male'.tr ||
                _loanrequestController.C_List.gender == '1'))
        ? Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Military Status'.tr,
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
                  child:
                      GetBuilder<loanrequestController>(builder: (controller) {
                    while (_loanrequestController.militarylist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return DropdownButton(
                        iconSize: 40,
                        isDense: true,
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        iconDisabledColor: Colors.blue,
                        underline: SizedBox(),
                        focusColor: Colors.blue,
                        elevation: 3,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        items: _loanrequestController.militarylist
                            // _Compulsory_service
                            .map((item) {
                          return DropdownMenuItem(
                            child: new Text(item.name),
                            value: item.id,
                          );
                        }).toList(),
                        onChanged: (newVal) {
                          setState(() {
                            _loanrequestController.valmilitary = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valmilitary, newVal);
                        },
                        value: _loanrequestController
                            .valmilitary // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            Global.Custom_TF(
                _loanrequestController.cause_exemptionTextController,
                "cause of exemption",

                // "cause of exemption\n${_loanrequestController.C_List}",
                TextInputType.text),
          ])
        : SizedBox(
            height: 1,
          );
  }

  MS() {
    return _loanrequestController.C_List.socialStatusId == 2
        ? Column(children: [
            Global.Custom_TF(_loanrequestController.husbandnameTextController,
                "husband's name", TextInputType.text),
            Global.Custom_TF(_loanrequestController.husbandidTextController,
                "husband's ID", TextInputType.number),
            Global.Custom_TF(
              _loanrequestController.childrenCountController,
              "children Count",
              //\n${_loanrequestController.C_List.childrenCount},
              TextInputType.number,
              // hint: _loanrequestController.C_List.childrenCount.toString(),
            ),
          ])
        : SizedBox(
            height: 1,
          );
  }

  pageChangeCallback(int lpage) {
    // return pages[page];
    setState(() {
      page = lpage;
    });
  }
}
