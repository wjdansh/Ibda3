import 'dart:async';
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
import 'package:search_choices/search_choices.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';

import 'LoanrequestController.dart';
import 'MilitaryModel.dart';

// ignore: camel_case_types
class loanrequest extends StatefulWidget {
  @override
  _loanrequestState createState() => _loanrequestState();
}

class _loanrequestState extends State<loanrequest> {
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

  List _gender = ['male'.tr, 'female'.tr];
  // static final now = DateTime.now();

  // final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
  //   new GlobalKey<RefreshIndicatorState>();
  Timer timer;
  Timer timerr;
  @override
  void initState() {
    liquidController = LiquidController();
    timer =
        Timer.periodic(Duration(microseconds: 1), (Timer t) => build(context));
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
    // while (_loanrequestController.Kyc_List == null) {
    //   return Container(
    //     color: Theme.of(context).primaryColor,
    //     child: Center(
    //         child: SpinKitFadingCircle(
    //       color: Theme.of(context).accentColor,
    //     )),
    //   );
    // }
    setState(() {});
    final pages = [
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          // physics: AlwaysScrollableScrollPhysics(),
          children: [
            // Expanded(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Global.Custom_TF(
                    _loanrequestController.firstnameTextController,
                    //_loanrequestController.C_List.userId,
                    'FirstName',
                    TextInputType.text,
                    hint: _loanrequestController.Kyc_List != null
                        ? _loanrequestController.Kyc_List.result.firstName
                        : '',
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Global.Custom_TF(
                    _loanrequestController.lastnameTextController,
                    'LastName',
                    TextInputType.text,
                    hint: _loanrequestController.Kyc_List != null
                        ? _loanrequestController.Kyc_List.result.lastName
                        : '',
                  ),
                ),
              ],
            ),

            Global.Custom_TF(
              _loanrequestController.fathernameTextController,
              'Father Name',
              TextInputType.text,
              hint: _loanrequestController.Kyc_List != null
                  ? _loanrequestController.Kyc_List.result.fatherName
                  : '',
            ), //   child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Global.Custom_TF(
                      _loanrequestController.mothernameTextController,
                      'Mother Name',
                      TextInputType.text,
                      hint: _loanrequestController.Kyc_List != null
                          ? _loanrequestController.Kyc_List.result.motherName
                          : ''),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: Global.Custom_TF(
                      _loanrequestController.motherLastNameController,
                      'Mother Last Name',
                      TextInputType.text,
                      hint: _loanrequestController.Kyc_List != null
                          ? _loanrequestController
                              .Kyc_List.result.motherLastName
                          : ''),
                ),
              ],
            ),
            Global.Custom_TF(_loanrequestController.userNameController,
                "User Name", TextInputType.text),
            // // ),
            Global.Custom_TF(_loanrequestController.mobileTextController,
                'Mobile Number', TextInputType.number,
                hint: _loanrequestController.Kyc_List != null
                    ? _loanrequestController.Kyc_List.result.mobileNumber
                    : ''),
            Global.Custom_TF(_loanrequestController.phoneTextController,
                'phone Number', TextInputType.number,
                hint: _loanrequestController.Kyc_List != null
                    ? _loanrequestController.Kyc_List.result.phoneNumber
                    : ''),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Global.Custom_TF(
                  _loanrequestController.IDTextController,
                  'ID (11 character)',
                  TextInputType.number,
                  //   hint: _loanrequestController.C_List.id.toString()
                ),
                Global.Custom_TF(
                    _loanrequestController.Confirm_IDTextController,
                    'Confirm ID',
                    TextInputType.number),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _loanrequestController.Kyc_List != null
                        ? Column(
                            children: [
                              Text(
                                'Birthday'.tr,
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              Text(
                                '${_loanrequestController.Kyc_List.result.birthDate.toString().substring(0, 10)}',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                            ],
                          )
                        : Text(
                            'Birthday'.tr,
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                    Container(
                      height: 30,
                      //width: 150,
                      padding: EdgeInsets.only(left: 10.0, right: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 0.20),
                      ),
                      child: _loanrequestController.dropdownDatePicker,
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
                      'Gender'.tr,
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
                          hint: (_loanrequestController.Kyc_List != null)
                              ? Text(
                                  _loanrequestController.Kyc_List.result.gender,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                )
                              : Text('  ',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey)),
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
                          items: _gender.map((item) {
                            return DropdownMenuItem(
                              child: new Text(item),
                              value: item.toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            setState(() {
                              _loanrequestController.valgen = newVal;
                            });
                            // _loanrequestController.updateValue(
                            //     _loanrequestController.valgen, newVal);
                          },
                          value: _loanrequestController
                              .valgen // complaintController.time,
                          ),
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
                      'Marital Status'.tr,
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
                      child: GetBuilder<loanrequestController>(
                          builder: (controller) {
                        while (_loanrequestController.maritallist == null) {
                          return Center(
                              child: SpinKitFadingCircle(
                            color: Theme.of(context).accentColor,
                          ));
                        }
                        return DropdownButton(
                            // hint: (_loanrequestController
                            //             .Kyc_List.result.socialStatus !=
                            //         null)
                            //     ? Text(
                            //         _loanrequestController
                            //             .Kyc_List.result.socialStatus.name
                            //             .toString(),
                            //         style: TextStyle(
                            //             fontSize: 14, color: Colors.grey),
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
                            items: _loanrequestController.maritallist
                                // _Compulsory_service
                                .map((item) {
                              return DropdownMenuItem(
                                child: new Text(
                                  item.name.toString(),
                                  style: TextStyle(overflow: TextOverflow.fade),
                                ),
                                value: item.id,
                              );
                            }).toList(),
                            onChanged: (newVal) {
                              setState(() {
                                _loanrequestController.valmarital = newVal;
                              });
                              print('ss  ${_loanrequestController.valmarital}');
                              // _loanrequestController.updateValue(
                              //     _loanrequestController.valmarital, newVal);
                            },
                            value: _loanrequestController
                                .valmarital // complaintController.time,
                            );
                      }),
                    ),
                  ],
                ),
                //   MS(),

                // Global.Custom_TF(
                //     _loanrequestController.numdependantsTextController,
                //     "number of dependants",
                //     TextInputType.number),
              ],
            ),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Global.Custom_TF(_loanrequestController.addressTextController,
                "Address", TextInputType.text,
                hint: _loanrequestController.Kyc_List != null
                    ? _loanrequestController.Kyc_List.result.address
                    : ''),
            // gender(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       'Military Status',
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
            //         while (_loanrequestController.militarylist == null) {
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
            //             items: _loanrequestController.militarylist
            //                 // _Compulsory_service
            //                 .map((item) {
            //               return DropdownMenuItem(
            //                 child: new Text(item.name),
            //                 value: item.name.toString(),
            //               );
            //             }).toList(),
            //             onChanged: (newVal) {
            //               setState(() {
            //                 _loanrequestController.valmilitary = newVal;
            //               });
            //               // _loanrequestController.updateValue(
            //               //     _loanrequestController.valmilitary, newVal);
            //             },
            //             value: _loanrequestController
            //                 .valmilitary // complaintController.time,
            //             );
            //       }),
            //     ),
            //   ],
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Global.Custom_TF(
            //     _loanrequestController.cause_exemptionTextController,
            //     "cause of exemption",
            //     TextInputType.text),

            Global.Custom_TF(_loanrequestController.MonthlyIncomeController,
                "Monthly income", TextInputType.number),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Villages'.tr,
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Container(
                  //  height: 30,
                  width: MediaQuery.of(context).size.width / 1.7,
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
                    while (_loanrequestController.Villageslist == null) {
                      return Center(
                          child: SpinKitFadingCircle(
                        color: Theme.of(context).accentColor,
                      ));
                    }
                    return Align(
                      alignment: Alignment.topRight,
                      child: SearchChoices.single(
                        iconEnabledColor:
                            Theme.of(context).secondaryHeaderColor,
                        underline: SizedBox(),
                        padding: 0.0,
                        displayClearIcon: false,
                        iconSize: 40,
                        items: _loanrequestController.Villageslist.map(
                            (item) => DropdownMenuItem<LoanOfficerModel>(
                                  child: Text(
                                    item.name,
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  value: item,
                                )).toList(),
                        value: _loanrequestController.valVillages != null
                            ? _loanrequestController.Villageslist.where(
                                (element) =>
                                    element.id ==
                                    _loanrequestController.valVillages).first
                            : _loanrequestController.valVillages,
                        hint: (_loanrequestController.Kyc_List != null)
                            ? Text(
                                _loanrequestController.Kyc_List.result.village
                                    .toString()
                                    .substring(7, 20),
                                style:
                                    TextStyle(fontSize: 14, color: Colors.grey),
                              )
                            : Text('  '),

                        //keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            _loanrequestController.valVillages = value.id;
                          });
                          //  _tMyAccountsController.updateValue2(value);
                        },
                        dialogBox: false,
                        isExpanded: true,
                        menuConstraints:
                            BoxConstraints.tight(Size.fromHeight(350)),
                        // validator: (value) =>
                        //     value == null ? 'emptyerror'.tr : null,
                      ),
                    );
                    // DropdownButton(
                    //   hint: (_loanrequestController.Kyc_List != null)
                    //       ? Text(
                    //           _loanrequestController.Kyc_List.result.village
                    //               .toString()
                    //               .substring(4, 15),
                    //           style:
                    //               TextStyle(fontSize: 14, color: Colors.grey),
                    //         )
                    //       : Text('  '),
                    //   iconSize: 40,
                    //   isDense: true,
                    //   iconEnabledColor:
                    //       Theme.of(context).secondaryHeaderColor,
                    //   iconDisabledColor: Colors.blue,
                    //   underline: SizedBox(),
                    //   // decoration: InputDecoration(
                    //   //   labelText: 'Gender'.tr,
                    //   //   labelStyle: TextStyle(color: Colors.grey),
                    //   //   border: OutlineInputBorder(),
                    //   //   enabledBorder: InputBorder.none,
                    //   //),
                    //
                    //   //  isExpanded: true,
                    //   focusColor: Colors.blue,
                    //   elevation: 3,
                    //   style: TextStyle(
                    //     color: Colors.black,
                    //   ),
                    //   items: _loanrequestController.Villageslist
                    //       // _Compulsory_service
                    //       .map((item) {
                    //     return DropdownMenuItem(
                    //       child: new Text(
                    //         item.name,
                    //         style: TextStyle(overflow: TextOverflow.fade),
                    //       ),
                    //       value: item.id,
                    //     );
                    //   }).toList(),
                    //   onChanged: (newVal) {
                    //     setState(() {
                    //       _loanrequestController.valVillages = newVal;
                    //     });
                    //     // _loanrequestController.updateValue(
                    //     //     _loanrequestController.valresidency, newVal);
                    //   },
                    //   value: _loanrequestController
                    //       .valVillages // complaintController.time,
                    //   );
                  }),
                ),
              ],
            ),
            SizedBox(
              height: 20,
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
                    while (_loanrequestController.Residencylist == null) {
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
                        items: _loanrequestController.Residencylist
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
                            _loanrequestController.valresidency = newVal;
                          });
                          // _loanrequestController.updateValue(
                          //     _loanrequestController.valresidency, newVal);
                        },
                        value: _loanrequestController
                            .valresidency // complaintController.time,
                        );
                  }),
                ),
              ],
            ),
            // Global.Custom_TF(_loanrequestController.home_rentTextController,
            //     "Home rent value", TextInputType.number),
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
            SizedBox(
              height: Get.height / 5,
            ),

            Align(
                alignment: Alignment.bottomCenter,
                // padding: EdgeInsets.only(bottom: 5),
                child: Global.Custom_Botton('Submit', function: () async {
                  if (_loanrequestController.Kyc_List == null) {
                    if (_formKey.currentState.validate()) {
                      print('33');

                      setState(() {
                        _loanrequestController.valbirthday =
                            _loanrequestController.dropdownDatePicker
                                .getDate('-');
                      });

                      _loanrequestController.valbirthday == 'null-null-null'
                          ? {
                              Get.snackbar(
                                  'Error'.tr, 'Select BirthDay  is required'.tr,
                                  backgroundColor: Color(0xc3cff6fa),
                                  icon: Icon(
                                    Icons.error_sharp,
                                    color: Color(0xff8e0016),
                                  ))
                            }
                          : _loanrequestController.IDTextController.text !=
                                  _loanrequestController
                                      .Confirm_IDTextController.text
                              ? {
                                  Get.snackbar('Error'.tr,
                                      'Confirm ID not match with ID'.tr,
                                      backgroundColor: Color(0xc3cff6fa),
                                      icon: Icon(
                                        Icons.error_sharp,
                                        color: Color(0xff8e0016),
                                      ))
                                }
                              // : Global.indexOp == 0
                              //     ? await Get.toNamed('/financialStatements')
                              //     : Global.indexOp == 0
                              //         ? _loanrequestController.apiloanreq(context)
                              : _loanrequestController
                                  .apiCreateBasicInfo(context);
                    }
                  } else {
                    Get.back();
                    Get.back();
                    Get.snackbar('Note'.tr, 'You have pre-filled data'.tr,
                        duration: Duration(seconds: 6),
                        backgroundColor: Color(0xc3cff6fa),
                        icon: Icon(
                          Icons.warning,
                          color: Colors.yellow,
                        ));
                  }
                }, formkey: _formKey))
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
            //     onPressed: () async {
            //       print('3443');
            //       if (_formKey.currentState.validate()) {
            //         print('33');
            //
            //         setState(() {
            //           _loanrequestController.valbirthday =
            //               _loanrequestController.dropdownDatePicker
            //                   .getDate('-');
            //         });
            //
            //         _loanrequestController.valbirthday == 'null-null-null'
            //             ? {
            //                 Get.snackbar(
            //                     'Error'.tr, 'Select BirthDay  is required'.tr,
            //                     backgroundColor: Color(0xc3cff6fa),
            //                     icon: Icon(
            //                       Icons.error_sharp,
            //                       color: Color(0xff8e0016),
            //                     ))
            //               }
            //             : _loanrequestController.IDTextController.text !=
            //                     _loanrequestController
            //                         .Confirm_IDTextController.text
            //                 ? {
            //                     Get.snackbar('Error'.tr,
            //                         'Confirm ID not match with ID'.tr,
            //                         backgroundColor: Color(0xc3cff6fa),
            //                         icon: Icon(
            //                           Icons.error_sharp,
            //                           color: Color(0xff8e0016),
            //                         ))
            //                   }
            //                 // : Global.indexOp == 0
            //                 //     ? await Get.toNamed('/financialStatements')
            //                 //     : Global.indexOp == 0
            //                 //         ? _loanrequestController.apiloanreq(context)
            //                 :
            //         _loanrequestController
            //                     .apiCreateBasicInfo(context);
            //       }
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
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
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
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/Pi.png',
                          width: 50,
                          height: 30,
                        ),
                        Text("personal information".tr,
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
                    height: 580,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      // child: Expanded(
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
                                          if (_formKey.currentState
                                              .validate()) {
                                            liquidController.jumpToPage(
                                                page: liquidController
                                                                .currentPage +
                                                            1 >
                                                        pages.length - 1
                                                    ? 0
                                                    : liquidController
                                                            .currentPage +
                                                        1);
                                          }
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
                    ),
                  ),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),

      // ),
    );
  }

  gender() {
    return _loanrequestController.valgen == 'male'.tr
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
                            child: new Text(
                              item.name,
                              style: TextStyle(overflow: TextOverflow.fade),
                            ),
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
    return _loanrequestController.valmarital == 2
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
    if (_formKey.currentState.validate())
      setState(() {
        page = lpage;
      });
  }
}

class VagasDisponivei {
  String name;
  String id;

  VagasDisponivei({this.name, this.id});

  @override
  String toString() {
    return '${name} ${id}';
  }
}
