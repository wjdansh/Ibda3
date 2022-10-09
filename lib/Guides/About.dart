import 'dart:ui';
import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'LendingGuideView.dart';

class aboutview extends StatefulWidget {
  @override
  _aboutviewState createState() => _aboutviewState();
}

class _aboutviewState extends State<aboutview> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage("assets/images/back.png"),
          //   fit: BoxFit.cover,
          // ),
        ),
        padding: EdgeInsets.only(bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: CustomPaint(
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.05,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, left: 8.0, right: 8, top: 250),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: new TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Text('aboutIbdaa'.tr,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16,
                                          )),
                                    ),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Text(
                                          'About Al Ibdaa bank for microfinance:dis'
                                              .tr,
                                          style: new TextStyle(
                                            color: Color(0xff2f2f2f),
                                            // color: Theme.of(context).secondaryHeaderColor,
                                            fontSize: 16,
                                            //letterSpacing: 2,
                                          )),
                                    )),

                                    TextSpan(
                                        text: 'Our vision:'.tr,
                                        style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        )),
                                    // WidgetSpan(
                                    //   child: Text('Our vision:'.tr,
                                    //       textAlign: TextAlign.start,
                                    //       style: new TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         color:
                                    //             Theme.of(context).primaryColor,
                                    //         fontSize: 16,
                                    //       )),
                                    // ),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Text('Our vision:dis'.tr,
                                          style: TextStyle(
                                            color: Color(0xff2f2f2f),
                                            // color: Theme.of(context).secondaryHeaderColor,
                                            fontSize: 16,
                                            //letterSpacing: 2,
                                          )),
                                    )),
                                    // TextSpan(
                                    //     text: 'Our mission:'.tr,
                                    //     style: TextStyle(
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Theme.of(context).primaryColor,
                                    //       fontSize: 16,
                                    //     )),
                                    WidgetSpan(
                                      child: Text('Our mission:'.tr,
                                          style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontSize: 16,
                                          )),
                                    ),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Text('Our mission:dis'.tr,
                                          style: new TextStyle(
                                            color: Color(0xff2f2f2f),
                                            // color: Theme.of(context).secondaryHeaderColor,
                                            fontSize: 16,
                                            //letterSpacing: 2,
                                          )),
                                    )),
                                    TextSpan(
                                        text: 'Our values:'.tr,
                                        style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        )),
                                    // WidgetSpan(
                                    //   child: Text('Our values:'.tr,
                                    //       style: new TextStyle(
                                    //         fontWeight: FontWeight.bold,
                                    //         color:
                                    //             Theme.of(context).primaryColor,
                                    //         fontSize: 16,
                                    //       )),
                                    // ),
                                    WidgetSpan(
                                        child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30.0),
                                      child: Text('Our values:dis'.tr,
                                          style: new TextStyle(
                                            color: Color(0xff2f2f2f),
                                            // color: Theme.of(context).secondaryHeaderColor,
                                            fontSize: 16,
                                            //letterSpacing: 2,
                                          )),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    painter: HeaderCurvedContainer(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: Theme.of(context).secondaryHeaderColor,
                          size: 35,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.asset(
                    Global.lan == 'Arabic'
                        ? 'assets/images/logoAr.png'
                        : 'assets/images/logoEn.png',
                    width: Get.width / 1.5, //4
                    height: Get.width / 2, //7
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0xff0E2947);

    Path path = Path()
      ..relativeLineTo(0, 250)
      ..quadraticBezierTo(size.width / 2, 80.0, size.width, 250)
      ..relativeLineTo(0, -250)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
