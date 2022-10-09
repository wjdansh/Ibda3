import 'dart:async';

import 'dart:ui';

import 'package:ibda3/Loanrequest/LoanrequestController.dart';
import 'package:ibda3/Login/loginController.dart';
import 'package:ibda3/utility/Drawer.dart';
import 'package:provider/provider.dart';

import '../provideri.dart';
import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:toggle_switch/toggle_switch.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<AnimatorWidgetState> _key = GlobalKey<AnimatorWidgetState>();
  //final LoginController _loginController = Get.put(LoginController());
  final loanrequestController _loanrequestController =
      Get.put(loanrequestController());
  LocalizationService tran = new LocalizationService();
  Timer timer;
  void initState() {
    _loanrequestController.onInit();

    timer =
        Timer.periodic(Duration(microseconds: 1), (Timer t) => build(context));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    //  _loanrequestController.onInit();
    return drawer(
      Scaffold(
        resizeToAvoidBottomInset: true,
        //  backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.only(top: 10, bottom: 20),
          //  child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: Get.width / 7),
                  Center(
                    child: Image.asset(
                      Global.lan == 'Arabic'
                          ? 'assets/images/logoAr.png'
                          : 'assets/images/logoEn.png',
                      width: 180,
                      height: 90,
                    ),
                  ),
                  // SizedBox(width: 25),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // SizedBox(
                      //   width: 75, //Get.width / 7,
                      //   child: DropdownButton<dynamic>(
                      //     // hint: Text(
                      //     //   'AR/EN',
                      //     //   style:
                      //     //       TextStyle(fontSize: 15, color: Colors.white),
                      //     //   textAlign: TextAlign.end,
                      //     // ),
                      //     // isExpanded: true,
                      //     style: TextStyle(fontSize: 12, color: Colors.black),
                      //     underline: SizedBox(),
                      //     icon: Icon(
                      //       Icons.language,
                      //       color: Colors.grey,
                      //       size: 30,
                      //     ),
                      //     onChanged: (val) {
                      //       setState(() {
                      //         _loginController.lan = val;
                      //         tran.change(_loginController.lan);
                      //       });
                      //     },
                      //     items: tran.langs.map((item) {
                      //       return DropdownMenuItem(
                      //         child: Row(
                      //           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //           mainAxisSize: MainAxisSize.min,
                      //           children: [
                      //             // Icon(item == 'Arabic'
                      //             //     ?
                      //             Container(
                      //               width: 25,
                      //               height: 20,
                      //               child: item == 'Arabic'
                      //                   ? Image.asset("assets/images/sy.jpg")
                      //                   : Image.asset("assets/images/en.jpg"),
                      //             ),
                      //             Text(item),
                      //           ],
                      //         ),
                      //         value: item.toString(),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),

                      SizedBox(width: 15),
                      IconButton(
                          icon: new Stack(
                            children: <Widget>[
                              new Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.grey,
                                size: 45,
                              ),
                              new Positioned(
                                right: 0,
                                child: new Container(
                                  padding: EdgeInsets.all(1),
                                  decoration: new BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  constraints: BoxConstraints(
                                    minWidth: 12,
                                    minHeight: 12,
                                  ),
                                  child: new Text(
                                    '9',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // title: Text('Notifications'),
                          // // Icon(
                          //   Icons.notifications,
                          //   color: Colors.white,
                          //   size: 40,
                          // ),
                          onPressed: () {
                            // Get.toNamed('/Payment');
                          }),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: Get.height,
                  child: RubberBand(
                    key: _key,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 1.0,
                        ),
                        shrinkWrap: true,
                        children: [
                          menuitem('Saving', 'SavingIcon', 1),
                          menuitem('Loan', 'loan', 0),
                          menuitem('Digital Account', 'digital account', 2),
                          menuitem('Purchase Loan', 'purchaseLoan', 3),
                          //  menuitem('Products', 'products', 4),
                          // menuitem('Complaint', 'complaint', 4),
                          menuitem('Payment', 'payment', 4),
                          menuitem('QR Code', 'qr-code', 5),

                          // menuitem('Message', 'message', 4),
                        ],
                      ),
                    )),
                  ),
                ),
              ),
            ],
          ),
          // ),
        ),
        floatingActionButton: buildFabCircularMenu(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        // ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  buildFabCircularMenu(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: FabCircularMenu(
        // alignment: Global.lan == 'Arabic'
        //     ? Alignment.bottomLeft
        //     : Alignment.bottomRight,

        fabCloseColor: Colors.grey,
        fabOpenColor: Theme.of(context).accentColor,
        fabSize: 40,
        ringDiameter: 200, //  MediaQuery.of(context).size.width * 1.25,
        ringWidth: 60, //MediaQuery.of(context).size.width * 0.3,
        ringColor: Theme.of(context).primaryColor,
        // fabMargin: EdgeInsets.all(10),
        // fabMargin: EdgeInsets.only(right: 30, bottom: 20),
        children: <Widget>[
          menuitem('loan application', 'loanreq', 0, icon_size: 40),
          SizedBox(),
          menuitem('open account', 'open', 1, icon_size: 30),
          SizedBox(
              //  width: 1,
              ),
        ],
      ),
    );
  }

  menuitem(String text, String icon, int index, {double icon_size = 90}) {
    return InkWell(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Image.asset('assets/images/icons/${icon}.png'),
              // tooltip: 'gggg',
              iconSize: icon_size,
            ),
            Text(
              text.tr,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ],
        ),
        onTap: () {
          context.read<provideri>().index_val(index);
          index == 4
              ? Get.toNamed('/Payment')
              : index == 5
                  ? Get.toNamed('/QRcode')
                  // ignore: unnecessary_statements
                  : Get.toNamed('/Operations');
          //  index == 5 ? Get.toNamed('/Payment') : Get.toNamed('/Operations');
          // Get.toNamed('/Operations');
          //Provider.of<provideri>(context, listen: false).index_val(index);
          setState(() {
            Global.indexOp = index;
          });
          print('12${Global.indexOp}');
        });
  }
}
