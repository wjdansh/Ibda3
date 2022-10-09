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

import 'MessageController.dart';

class MessageView extends StatefulWidget {
  @override
  _MessageViewState createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  final MessageController _messageController = Get.put(MessageController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: Image.asset(
                    Global.lan == 'Arabic'
                        ? 'assets/images/logoAr.png'
                        : 'assets/images/logoEn.png',
                    width: 180,
                    height: 90,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 10,
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
                      Container(
                        height: Get.size.height / 4,
                        // height: 200,
                        width: Get.size.width / 1.1,
                        color: Colors.black38,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Tab(
                                  icon: Image.asset(
                                      'assets/images/icons/user2.png')),
                              Text("   Welcome in Ibdaa bank".tr,
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: Get.height / 12,
                      ),
                      // Expanded(
                      //   flex: 1,
                      //   child: Container(
                      //     width: Get.width / 1.3,
                      //     child:
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            child: IconButton(
                              icon: Image.asset(
                                  'assets/images/icons/sendmessageicon.png'),
                              onPressed: () {
                                //if (_formKey.currentState.validate()) {
                                showDialog(
                                    builder: (context) => Center(
                                            child: SpinKitFadingCircle(
                                          color: Theme.of(context).accentColor,
                                        )),
                                    barrierColor: Colors.white.withOpacity(0.5),
                                    context: context);
                                _messageController.apiMessage();
                                // }
                              },
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Container(
                            //  height: 30,
                            width: Get.width / 1.7,
                            child: Global.Custom_TF(
                                _messageController.messageTextController,
                                'Message',
                                TextInputType.multiline),
                          ),
                        ],
                      ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 80,
                      ),
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

      // ),
    );
  }
}
