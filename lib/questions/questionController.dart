import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ibda3/Forgetpassword/forgetpassController.dart';
import 'package:ibda3/Login/loginController.dart';
import 'package:ibda3/questions/questionModel.dart';
import '../global/globalVars.dart' as Global;
import 'answerModel.dart';

class QuestionsController extends GetxController {
  TextEditingController firstAnswerController;
  TextEditingController secondAnswerController;
  final LoginController _loginController = Get.put(LoginController());
  final forgetpassController _forgetpassController =
      Get.put(forgetpassController());
  String firstQuestion;
  String secondQuestion;
  List<AnsAndQu> answersAndQuestions = [];
  String logToken;
  String Password;
  String firstTime;
  String PIN;
  String pa;
  bool isLoading;
  String url;
  List<quetionModel> quetionmod;
  List<quetionModel> quetionlist;
  @override
  // ignore: must_call_super
  void onInit() async {
    firstAnswerController = TextEditingController();
    secondAnswerController = TextEditingController();
    quetionlist = await apiGetQuestion();
    isLoading = true;
    update();
    super.onInit();

    //Get.arguments[3];
  }

  apiAddAns() async {
    print('api add ans is called');

    try {
      // final http.Response response = await http
      //     .get(Global.url + 'api/Administration/AddUserVerificationAnswer');
      //
      // print(response.statusCode);
      // print(response.body);
      print('1');
      List<DataAns> data1 = [
        DataAns(
          answer: firstAnswerController.text,
          verificationQuestionId: answersAndQuestions[0].id,
        ),
        DataAns(
          verificationQuestionId: answersAndQuestions[1].id,
          answer: secondAnswerController.text,
        )
      ];
      print('2');
      print('1   ${data1}');
      String jsonTags = jsonEncode(data1);
      print('3');
      SetAnswersM AandQ = SetAnswersM(
        // email: _loginController.emailTextController.text,
        userName: _loginController.usernameTextController.text,
        mobileNumber: _loginController.mobileTextController.text,
        userVerificationAnswers: data1,
      );

      SetAnswersrest AandQrest = SetAnswersrest(
        userName: _forgetpassController.userTextController.text,
        password: _forgetpassController.passwordTextController.text,
        userVerificationAnswers: data1,
      );
      print('4');
      dynamic jsonAandQ = jsonEncode(AandQ);
      dynamic jsonAandQrest = jsonEncode(AandQrest);
      print('5');
      print('Json answers and Question ${jsonAandQrest}');
      print('Json answers and Question ${jsonAandQrest}');
      // Map<String, String> header = {
      //   'Content-Type': 'application/json',
      //   'Authorization': '',
      // };

      print('aaa ${Global.register} ');
      Global.register == true
          ? _loginController.apiRegister(jsonAandQ)
          : _forgetpassController.apiforget(jsonAandQrest);
      // url = Global.url + 'Auth/CustomerRegister';
      // final http.Response response = await http.post(
      //     Global.url + 'Auth/CustomerRegister',
      //     headers: header,
      //     body: jsonAandQ);
      //
      // print(response.statusCode);
      // print('body: ${response.body}');
      //
      // if (response.statusCode == 200) {

      //   Get.snackbar('Done..'.tr, " ",
      //       backgroundColor: Colors.white.withOpacity(0.8),
      //       icon: Icon(
      //         Icons.check_circle,
      //         color: Color(0xff149931),
      //       ),
      //       duration: Duration(seconds: 10));
      //   // Get.offAllNamed(
      //   //   '/loginView', //loginView
      //   // );
      // } else {
      //   Get.back();
      //   Get.back();
      //   Get.snackbar("  ", 'Question Updated f'.tr,
      //       backgroundColor: Colors.white.withOpacity(0.8),
      //       icon: Icon(
      //         Icons.check_circle,
      //         color: Color(0xff149931),
      //       ));
      // }
      //loginView

      //    arguments: [LogToken, OldPass, firstTime, PIN]);

    } catch (e) {
      Get.back();
      Get.snackbar('Error'.tr, 'Question update failed'.tr,
          duration: Duration(seconds: 10),
          backgroundColor: Color(0xc3cff6fa),
          icon: Icon(
            Icons.error_sharp,
            color: Color(0xff8e0016),
          ));

      print(e);
    }
  }

  void updateValue1(String newVal) {
    firstQuestion = newVal;
    update();
  }

  void updateValue2(String newVal) {
    secondQuestion = newVal;
    update();
  }

  void mapQandA(String answer, String question) {
    for (var item in quetionlist) {
      if (item.question == question) {
        AnsAndQu x = AnsAndQu(id: item.id, answer: answer);
        this.answersAndQuestions.add(x);
        this.answersAndQuestions.forEach(
          (ans) {
            print('222');
            print(ans.answer);
          },
        );
        return;
      }
    }
  }

  Future apiGetQuestion() async {
    print('api get all Q is called');
    final url = Global.url + 'api/Administration/GetVerificationQuestions';
    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Authorization': '',
    };

    try {
      final http.Response response =
          await http.get(Uri.parse(url), headers: header);

      print(response.statusCode);
      print(response.body);
      quetionmod = quetionModelFromJson(response.body);
      if (response.statusCode == 200) {
        print(quetionmod);
        //isLoading = false;

        return quetionmod;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

class AnsAndQu {
  int id;
  String answer;
  //String ArQ;
  AnsAndQu({this.id, this.answer});
}
