import 'dart:async';
import 'dart:ui';
import 'package:ibda3/Login/loginController.dart';
import 'package:ibda3/Operations/parts.dart';
import 'package:ibda3/utility/Drawer.dart';
import 'package:provider/provider.dart';
import '../provideri.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class Operations extends StatefulWidget {
  @override
  _OperationsState createState() => _OperationsState();
}

class _OperationsState extends State<Operations> {
//  LocalizationService tran = new LocalizationService();
  final LoginController _loginController = Get.put(LoginController());

  Timer timer;
  int index;
  @override
  void initState() {
    super.initState();

    timer =
        Timer.periodic(Duration(microseconds: 1), (Timer t) => build(context));
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    //   index = Provider.of<provideri>(context, listen: false).index;
    index = context.watch<provideri>().index;
    // int currentPage = 0;
    //
    // GlobalKey bottomNavigationKey = GlobalKey();

    return drawer(
      Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          padding: EdgeInsets.only(top: 10, bottom: 20),
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 20),
                    Image.asset(
                      Global.lan == 'Arabic'
                          ? 'assets/images/logoAr.png'
                          : 'assets/images/logoEn.png',
                      width: 180,
                      height: 90,
                    ),
                    // SizedBox(width: 15),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
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
                          onPressed: () {}),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.width / 12,
                ),
                Container(
                  height: Get.width / 5.5,
                  child: ConvexAppBar(
                      elevation: 0.2,
                      top: -35,
                      height: 95, //65
                      backgroundColor: Colors.white.withOpacity(0.2),
                      color: Theme.of(context).accentColor,
                      style: TabStyle.react,
                      items: [
                        TabItem(
                            icon: ImageIcon(
                              AssetImage('assets/images/icons/loan.png'),
                              color: Theme.of(context).accentColor,
                            ),
                            title: 'Loan'.tr),
                        TabItem(
                            icon: ImageIcon(
                              AssetImage('assets/images/icons/SavingIcon.png'),
                              color: Theme.of(context).accentColor,
                            ),
                            title: 'Saving'.tr),
                        TabItem(
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/digital account.png'),
                              color: Theme.of(context).accentColor,
                            ),
                            title: 'D-Account'.tr),
                        TabItem(
                            icon: ImageIcon(
                              AssetImage(
                                  'assets/images/icons/purchaseLoan.png'),
                              color: Theme.of(context).accentColor,
                            ),
                            title: 'Purchase Loan'.tr),
                        TabItem(
                            icon: ImageIcon(
                              AssetImage('assets/images/icons/products.png'),
                              color: Theme.of(context).accentColor,
                            ),
                            title: 'Products'.tr),
                        // TabItem(
                        //     icon: Image.asset(
                        //         'assets/images/icons/complaint.png'),
                        //     title: 'Complaint'.tr),
                      ],
                      initialActiveIndex: index, //optional, default as 0
                      onTap: (int i) {
                        context.read<provideri>().index_val(i);
                        // Provider.of<provideri>(context, listen: false).index_val(i);
                        setState(() {
                          Global.indexOp = i;
                        });
                        print('click index2=${Global.indexOp}');
                      }),
                ),

                SizedBox(
                  height: Get.width / 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: MediaQuery.of(context).size.width,
                    child:
                        //  mm(Provider.of<provideri>(context, listen: true).index),
                        indexPage(context.watch<provideri>().index),
                    // indexPage(Provider.of<provideri>(context, listen: false)
                    //     .index),
                  ),
                ),
                //        Global.buildFabCircularMenu(context)
                // Container(
                //   // height: MediaQuery.of(context).size.height,
                //   // width: MediaQuery.of(context).size.width,
                //   child: Align(
                //       alignment: Alignment.bottomRight,
                //       child: Global.buildFabCircularMenu(context)),
                // )
              ],
            ),
          ),
          //    ),
          //  ),
        ),
        floatingActionButton: Global.buildFabCircularMenu(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }

  indexPage(index) {
    return indexedPage[index];
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
