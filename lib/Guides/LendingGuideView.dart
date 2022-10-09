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

// ignore: camel_case_types
class LendingGuideView extends StatefulWidget {
  @override
  _LendingGuideViewState createState() => _LendingGuideViewState();
}

class _LendingGuideViewState extends State<LendingGuideView> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

  // final loanrequestController _loanrequestController =
  //     Get.put(loanrequestController());

  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  bool login = true;
  final _formKey = GlobalKey<FormState>();

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
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0E2947),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          //  height: MediaQuery.of(context).size.height / 5,
          width: MediaQuery.of(context).size.width,
          child: buildSguide(
            context,
            'Loans that can be obtained from Ibdaa bank:',
            t1: 'Loans that can be obtained from Ibdaa bank:dis',
            t2: 'Loans to support existing projects or startup projects:',
            t4: 'Loans to support existing projects or startup projects:dis',
            t5: 'Loans to improve the quality of life:',
            t7: 'Loans to improve the quality of life:dis',
            t8: 'This is done through two methods:',
            t10: 'This is done through two methods:dis',
            t11: 'Individual Lending Methodology:',
            t12: 'Individual Lending Methodology:dis',
            t13: 'Group Lending Methodology:',
            t14: 'Group Lending Methodology:dis',
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0E2947),
        child: Column(
          mainAxisSize: MainAxisSize.min,

          // shrinkWrap: true,
          //physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              child: buildSguide(
                context,
                //  'Required documents for all types of loans:dis'.tr,
                'Required documents for all types of loans:',

                t1: 'Required documents for all types of loans:dis',
                t2: 'Additional documents required for each loan:',
                t4: 'Additional documents required for each loan:dis',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 2.7,
              width: MediaQuery.of(context).size.width,
              child: buildSguide(
                context, //'Acceptable guarantees:dis'.tr,
                'Acceptable guarantees:',
                t1: 'Acceptable guarantees:dis',
              ),
            ),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 1.3,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0E2947),
        child: Container(
          height: MediaQuery.of(context).size.height / 1.3,
          width: MediaQuery.of(context).size.width,
          child: buildSguide(
            context,
            'Documents required for the guarantee:',
            t2: 'Personal guarantee:',
            t3: '1.	Government sector employee:',
            t4: '1.	Government sector employee:dis',
            t6: '2.	Private sector employee:',
            t7: '2.	Private sector employee: dis',
            t9: '3.	Traders and professionals:',
            t10: '3.	Traders and professionals:dis',
            t11: 'Vehicle mortgage:',
            t12: 'Vehicle mortgage:dis',
            t13: 'Deposit or account with the bank:',
            t14: 'Deposit or account with the bank:dis',
          ),
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height / 1.3,
        color: Color(0xff0E2947),
        child: Container(
          //height: MediaQuery.of(context).size.height / 1.2,
          width: MediaQuery.of(context).size.width,
          child: buildSguide(
              context, 'Stages of obtaining a loan through the application:',
              t1: 'Stages of obtaining a loan through the application:dis'),
        ),
      ),
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/images/back.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Theme.of(context).secondaryHeaderColor,
                      size: 35,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/icons/loan.png',
                          width: 70,
                          height: 50,
                        ),
                        Text("Lending guide".tr,
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Divider(
                color: Theme.of(context).secondaryHeaderColor,
                thickness: 0.5,
              ),
            ),
            // SizedBox(
            //   height: 40,
            // ),
            Container(
              //color: Colors.white.withOpacity(0.2),
              height: MediaQuery.of(context).size.height / 1.2,
              //  height: 580,
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
                                    if (_formKey.currentState.validate()) {
                                      liquidController.jumpToPage(
                                          page: liquidController.currentPage +
                                                      1 >
                                                  pages.length - 1
                                              ? 0
                                              : liquidController.currentPage +
                                                  1);
                                    }
                                  },
                                  child: Text(
                                    "Next >>".tr,
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
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
      // floatingActionButton: Global.buildFabCircularMenu(),
      // ),
    );
  }

  pageChangeCallback(int lpage) {
    setState(() {
      page = lpage;
    });
  }
}

buildSguide(
  BuildContext context,
  String title, {
  String t1 = '',
  String t2 = '',
  String t3 = '',
  String t4 = '',
  String t5 = '',
  String t6 = '',
  String t7 = '',
  String t8 = '',
  String t9 = '',
  String t10 = '',
  String t11 = '',
  String t12 = '',
  String t13 = '',
  String t14 = '',
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 10.0),
    child: Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            // height: MediaQuery.of(context).size.height / 1.2,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 10, top: 65, right: 10, bottom: 20),
            //  margin: EdgeInsets.only(top: 45),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Theme.of(context).accentColor),
                //  color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.transparent,
                      offset: Offset(0, 10),
                      blurRadius: 10),
                ]),
            child: SingleChildScrollView(
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Text(
                  //   widget.title,
                  //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  RichText(
                    // textDirection:
                    //     !isRTL(title) ? TextDirection.rtl : TextDirection.ltr,
                    text: new TextSpan(
                      children: [
                        WidgetSpan(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          //transform: Matrix4.translationValues(0, -3, 0),
                          // margin: EdgeInsets.symmetric(horizontal: 30),
                          child: Text(t1.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                        // TextSpan(
                        //     text: t2.tr,
                        //     style: new TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       color: Theme.of(context).secondaryHeaderColor,
                        //       fontSize: 14,
                        //     )),
                        WidgetSpan(
                          child: Row(
                            children: [
                              Text(t2.tr,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                        WidgetSpan(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(t3.tr,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )),
                        )),
                        WidgetSpan(
                            child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(t4.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                        WidgetSpan(
                          child: Row(
                            children: [
                              Text(t5.tr,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(t6.tr,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )),
                        )),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(t7.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                        WidgetSpan(
                          child: Row(
                            children: [
                              Text(t8.tr,
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
                                    fontSize: 16,
                                  )),
                            ],
                          ),
                        ),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(t9.tr,
                              style: new TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                              )),
                        )),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(t10.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                        WidgetSpan(
                          child: Text(t11.tr,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                              )),
                        ),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(t12.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                        WidgetSpan(
                          child: Text(t13.tr,
                              style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                              )),
                        ),
                        WidgetSpan(
                            child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Text(t14.tr,
                              style: new TextStyle(
                                color: Colors.white,
                                // color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16,
                                //letterSpacing: 2,
                              )),
                        )),
                      ],
                    ),
                  ),
                  // Text(
                  //   description,
                  //   style: TextStyle(color: Colors.white, fontSize: 18),
                  //   textAlign: TextAlign.start,
                  // ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          right: 30,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Container(
              padding: const EdgeInsets.only(top: 10.0),
              color: Theme.of(context).primaryColor,
              child: Text(
                title.tr,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
                // textDirection:
                //     !isRTL(title) ? TextDirection.rtl : TextDirection.ltr,
              ),
            ),
          ),
        ),
        // Positioned(
        //   // left: 75,
        //   // right: 75,
        //   // top: 15,
        //   // bottom: 80,
        //   left: 75,
        //   right: 75,
        //   top: 175,
        //   bottom: 175,
        //   child: ClipRRect(
        //     borderRadius: BorderRadius.all(Radius.circular(20)),
        //     child: Container(
        //       color: Theme.of(context).primaryColor,
        //       child: Center(
        //         child: Text(
        //           title,
        //           style: TextStyle(
        //             color: Theme.of(context).accentColor,
        //             fontSize: 16,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ),
        //   // )
        // ),
      ],
    ),
  );
}
