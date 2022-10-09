import 'package:flutter/material.dart';
import '../global/globalVars.dart' as Global;
import 'package:get/get.dart';

class subProducts extends StatefulWidget {
  @override
  _subProductsState createState() => _subProductsState();
}

class _subProductsState extends State<subProducts> {
  bool pro = true;
  bool proL = true;
  @override
  void initState() {
    pro = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    cardM(String title, String icon) {
      return Card(
        borderOnForeground: true,
        //  color: Colors.black38,
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 1,
        child: InkWell(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                  width: Get.width,
                  height: Get.height / 6.5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/icons/${icon}.png'),
                  )),
              Container(
                  width: Get.width,
                  height: Get.height / 30,
                  color: Colors.transparent,
                  child: Text(
                    title.tr,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                    textAlign: TextAlign.center,
                  )),
            ],
          ),
          onTap: () {
            print('11 ${pro}');
            //     pro = !pro;
            setState(() {
              pro = !pro;
              title == 'Loan Products' ? proL = true : proL = false;
            });
            //   update();
            print('11 ${pro}');
            //   Provider.of<provideri>(Get.context, listen: false).c(pro);
            print('11 ${pro}');
          },
        ),
        // ),
      );
    }

    cardP(String title, String icon,
        {String subtext1, String subtext2, bool sub}) {
      return Container(
        width: Get.width,
        //  height: Get.height / 10,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          color: Colors.black38,
          elevation: 10,
          child: Column(
            //mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              proL
                  ? ExpansionTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Container(
                            color: Color(0xff92CA64),
                            child: Image.asset(
                              'assets/images/icons/${icon}.png',
                              height: Get.height / 20,
                              width: Get.height / 20,
                            )),
                      ),

                      title: Text(title.tr,
                          style: TextStyle(
                              color: Colors.white, fontSize: Get.width / 17)),
                      children: sub
                          ? [
                              SizedBox(
                                height: 20,
                              ),
                              ExpansionTile(
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.all(20),
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text(subtext1.tr,
                                    style: TextStyle(color: Colors.white)),
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('home restoration'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('buy goods'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('Treatments or surgeries'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('Educational Loan'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ExpansionTile(
                                expandedCrossAxisAlignment:
                                    CrossAxisAlignment.start,
                                expandedAlignment: Alignment.topLeft,
                                childrenPadding: EdgeInsets.all(8),
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text(subtext2.tr,
                                    style: TextStyle(color: Colors.white)),
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('farming'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('industrial'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('commercial'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListTile(
                                    leading: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                      child: Container(
                                          color: Color(0xff92CA64),
                                          child: Image.asset(
                                            'assets/images/icons/${icon}.png',
                                            height: Get.height / 20,
                                            width: Get.height / 20,
                                          )),
                                    ),
                                    title: Text('service'.tr,
                                        style: TextStyle(color: Colors.white)),
                                  ),
                                ],
                              ),
                            ]
                          : [
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text('farming'.tr,
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text('industrial'.tr,
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text('commercial'.tr,
                                    style: TextStyle(color: Colors.white)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ListTile(
                                leading: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Container(
                                      color: Color(0xff92CA64),
                                      child: Image.asset(
                                        'assets/images/icons/${icon}.png',
                                        height: Get.height / 20,
                                        width: Get.height / 20,
                                      )),
                                ),
                                title: Text('service'.tr,
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                      //  subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
                    )
                  : ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Container(
                            color: Color(0xff92CA64),
                            child: Image.asset(
                              'assets/images/icons/${icon}.png',
                              height: Get.height / 20,
                              width: Get.height / 20,
                            )),
                      ),

                      title:
                          Text(title.tr, style: TextStyle(color: Colors.white)),
                      //  subtitle: Text('TWICE', style: TextStyle(color: Colors.white)),
                    ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  Global.lan == 'Arabic'
                      ? 'assets/images/logoAr.png'
                      : 'assets/images/logoEn.png',
                  width: 180,
                  height: 90,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Divider(
                  color: Theme.of(context).secondaryHeaderColor,
                  thickness: 0.5,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      pro
                          ? ListView(
                              shrinkWrap: true,
                              children: [
                                cardM('Loan Products', 'loanprod2'),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height /
                                        15),
                                cardM('Savings Products', 'accountprod2'),
                              ],
                            )
                          : proL
                              ? ListView(
                                  shrinkWrap: true,
                                  children: [
                                    cardP('individual loans', 'loanprod',
                                        subtext1:
                                            'Improving the quality of life',
                                        subtext2: 'Project Support',
                                        sub: true),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    cardP('Group loans to support projects',
                                        'loanprod',
                                        sub: false),
                                  ],
                                )
                              : ListView(
                                  shrinkWrap: true,
                                  children: [
                                    cardP('current account', 'accountprod'),
                                    cardP('saving account', 'accountprod'),
                                    cardP('deposit account', 'accountprod'),
                                  ],
                                )
                    ],
                  ),
                ),
              ),

              //   ),
            ],
          ),
        ),
      ),
      // floatingActionButton: Global.buildFabCircularMenu(),
      floatingActionButton: Global.buildFabCircularMenu(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // ),
    );
  }
}
