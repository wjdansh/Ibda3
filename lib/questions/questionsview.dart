import 'dart:ui';

import 'package:ibda3/Login/loginController.dart';
import 'package:ibda3/questions/questionController.dart';

import '../utility/langServices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class questionsview extends StatefulWidget {
  @override
  _questionsviewState createState() => _questionsviewState();
}

class _questionsviewState extends State<questionsview> {
  QuestionsController _QuestionsController = Get.put(QuestionsController());
//  final LoginController _loginController = Get.put(LoginController());

  LocalizationService tran = new LocalizationService();
  //String val;
  String valq1;
  String valq2;
  bool login = true;
  final _formKey = GlobalKey<FormState>();
  bool passwordVisibility = true;

  //List _FQ = ['question1', 'question2', 'question3'];
  // List _SQ = ['male', 'female'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Theme.of(context).secondaryHeaderColor,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          flexibleSpace: Center(
            child: Image(
              height: 100,
              width: 150,
              image: AssetImage(Global.lan == 'Arabic'
                  ? 'assets/images/logoAr.png'
                  : 'assets/images/logoEn.png'),
              // fit: BoxFit.scaleDown,
            ),
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/images/icons/question.png',
                    width: Get.width / 2.5,
                    height: Get.width / 2.5,
                  ),
                  SizedBox(height: 15),
                  Text(
                    'Security questions'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  // GetBuilder<QuestionsController>(builder: (controller) {
                  //   return DropdownButtonFormField<dynamic>(
                  //     isExpanded: true,
                  //     value: _QuestionsController.firstQuestion,
                  //     focusColor: Colors.blue,
                  //     iconSize: 40,
                  //     iconEnabledColor: Colors.black,
                  //     decoration: InputDecoration(
                  //       labelText: 'Select Question'.tr,
                  //       border: OutlineInputBorder(),
                  //       enabledBorder: InputBorder.none,
                  //     ),
                  //     elevation: 3,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //     // items: _QuestionsController.QListData.map(
                  //     //     (item) => DropdownMenuItem<dynamic>(
                  //     //           child: Text(
                  //     //             item.questionContent,
                  //     //             style: TextStyle(fontSize: 20),
                  //     //           ),
                  //     //           value: item.questionContent,
                  //     //         )).toList(),
                  //     onChanged: (value) {
                  //       _QuestionsController.updateValue1(value);
                  //     },
                  //   );
                  // }),
                  Text('First question'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    width: Get.width / 1.3,
                    // padding: EdgeInsets.only(left: 1.0, right: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.20),
                    ),
                    child:
                        GetBuilder<QuestionsController>(builder: (controller) {
                      decoration:
                      InputDecoration(
                        labelText: 'First question'.tr,
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        enabledBorder: InputBorder.none,
                      );
                      while (_QuestionsController.quetionlist == null) {
                        return Center(
                            child: SpinKitFadingCircle(
                          color: Theme.of(context).accentColor,
                        ));
                      }
                      return DropdownButton(
                          iconSize: 40,
                          // isDense: true,
                          iconEnabledColor:
                              Theme.of(context).secondaryHeaderColor,
                          elevation: 3,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          items: _QuestionsController.quetionlist
                              .where((element) => (element.question !=
                                  _QuestionsController.secondQuestion))
                              .map((item) {
                            return DropdownMenuItem(
                              child: new Text(
                                item.question,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              value: item.question.toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            _QuestionsController.updateValue1(newVal);
                          },
                          value: _QuestionsController
                              .firstQuestion // complaintController.time,
                          );
                    }),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Global.Custom_TF(
                    _QuestionsController.firstAnswerController,
                    'answer the qustion 1'.tr,
                    TextInputType.text,
                  ),
                  SizedBox(height: 15),
                  Text('Second question'.tr,
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 35,
                    width: Get.width / 1.3,
                    // padding: EdgeInsets.only(left: 1.0, right: 1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: Colors.white,
                          style: BorderStyle.solid,
                          width: 0.20),
                    ),
                    child:
                        GetBuilder<QuestionsController>(builder: (controller) {
                      decoration:
                      InputDecoration(
                        labelText: 'Second question'.tr,
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(),
                        enabledBorder: InputBorder.none,
                      );
                      while (_QuestionsController.quetionlist == null) {
                        return Center(
                            child: SpinKitFadingCircle(
                          color: Theme.of(context).accentColor,
                        ));
                      }
                      return DropdownButton(
                          iconSize: 40,
                          // isDense: true,
                          iconEnabledColor:
                              Theme.of(context).secondaryHeaderColor,
                          iconDisabledColor: Colors.blue,
                          // underline: SizedBox(),

                          //  isExpanded: true,
                          focusColor: Colors.blue,
                          elevation: 3,
                          style: TextStyle(
                            color: Colors.black,
                          ),
                          items: _QuestionsController.quetionlist
                              .where((element) => (element.question !=
                                  _QuestionsController.firstQuestion))
                              .map((item) {
                            return DropdownMenuItem(
                              child: new Text(
                                item.question,
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                              value: item.question.toString(),
                            );
                          }).toList(),
                          onChanged: (newVal) {
                            _QuestionsController.updateValue2(newVal);
                          },
                          value: _QuestionsController
                              .secondQuestion // complaintController.time,
                          );
                    }),
                  ),
                  SizedBox(height: 15),
                  Global.Custom_TF(
                    _QuestionsController.secondAnswerController,
                    'answer the qustion 2'.tr,
                    TextInputType.text,
                  ),
                  SizedBox(height: 35),
                  Global.Custom_Botton(
                    'Submit',
                    function: () => {
                      _QuestionsController.mapQandA(
                          _QuestionsController.firstAnswerController.text,
                          _QuestionsController.firstQuestion),
                      _QuestionsController.mapQandA(
                          _QuestionsController.secondAnswerController.text,
                          _QuestionsController.secondQuestion),
                      // Get.arguments[0] == true
                      //     ?
                      _QuestionsController
                          .apiAddAns() // _loginController.apiRegister()
                      //: print('false')
                    },
                    //'login',
                    formkey: _formKey,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
