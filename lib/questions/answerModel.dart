import 'dart:convert';
import 'package:get/get.dart';
import '../global/globalVars.dart' as Global;

class SetAnswersM {
  List<DataAns> userVerificationAnswers;
  String email;
  String userName;
  String mobileNumber;
  // String pa = Global.Gv == 't' ? 'list' : 'data';
  // String r = Global.Gv == 't' ? 'UserName' : 'password';

  SetAnswersM(
      {this.userVerificationAnswers,
      this.email,
      this.userName,
      this.mobileNumber});

  SetAnswersM.fromJson(Map<String, dynamic> json) {
    if (json['userVerificationAnswers'] != null) {
      userVerificationAnswers = new List<DataAns>();
      json['userVerificationAnswers'].forEach((v) {
        userVerificationAnswers.add(new DataAns.fromJson(v));
      });
    }
    email = json['email'];
    userName = json['userName'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userVerificationAnswers != null) {
      data['userVerificationAnswers'] =
          this.userVerificationAnswers.map((v) => v.toJson()).toList();
    }
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['mobileNumber'] = this.mobileNumber;
    return data;
  }
}

class SetAnswersrest {
  String userName;
  String password;
  List<DataAns> userVerificationAnswers;
  SetAnswersrest({this.userVerificationAnswers, this.userName, this.password});

  SetAnswersrest.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
    if (json['userVerificationAnswers'] != null) {
      userVerificationAnswers = new List<DataAns>();
      json['userVerificationAnswers'].forEach((v) {
        userVerificationAnswers.add(new DataAns.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['userName'] = this.userName;
    data['password'] = this.password;
    if (this.userVerificationAnswers != null) {
      data['userVerificationAnswers'] =
          this.userVerificationAnswers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataAns {
  String answer;
  int verificationQuestionId;

  DataAns({this.answer, this.verificationQuestionId});

  DataAns.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    verificationQuestionId = json['verificationQuestionId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['answer'] = this.answer;
    data['verificationQuestionId'] = this.verificationQuestionId;

    return data;
  }
}
