import 'dart:async';
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
class GroupLoan extends StatefulWidget {
  @override
  _GroupLoanState createState() => _GroupLoanState();
}

class _GroupLoanState extends State<GroupLoan> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;
  List<String> sn = [
    '<< No Members >>\n \n Members should put you in the head'
  ];
  loanrequestController _loanrequestController;

  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  // List<bool> _isChecked;
  bool fff;
  //TabController _tabController;
  Timer timer;
  @override
  void initState() {
    _loanrequestController = Get.put(loanrequestController());
    liquidController = LiquidController();
    timer = Timer.periodic(Duration(seconds: 1), (Timer t) => build(context));
    _loanrequestController.checkedMember = [];
    super.initState();
    // ff() {
    //   if (_loanrequestController.GroupMemberslist == null)
    //   //    builld(BuildContext context) {
    //   {
    //     while (_loanrequestController.GroupMemberslist == null)
    //       return Center(
    //           child: SpinKitFadingCircle(
    //         color: Theme.of(context).accentColor,
    //       ));
    //     // setState(() {});
    //     //
    //     // while (_loanrequestController.GroupMemberslist == null)
    //     //   return Center(
    //     //       child: SpinKitFadingCircle(
    //     //     color: Theme.of(context).accentColor,
    //     //   ));
    //     //}
    //
    //     // while (_loanrequestController.GroupMemberslist == null)
    //     //   return Center(
    //     //       child: SpinKitFadingCircle(
    //     //     color: Theme.of(context).accentColor,
    //     //   ));
    //     // _isChecked = List<bool>.filled(
    //     //     _loanrequestController.GroupMemberslist.length, false);
    //
    //     // Get.dialog(Center(
    //     //     child: SpinKitFadingCircle(
    //     //   color: Theme.of(context).accentColor,
    //     // )));
    //
    //     fff = true;
    //   }
    // }

    // _isChecked = List<bool>.filled(
    //     _loanrequestController.GroupMemberslist.length != 0
    //         ? _loanrequestController.GroupMemberslist.length
    //         : 1,
    //     false);

    // ff();
    // _isChecked = List<bool>.filled(
    //     //_loanrequestController.GroupMemberslist.length != 0
    //     fff == true ? _loanrequestController.GroupMemberslist.length : 0,
    //     false);
  }

  @override
  Widget build(BuildContext context) {
    // while (_loanrequestController.GroupMemberslist == null)
    //   return Dialog(
    //     backgroundColor: Colors.white.withOpacity(0.6),
    //     child: Center(
    //         child: SpinKitFadingCircle(
    //       color: Theme.of(context).accentColor,
    //     )),
    //   );
    // Get.back();
    setState(() {});

    tabBar() {
      // while (_loanrequestController.GroupMemberslist == null)
      // return Center(
      //     child: SpinKitFadingCircle(
      //   color: Theme.of(context).accentColor,
      // ));

      // _isChecked = List<bool>.filled(
      //     _loanrequestController.GroupMemberslist.length, false);
      return SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: Theme.of(context)
                  .primaryColor, //Colors.white.withOpacity(0.4),
              appBar: TabBar(
                labelColor: Theme.of(context).secondaryHeaderColor,
                tabs: [
                  Tab(
                    text: ('Group Members'.tr),
                  ),
                  Tab(
                    text: ('Group Head'.tr),
                  ),
                ],
              ),
              body: TabBarView(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text('Select Group members :'.tr,
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.grey)),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height:
                                MediaQuery.of(context).size.height / 2.5, //30
                            // width: 150,
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(
                                  color: Colors.white,
                                  style: BorderStyle.solid,
                                  width: 0.20),
                            ),
                            child: GetBuilder<loanrequestController>(
                                builder: (controller) {
                              // while (_loanrequestController.GroupMemberslist ==
                              //     null)
                              //   showDialog(
                              //       context: context,
                              //       builder: (_) {
                              //         Future.delayed(Duration(seconds: 2), () {
                              //           Navigator.of(context).pop(true);
                              //         });
                              //         return Dialog(
                              //           backgroundColor:
                              //               Colors.black.withOpacity(0.1),
                              //           child: Container(
                              //             width: Get.width,
                              //             height: Get.height,
                              //             child: Center(
                              //                 child: SpinKitFadingCircle(
                              //               color:
                              //                   Theme.of(context).accentColor,
                              //             )),
                              //           ),
                              //         );
                              //       }).then((value) => {
                              //         setState(() {}),
                              //
                              //         Get.back()
                              //         // Text(
                              //         //     '<< No Members >>\n \n Members should put you in the head'
                              //         //         .tr,
                              //         //     style: TextStyle(
                              //         //         fontSize: 20.0,
                              //         //         color: Theme.of(context)
                              //         //             .primaryColor))
                              //       });
                              //   return Center(
                              //       child: SpinKitFadingCircle(
                              //     color: Theme.of(context).accentColor,
                              //   ));
                              while (_loanrequestController.GroupMemberslist ==
                                  null)
                                return Center(
                                    child: SpinKitFadingCircle(
                                  color: Theme.of(context).accentColor,
                                ));
                              // _isChecked = List<bool>.filled(
                              //     _loanrequestController
                              //         .GroupMemberslist.length,
                              // //     false);
                              // if (_loanrequestController
                              //         .GroupMemberslist.length ==
                              //     0)
                              //   return Text(
                              //       '<< No Members >>\n \n Members should put you in the head'
                              //           .tr,
                              //       style: TextStyle(
                              //           fontSize: 20.0,
                              //           color: Theme.of(context).primaryColor));
                              // else
                              return ListView.builder(
                                itemCount: _loanrequestController
                                    .GroupMemberslist.length,
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    title: Text(_loanrequestController
                                        .GroupMemberslist[index].name),
                                    value:
                                        _loanrequestController.isChecked[index],
                                    onChanged: (val) {
                                      //   setState(() {});
                                      setState(
                                        () {
                                          _loanrequestController
                                              .isChecked[index] = val;
                                        },
                                      );

                                      print(
                                          '33 ${_loanrequestController.GroupMemberslist[index].id}');
                                      print(
                                          '44 ${_loanrequestController.isChecked[index]}');
                                      _loanrequestController.isChecked[index] ==
                                              true
                                          ? _loanrequestController.checkedMember
                                              .add(_loanrequestController
                                                  .GroupMemberslist[index].id)
                                          : _loanrequestController.checkedMember
                                              .remove(_loanrequestController
                                                  .GroupMemberslist[index].id);
                                    },
                                  );
                                },
                              );
                            }),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Global.Custom_Botton(
                            'Submit',
                            function: () {
                              (_loanrequestController.GroupMemberslist !=
                                          null &&
                                      (_loanrequestController
                                              .checkedMember.length !=
                                          0))
                                  ? {
                                      Get.back(),
                                      Get.toNamed('/LoanStatements'),
                                      Global.GHMGLoan = 'Head'
                                    }
                                  : Get.snackbar('Error'.tr,
                                      'Members must be selected first in order to complete group loan information',
                                      duration: Duration(seconds: 6),
                                      backgroundColor: Color(0xc3cff6fa),
                                      icon: Icon(
                                        Icons.error_sharp,
                                        color: Color(0xff8e0016),
                                      ));

                              print(
                                  '244 ${_loanrequestController.checkedMember}');
                              print('99 ${Global.GIGLoan}');
                              //  print('99 ${Global.GIGLoan}');
                            },
                            formkey: _formKey,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    //  color: Colors.blueGrey,
                    child: Column(
                      // backgroundColor: Colors.white,
                      // title: Text('Group Head'.tr,
                      //     style: TextStyle(fontSize: 20.0, color: Colors.grey)),
                      // leading: Icon(Icons.info_outline),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Text('Current Authorized Group Head :'.tr,
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey)),
                              Text(
                                _loanrequestController.headval.toString(),
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Global.Custom_Botton(
                            'Unauthorize'.tr,
                            function: () {
                              _loanrequestController.apiUnauthorized();
                              // setState(() {});
                            },
                            formkey: _formKey,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ExpansionTile(
                          backgroundColor: Colors.blueGrey,
                          title: Text(
                              'Change Authorized Group Head Customer By National Number'
                                  .tr,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey,
                              )),
                          // leading: Icon(
                          //   Icons.arrow_back_ios_outlined,
                          //   color: Theme.of(context).accentColor,
                          // ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Global.TF(
                                  _loanrequestController.N_NumberTextController,
                                  'National Number',
                                  TextInputType.number,
                                  false),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Global.Custom_Botton(
                                'Authorize',
                                function:
                                    _loanrequestController.AuthorizedGroupHead,
                                formkey: _formKey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //   ),
          ),
        ),
      );
    }

    // while (_loanrequestController.GroupMemberslist == null)
    //   return Center(
    //       child: SpinKitFadingCircle(
    //     color: Theme.of(context).accentColor,
    //   ));
    // _isChecked = List<bool>.filled(
    //     _loanrequestController.GroupMemberslist.length, false);
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
        padding: EdgeInsets.only(top: 10),
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
                  tabBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
