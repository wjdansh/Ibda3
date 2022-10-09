import 'package:meta/meta.dart';
import 'dart:convert';

List<BilllerModel> billlerModelFromJson(String str) => List<BilllerModel>.from(
    json.decode(str).map((x) => BilllerModel.fromJson(x)));

String billlerModelToJson(List<BilllerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BilllerModel {
  BilllerModel({
    @required this.billerCode,
    @required this.billerNameAr,
    @required this.billerNameEn,
    @required this.imageName,
    @required this.srvicetype,
    @required this.incPaidBills,
    @required this.paymentType,
    @required this.billType,
    @required this.separtor,
    @required this.id,
    @required this.createdAt,
    @required this.lastModefiedAt,
    @required this.createdBy,
    @required this.lastModifiedBy,
    @required this.isDeleted,
  });

  String billerCode;
  String billerNameAr;
  String billerNameEn;
  String imageName;
  String srvicetype;
  IncPaidBills incPaidBills;
  PaymentType paymentType;
  BillType billType;
  Separtor separtor;
  int id;
  dynamic createdAt;
  dynamic lastModefiedAt;
  dynamic createdBy;
  dynamic lastModifiedBy;
  bool isDeleted;

  factory BilllerModel.fromJson(Map<String, dynamic> json) => BilllerModel(
        billerCode: json["billerCode"] == null ? null : json["billerCode"],
        billerNameAr:
            json["billerName_AR"] == null ? null : json["billerName_AR"],
        billerNameEn:
            json["billerName_EN"] == null ? null : json["billerName_EN"],
        imageName: json["imageName"] == null ? null : json["imageName"],
        srvicetype: json["srvicetype"] == null ? null : json["srvicetype"],
        incPaidBills: json["incPaidBills"] == null
            ? null
            : incPaidBillsValues.map[json["incPaidBills"]],
        paymentType: json["paymentType"] == null
            ? null
            : paymentTypeValues.map[json["paymentType"]],
        billType: json["billType"] == null
            ? null
            : billTypeValues.map[json["billType"]],
        separtor: json["separtor"] == null
            ? null
            : separtorValues.map[json["separtor"]],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"],
        lastModefiedAt: json["lastModefiedAt"],
        createdBy: json["createdBy"],
        lastModifiedBy: json["lastModifiedBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "billerCode": billerCode == null ? null : billerCode,
        "billerName_AR": billerNameAr == null ? null : billerNameAr,
        "billerName_EN": billerNameEn == null ? null : billerNameEn,
        "imageName": imageName == null ? null : imageName,
        "srvicetype": srvicetype == null ? null : srvicetype,
        "incPaidBills": incPaidBills == null
            ? null
            : incPaidBillsValues.reverse[incPaidBills],
        "paymentType":
            paymentType == null ? null : paymentTypeValues.reverse[paymentType],
        "billType": billType == null ? null : billTypeValues.reverse[billType],
        "separtor": separtor == null ? null : separtorValues.reverse[separtor],
        "id": id == null ? null : id,
        "createdAt": createdAt,
        "lastModefiedAt": lastModefiedAt,
        "createdBy": createdBy,
        "lastModifiedBy": lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}

enum BillType { RECURRING, ONE_OFF }

final billTypeValues =
    EnumValues({"OneOff": BillType.ONE_OFF, "Recurring": BillType.RECURRING});

enum IncPaidBills { NO, YES }

final incPaidBillsValues =
    EnumValues({"No": IncPaidBills.NO, "Yes": IncPaidBills.YES});

enum PaymentType { TWO_MONTHS, MONTHLY, ONE_SHOT, YEARLY }

final paymentTypeValues = EnumValues({
  "Monthly": PaymentType.MONTHLY,
  "One-shot": PaymentType.ONE_SHOT,
  "Two_months": PaymentType.TWO_MONTHS,
  "Yearly": PaymentType.YEARLY
});

enum Separtor { NULL, EMPTY }

final separtorValues = EnumValues({"_": Separtor.EMPTY, "null": Separtor.NULL});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
