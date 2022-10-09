import 'dart:math';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../EPay/EpayController.dart';
import '../global/globalVars.dart' as Global;
import 'QrController.dart';
import 'QrModel.dart';

var height;
var width;

int loanProcess_id;

String stateLoan;

TextEditingController cancelationReasonController = TextEditingController();

class qrInfo extends StatefulWidget {
  const qrInfo({Key key}) : super(key: key);

  @override
  _qrInfoState createState() => _qrInfoState();
}

class _qrInfoState extends State<qrInfo> {
  final QrController _qrController = Get.put(QrController());
  // final EpayController _epayController = Get.put(EpayController());
  final _formKey = GlobalKey<FormState>();
  // QrModel qrModel;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
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
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Divider(
                    color: Theme.of(context).secondaryHeaderColor,
                    thickness: 2,
                  ),
                ),
                Container(
                    height: 580,
                    width: 100,
                    child: SingleChildScrollView(
                        child: Column(
                            // ListView(
                            //     physics: AlwaysScrollableScrollPhysics(),
                            //     shrinkWrap: true,
                            children: [
                          GetBuilder<QrController>(builder: (controller) {
                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {});
                            });
                            while (_qrController.QrInfoList == null) {
                              return Center(
                                  child: SpinKitFadingCircle(
                                color: Theme.of(context).accentColor,
                              ));
                            }

                            return _qrController.QrInfoList.first.key == 'no'
                                ? Text(
                                    'The QR  decryption failed !!!....\n please try to scan the QR again ',
                                    style: new TextStyle(
                                      //color: Theme.of(context).primaryColor,
                                      color: Colors.white,
                                      fontSize: 16,
                                    ))
                                : SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        cardQrInfo(_qrController.QrInfoList),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          'invoice number'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Global.TF(
                                            _qrController.invoice_NumController,
                                            '',
                                            TextInputType.number,
                                            false,
                                            icon: "invoice"),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'invoice'.tr,
                                          style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Global.TF(
                                            _qrController.invoice_valController,
                                            '',
                                            TextInputType.number,
                                            false,
                                            icon: "bill"),
                                        SizedBox(height: 30),
                                        MaterialButton(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  new BorderRadius.circular(
                                                      30.0),
                                            ),
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            splashColor: Colors.white,
                                            height: 50,
                                            minWidth: Get.width / 2,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'pay'.tr,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 26,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ImageIcon(
                                                  AssetImage(
                                                      'assets/images/icons/payment1.png'),
                                                  size: 50,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                            onPressed: () {
                                              bool isLoading;
                                              if (_formKey.currentState
                                                  .validate()) {
                                                if (isLoading = true) {
                                                  showDialog(
                                                      builder: (context) =>
                                                          Center(
                                                              child:
                                                                  SpinKitFadingCircle(
                                                            color: Theme.of(
                                                                    context)
                                                                .accentColor,
                                                          )),
                                                      barrierColor: Colors.white
                                                          .withOpacity(0.5),
                                                      barrierDismissible: false,
                                                      context: context);
                                                }
                                                _qrController.getBalance(1);
                                              }
                                              // Get.dialog(
                                              //     Padding(
                                              //       padding: const EdgeInsets.all(
                                              //           20.0),
                                              //       child: Container(
                                              //         width: 75,
                                              //         height: 100,
                                              //         decoration: BoxDecoration(
                                              //           color: Colors.black
                                              //               .withOpacity(0.7),
                                              //         ),
                                              //         child: Align(
                                              //           alignment: Alignment
                                              //               .bottomCenter,
                                              //           child: Padding(
                                              //             padding:
                                              //                 const EdgeInsets
                                              //                         .only(
                                              //                     bottom: 25,
                                              //                     top: 25),
                                              //             child: Column(
                                              //               children: [
                                              //                 Image.asset(
                                              //                   'assets/images/icons/andone.gif',
                                              //                   width:
                                              //                       Get.width / 2,
                                              //                   height:
                                              //                       Get.height /
                                              //                           2.5,
                                              //                 ),
                                              //                 SizedBox(
                                              //                   height:
                                              //                       Get.height /
                                              //                           12,
                                              //                 ),
                                              //                 Text(
                                              //                   "Payment Done from account ${_qrController.account_number}",
                                              //                   style: TextStyle(
                                              //                       color: Colors
                                              //                           .white,
                                              //                       fontSize: 25,
                                              //                       inherit:
                                              //                           false),
                                              //                 ),
                                              //               ],
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //     barrierColor: Colors.black
                                              //         .withOpacity(0.3),
                                              //     barrierDismissible: false);
                                              //
                                              // Future.delayed(Duration(seconds: 5),
                                              //     () {
                                              //   Get.back();
                                              //   Get.back();
                                              //   Get.back();
                                              // });
                                            })
                                      ],
                                    ),
                                  );
                          }),
                        ])))
              ],
            ),
          ),
        ),
      ),

      // ),
    );
  }

  cardQrInfo(List<QrInfo> list) {
    return Container(
      width: Get.width / 3,
      // height: Get.height / 4,
      child: Card(
        // borderOnForeground: true,
        // color: Colors.white.withOpacity(0.9),
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        //   elevation: 1,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(5),
                width: Get.width,
                // height: Get.height,
                child: Column(
                    children: list
                        .map((item) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: RichText(
                                    textDirection: TextDirection.rtl,
                                    text: new TextSpan(
                                      children: [
                                        new TextSpan(
                                            text: item.key,
                                            style: new TextStyle(
                                              // color: Colors.black38,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 16,
                                              letterSpacing: 2,
                                            )),
                                        TextSpan(
                                            text: ' : ',
                                            style: new TextStyle(
                                              // color: Colors.black38,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontSize: 16,
                                              letterSpacing: 2,
                                            )),
                                        TextSpan(
                                          text: item.value,
                                          style: new TextStyle(
                                            //color: Theme.of(context).primaryColor,
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
                        .toList())),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
