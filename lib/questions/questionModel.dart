// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<quetionModel> quetionModelFromJson(String str) => List<quetionModel>.from(
    json.decode(str).map((x) => quetionModel.fromJson(x)));

String quetionModelToJson(List<quetionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class quetionModel {
  quetionModel({
    this.question,
    this.userVerificationAnswers,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
  });

  String question;
  dynamic userVerificationAnswers;
  int id;
  DateTime createdAt;
  dynamic lastModefiedAt;
  String createdBy;
  dynamic lastModifiedBy;
  bool isDeleted;

  factory quetionModel.fromJson(Map<String, dynamic> json) => quetionModel(
        question: json["question"] == null ? null : json["question"],
        userVerificationAnswers: json["userVerificationAnswers"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastModefiedAt: json["lastModefiedAt"],
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "question": question == null ? null : question,
        "userVerificationAnswers": userVerificationAnswers,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "lastModefiedAt": lastModefiedAt,
        "createdBy": createdBy == null ? null : createdBy,
        "lastModifiedBy": lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}
