import 'dart:math';
import 'dart:ui';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import '../global/globalVars.dart' as Global;
import 'package:get/get.dart';
import '../provideri.dart';
import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:dropdown_date_picker/dropdown_date_picker.dart';
import './LendingGuideView.dart';

class savingGuideView extends StatefulWidget {
  @override
  _savingGuideViewState createState() => _savingGuideViewState();
}

class _savingGuideViewState extends State<savingGuideView> {
  int page = 0;
  LiquidController liquidController;
  UpdateType updateType;

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
    // final pages = [
    //   Container(
    //     height: MediaQuery.of(context).size.height,
    //     color: Color(0xff0E2947),
    //     child: ListView(
    //       shrinkWrap: true,
    //       physics: const AlwaysScrollableScrollPhysics(),
    //       children: [
    //         Container(
    //           //  height: MediaQuery.of(context).size.height / 5,
    //           width: MediaQuery.of(context).size.width / 2,
    //           child: buildSguide(
    //               context,
    //               ': المستندات المطلوبة للتقدم بطلب فتح حساب'
    //                   '  \n	صورة عن البطاقة الشخصية للمدنيين  *'
    //                   '  \n صورة عن البطاقة العسكرية الحديثة للعسكريين أو اخراج قيد عسكري مرفق برقم وطني  '
    //                   ' \n 	 سند اقامة ، فاتورة خدمات حديثة  *'
    //                   '  \n	اثبات دخل  *',
    //               "فتح حساب"),
    //         ),
    //       ],
    //     ),
    //   ),
    // ];
    final pages1 = [
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0E2947),
        child: Column(
          // shrinkWrap: true,
          // physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.2,
              //  height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width,
              child: buildSguide(
                context,
                'Types of accounts that can be opened in AL Ibdaa Bank for microfinance:',
                t2: '1.	Current Account:',
                t4: '1.	Current Account:dis',
                t5: '2.	Adult Savings Account: ',
                t7: '2.	Adult Savings Account:dis',
                t8: '3.	Child Savings Account:',
                t10: '3.	Child Savings Account:dis',
                t11: '4.	Fixed Term Deposit Account:',
                t12: '4.	Fixed Term Deposit Account:dis',
                t13: '5.	Online account:',
                t14: '5.	Online account:dis',
              ),
            ),
          ],
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xff0E2947),
        child: Column(
          // shrinkWrap: true,
          //physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              child: buildSguide(
                context,
                'Documents required to open an account:',
                t2: '1.	Current Account and Adult Savings Account:',
                t4: '1. Current Account and Adult Savings Account:dis',
                t5: '2.Child Savings Account:',
                t7: '2.Child Savings Account:dis',
                t8: '3.	The electronic account:',
                t10: '3.	The electronic account:dis',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width,
              child: buildSguide(
                context,
                'How to open accounts using the application?',
                t1: 'How to open accounts using the application?dis',
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            // Container(
            //   height: MediaQuery.of(context).size.height / 3,
            //   width: MediaQuery.of(context).size.width / 2,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/lendingGuide1_2.png"),
            //       // fit: BoxFit.cover,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    ];
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
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
                          'assets/images/icons/saving.png',
                          width: 70,
                          height: 50,
                        ),
                        Text("Saving guide".tr,
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
            Container(
              //color: Colors.white.withOpacity(0.2),
              height: MediaQuery.of(context).size.height / 1.2,
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
                              pages: pages1,
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
                                          pages1.length, _buildDot),
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                                  pages1.length - 1
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
    // return pages[page];

    setState(() {
      page = lpage;
    });
  }
}
