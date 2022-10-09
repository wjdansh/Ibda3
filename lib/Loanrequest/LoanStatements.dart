import 'dart:math';
import 'dart:ui';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ibda3/Operations/parts.dart';
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
class LoanStatements extends StatefulWidget {
  @override
  _LoanStatementsState createState() => _LoanStatementsState();
}

class _LoanStatementsState extends State<LoanStatements> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  final loanrequestController _loanrequestController =
      Get.put(loanrequestController());

  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  int len;
  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

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
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Global.Custom_TF(_loanrequestController.projectOwnerController,
                  "project Owner", TextInputType.text),
              Global.Custom_TF(_loanrequestController.projectNameController,
                  "project name", TextInputType.text),
              Global.Custom_TF(_loanrequestController.WorkAddressController,
                  "Work address", TextInputType.text),
              Global.Custom_TF(_loanrequestController.RentalController,
                  "Rental", TextInputType.number),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 2.5,
                    child: Text(
                      'Start of the contract'.tr,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    height: 30,
                    width: Get.width / 2.2,
                    padding: EdgeInsets.only(left: 5.0, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.20),
                    ),
                    child: _loanrequestController.dropdownDatePickerStart,
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: Get.width / 2.5,
                    child: Text(
                      'End of the contract'.tr,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ),
                  Container(
                    width: Get.width / 2,
                    height: 30,
                    // width: 150,
                    padding: EdgeInsets.only(left: 5.0, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.20),
                    ),
                    child: _loanrequestController.dropdownDatePickerEnd,
                  ),
                ],
              ),
              Global.Custom_TF(_loanrequestController.MonthlySTextController,
                  "Monthely sales", TextInputType.number),
            ],
          ),
        ),
        //  ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Global.Custom_TF(
                      _loanrequestController.SalariesOfEmployeesController,
                      'Salaries of employees',
                      TextInputType.number),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Loan Officer'.tr,
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
                          while (
                              _loanrequestController.LoanOfficerlist == null) {
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
                              items: _loanrequestController.LoanOfficerlist.map(
                                  (item) {
                                return DropdownMenuItem(
                                  child: new Text(
                                    item.name,
                                    style:
                                        TextStyle(overflow: TextOverflow.fade),
                                  ),
                                  value: item.stringId,
                                );
                              }).toList(),
                              onChanged: (newVal) {
                                setState(() {
                                  _loanrequestController.valLoanOfficer =
                                      newVal;
                                });
                              },
                              value: _loanrequestController
                                  .valLoanOfficer // complaintController.time,
                              );
                        }),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Global.Custom_TF(
                      _loanrequestController.PermanentEmployeesController,
                      'Permanent employees of the project',
                      TextInputType.number),
                  Global.Custom_TF(
                      _loanrequestController.TemporaryEmployeesController,
                      'Temporary employees of the project',
                      TextInputType.number),
                  Global.Custom_TF(_loanrequestController.fuelController,
                      'fuel', TextInputType.number),
                  Global.Custom_TF(_loanrequestController.maintenanceController,
                      'maintenance', TextInputType.number),
                  Global.Custom_TF(_loanrequestController.goodsController,
                      'Estimated value of goods', TextInputType.number),
                ],
              ),
            ),
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Global.Custom_TF(_loanrequestController.equipmentController,
                  'Estimated value of equipment', TextInputType.number),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Institution\nIdentification Ways'.tr,
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
                      while (_loanrequestController.InstitutionIWlist == null) {
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
                          items: _loanrequestController.InstitutionIWlist.map(
                              (item) {
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
                              _loanrequestController.valInstitutionIW = newVal;
                            });
                          },
                          value: _loanrequestController
                              .valInstitutionIW // complaintController.time,
                          );
                    }),
                  ),
                ],
              ),
              // Global.Custom_DropDown(
              //   'Institution\nIdentification Ways',
              //   _loanrequestController.valInstitutionIW,
              //   _loanrequestController.InstitutionIWlist,
              // ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Project States'.tr,
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
                      while (_loanrequestController.ProjectStateslist == null) {
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
                          items: _loanrequestController.ProjectStateslist.map(
                              (item) {
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
                              _loanrequestController.valProjectStates = newVal;
                            });
                          },
                          value: _loanrequestController
                              .valProjectStates // complaintController.time,
                          );
                    }),
                  ),
                ],
              ),
              // Global.Custom_DropDown(
              //     'Project States',
              //     _loanrequestController.valProjectStates,
              //     _loanrequestController.ProjectStateslist),
              Global.Custom_TF(_loanrequestController.phoneProjectController,
                  'Phone', TextInputType.number),
              Global.Custom_TF(_loanrequestController.PropertyOwnerController,
                  'Property Owner', TextInputType.text),
              Global.Custom_TF(_loanrequestController.ExperienceYearsController,
                  'Experience Years', TextInputType.number),
              Global.Custom_TF(_loanrequestController.PurposeController,
                  'Purpose of the loan', TextInputType.text),
            ],
          ),
        ),
        //  ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xff0E2947),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                physics: NeverScrollableScrollPhysics(),
                // physics: const BouncingScrollPhysics(
                //     parent: AlwaysScrollableScrollPhysics()),
                shrinkWrap: true,
                children: [
                  Global.Custom_TF(
                      _loanrequestController.CustomerDebtController,
                      'Customer debt balance',
                      TextInputType.number),
                  Global.Custom_TF(
                      _loanrequestController.SupplierDebtController,
                      'Supplier debt balance',
                      TextInputType.number),
                  Global.Custom_TF(_loanrequestController.LoanValueController,
                      'Loan value required', TextInputType.number),
                  Global.Custom_TF(_loanrequestController.PaymentController,
                      'Payment value', TextInputType.number),
                  Global.Custom_TF(_loanrequestController.instalmentsController,
                      'Number of the instalments', TextInputType.number),
                  // Global.Custom_TF(_loanrequestController.PurposeController,
                  //     'Purpose of the loan', TextInputType.text),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                      color: Color(0xff0EBDC8),
                      splashColor: Colors.white,
                      height: 40,
                      minWidth: Get.width,
                      child: Text(
                        'Submit'.tr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      onPressed: () {
                        // print('11111  ${dropdownDatePickerStart.getDate()}');
                        // print('1144  ${dropdownDatePickerStart.getDate('-')}');
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _loanrequestController.valStart =
                                _loanrequestController.dropdownDatePickerStart
                                    .getDate('-');
                            _loanrequestController.valEnd =
                                _loanrequestController.dropdownDatePickerEnd
                                    .getDate('-');
                          });
                          // (_loanrequestController.valStart == 'null-null-null' ||
                          //         _loanrequestController.valEnd == 'null-null-null')
                          //     ? {
                          //         //  Get.back(),
                          //         // ignore: unnecessary_statements
                          //         Get.snackbar(
                          //             'Error'.tr, 'Select BirthDay  is required'.tr,
                          //             backgroundColor: Color(0xc3cff6fa),
                          //             icon: Icon(
                          //               Icons.error_sharp,
                          //               color: Color(0xff8e0016),
                          //             ))
                          //       }
                          //     :
                          // _loanrequestController.apiloanreqstat(context);
                          _loanrequestController.valStart == 'null-null-null'
                              ? {
                                  //  Get.back(),
                                  // ignore: unnecessary_statements
                                  Get.snackbar(
                                      'Error'.tr,
                                      'Select contract Start Date  is required'
                                          .tr,
                                      backgroundColor: Color(0xc3cff6fa),
                                      icon: Icon(
                                        Icons.error_sharp,
                                        color: Color(0xff8e0016),
                                      ))
                                }
                              : _loanrequestController.valEnd ==
                                      'null-null-null'
                                  ? {
                                      //  Get.back(),
                                      // ignore: unnecessary_statements
                                      Get.snackbar(
                                          'Error'.tr,
                                          'Select contract End Date  is required'
                                              .tr,
                                          backgroundColor: Color(0xc3cff6fa),
                                          icon: Icon(
                                            Icons.error_sharp,
                                            color: Color(0xff8e0016),
                                          ))
                                    }
                                  : showDialog(
                                      context: context,
                                      builder: (_) {
                                        Future.delayed(Duration(seconds: 5),
                                            () {
                                          Navigator.of(context).pop();
                                        });
                                        return Dialog(
                                          backgroundColor:
                                              Colors.black.withOpacity(0.5),
                                          child: Center(
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15.0,
                                                          right: 15,
                                                          top: 50,
                                                          bottom: 40),
                                                  child: Image.asset(
                                                    'assets/images/done.png',
                                                    height: 100,
                                                    width: 100,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0,
                                                          right: 5,
                                                          top: 50,
                                                          bottom: 40),
                                                  child: Text(
                                                    'The data was successfully filled out'
                                                        .tr,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }).then((value) => {
                                        print('nn2'),
                                        len = _loanrequestController
                                            .checkedMember.length,
                                        print('nnnn'),
                                        // for (var i = 0; i < len; i++)
                                        //   {
                                        Global.GCount != len
                                            ? _loanrequestController
                                                .mm(Global.GCount)
                                            : print('vvvv'),
                                        print('t ${Global.GCount}'),

                                        print(_loanrequestController
                                            .groupLoanModel),
                                        Global.GCount != 0
                                            ? _loanrequestController.G_Loan.add(
                                                _loanrequestController.gl)
                                            : print('vvvv'),
                                        Global.GCount = Global.GCount + 1,
                                        Global.GCount == 0
                                            ? Global.GHMGLoan == 'Head'
                                            :
                                            //Get.toNamed('/LoanStatements'),
                                            Global.GHMGLoan = 'Member',

                                        Global.GCount != len + 1
                                            ? {
                                                //  Get.back(),
                                                liquidController.jumpToPage(
                                                    page: 0),
                                              }
                                            : {
                                                Global.checkL_info = true,
                                                Loan(),
                                                Get.offAndToNamed(
                                                    '/Operations'),
                                                // _loanrequestController
                                                //     .apiloanreqstat(context),
                                                Global.GCount = 0
                                              },
                                        //print('vvvv'),
                                        // print(_loanrequestController.G_Loan[i]
                                        //     .projectInfo.projectName),
                                        //print('ggg'),
                                        // print(_loanrequestController.G_Loan[0]
                                        //     ['loanInfo'])
                                        // },
                                        print('ggg'),
                                        print(_loanrequestController.ll),
                                        print(_loanrequestController.G_Loan),
                                        print('zzzzzzzzzz'),

                                        // _loanrequestController
                                        //     .apiloanreqstat(context),
                                      });

                          //Get.back();
                          // showDialog(
                          //     context: context,
                          //     builder: (_) {
                          //       Future.delayed(Duration(seconds: 5), () {
                          //         Navigator.of(context).pop(true);
                          //       });
                          //       return Dialog(
                          //         backgroundColor: Colors.transparent,
                          //         child: Container(
                          //           width: 200,
                          //           height: 300,
                          //           decoration: BoxDecoration(
                          //               color: Colors.black.withOpacity(0.1),
                          //               image: DecorationImage(
                          //                 image:
                          //                     ExactAssetImage('assets/images/done.png'),
                          //                 //fit: BoxFit.scaleDown
                          //               )),
                          //         ),
                          //       );
                          //     }).then((value) => {Get.back(), Get.back()});
                        }
                      }),
                ],
              ),
            ),
          ),
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
                        Text("Loan Statements".tr,
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
                  SizedBox(
                    height: 10,
                  ),
                  Global.GIGLoan == 'Group Loan'
                      ? Row(
                          children: [
                            Text("fill information for ${Global.GHMGLoan}",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Theme.of(context)
                                        .secondaryHeaderColor)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                                "${Global.GCount != 0 ? ":  ${_loanrequestController.GroupMemberslist[Global.GCount - 1].name}" : ''}",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        )
                      : SizedBox(
                          height: 1,
                        ),
                  Container(
                    //color: Colors.white.withOpacity(0.2),
                    height: MediaQuery.of(context).size.height / 1.3,
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
                                          "Next >>".tr,
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

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}
