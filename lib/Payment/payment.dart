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

import 'ServicesController.dart';
import 'billerController.dart';

// ignore: camel_case_types
class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final billerController _billercontroller = Get.put(billerController());

  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  LocalizationService tran = new LocalizationService();

  bool login = true;
  //final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;
  // List<bool> _isChecked;
  bool fff;
  //TabController _tabController;
  // Timer timer;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        padding: EdgeInsets.only(top: 40),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          // child: Form(
          //   key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/icons/seplogo3.png',
                      width: 180,
                      height: 60,
                    ),
                    //  SizedBox(width: 25),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60.0, vertical: 10),
                  child: Divider(
                    color: Theme.of(context).secondaryHeaderColor,
                    thickness: 0.5,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RubberBand(
                      key: _key,
                      child: Container(
                        height: Get.height / 1.1,
                        child:
                            //                     GetBuilder<ServicesController>(
                            //                         builder: (controller) {
                            //                       while (_servicesController.billerList == null) {
                            //                         return Center(
                            //                             child: SpinKitFadingCircle(
                            //                           color: Theme.of(context).accentColor,
                            //                         ));
                            //                       }
                            //
                            //                       return
                            FutureBuilder(
                                future: _billercontroller.apiGetBiller(),
                                builder: (context, snapShot) {
                                  if (!snapShot.hasData) {
                                    return Container(
                                      padding: EdgeInsets.only(top: 2),
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Center(
                                            child: SpinKitFadingCircle(
                                          color: Theme.of(context).accentColor,
                                        )),
                                      ),
                                    );
                                  } else {
                                    return GridView.builder(
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 10.0,
                                          mainAxisSpacing: 30.0,
                                        ),
                                        itemCount: snapShot
                                            .data.length, //resultList.length,
                                        itemBuilder: (context, i) {
                                          print(
                                            snapShot.data.length,
                                          );

                                          //loanProcess_id = resultList[i].loanProcessId;

                                          // stateLoan = _servicesController
                                          //     .resultList[i].state;

                                          return menuitem(
                                              Global.lan == 'English'
                                                  ? _billercontroller.billerList
                                                      .value[i].billerNameEn
                                                  : _billercontroller.billerList
                                                      .value[i].billerNameAr,
                                              _billercontroller.billerList
                                                  .value[i].imageName,
                                              index: _billercontroller
                                                  .billerList.value[i].id);
                                        });
                                  }
                                }),
                        // return GridView(
                        //   gridDelegate:
                        //       SliverGridDelegateWithFixedCrossAxisCount(
                        //     crossAxisCount: 2,
                        //     crossAxisSpacing: 10.0,
                        //     mainAxisSpacing: 30.0,
                        //   ),
                        //   //shrinkWrap: true,
                        //   children:
                        //
                        //   _servicesController.billerList
                        //       .map<Widget>(
                        //         (item) => menuitem(
                        //             Global.lan == 'English'
                        //                 ? item.billerNameEn
                        //                 : item.billerNameAr,
                        //             item.imageName,
                        //             index: item.id),
                        //       )
                        //       .toList(),
                        //
                        // );
                        //   }),
                      ),
                    ),
                  ),
                ),

                // tabBar()
              ],
            ),
          ),
          //  ),
        ),
      ),
      floatingActionButton: Global.buildFabCircularMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  menuitem(String text, String icon, {int index}) {
    return InkWell(
        child: Column(
          children: [
            Container(
              //  color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                border: Border.all(
                    color: Colors.white, style: BorderStyle.solid, width: 0.20),
              ),
              child: IconButton(
                icon:
                    // ImageIcon(
                    //   AssetImage('assets/images/icons/${icon}.png'),
                    //   color: Theme.of(context).accentColor,
                    // ),
                    Image.network(
                  'http://185.194.124.200:8029/ImagesBiller/' + icon.toString(),
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
                // Image.asset('assets/images/icons/sep/${icon}.png'),
                // tooltip: 'gggg',
                iconSize: 90,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              text.tr,
              style: TextStyle(
                color: Colors.white,
                // fontSize: MediaQuery.of(Get.context).textScaleFactor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        onTap: () {
          // setState(() {
          //   _servicesController.Id = index;
          //   _servicesController.billerName = text;
          //   _servicesController.billerIcon = icon;
          // });

          Get.toNamed('/Services', arguments: [index, text, icon]);
          //   await _servicesController.apiGetFormFields();
        });
  }
}
