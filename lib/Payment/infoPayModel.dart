import 'dart:convert';

InfoPayModel infoPayModelFromJson(String str) =>
    InfoPayModel.fromJson(json.decode(str));

String infoPayModelToJson(InfoPayModel data) => json.encode(data.toJson());

class InfoPayModel {
  InfoPayModel({
    this.errorCode,
    this.errorDescription,
    this.billingsRec,
  });

  String errorCode;
  String errorDescription;
  List<BillingsRec> billingsRec;

  factory InfoPayModel.fromJson(Map<String, dynamic> json) => InfoPayModel(
        errorCode: json["errorCode"] == null ? null : json["errorCode"],
        errorDescription:
            json["errorDescription"] == null ? null : json["errorDescription"],
        billingsRec: json["billingsRec"] == null
            ? null
            : List<BillingsRec>.from(
                json["billingsRec"].map((x) => BillingsRec.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorCode": errorCode == null ? null : errorCode,
        "errorDescription": errorDescription == null ? null : errorDescription,
        "billingsRec": billingsRec == null
            ? null
            : List<dynamic>.from(billingsRec.map((x) => x.toJson())),
      };
}

class BillingsRec {
  BillingsRec({
    this.selected,
    this.billingNo,
    this.billNo,
    this.billStatus,
    this.dueAmount,
    this.feeAmount,
    this.issueDate,
    this.openDate,
    this.dueDate,
    this.expiryDate,
    this.closeDate,
    this.serviceType,
    this.billType,
    this.allowPart,
    this.lowestToPay,
    this.highestToPay,
    this.allowOver,
    this.highestToOverPay,
    this.message,
  });

  bool selected;
  String billingNo;
  String billNo;
  String billStatus;
  double dueAmount;
  double feeAmount;
  String issueDate;
  DateTime openDate;
  DateTime dueDate;
  DateTime expiryDate;
  DateTime closeDate;
  ServiceType serviceType;
  BillType billType;
  Allow allowPart;
  double lowestToPay;
  double highestToPay;
  Allow allowOver;
  double highestToOverPay;
  String message;

  factory BillingsRec.fromJson(Map<String, dynamic> json) => BillingsRec(
        selected: json["selected"] == null ? null : json["selected"],
        billingNo: json["billingNo"] == null ? null : json["billingNo"],
        billNo: json["billNo"] == null ? null : json["billNo"],
        billStatus: json["billStatus"] == null ? null : json["billStatus"],
        dueAmount:
            json["dueAmount"] == null ? null : json["dueAmount"].toDouble(),
        feeAmount: json["feeAmount"] == null ? null : json["feeAmount"],
        issueDate: json["issueDate"] == null ? null : json["issueDate"],
        openDate:
            json["openDate"] == null ? null : DateTime.parse(json["openDate"]),
        dueDate:
            json["dueDate"] == null ? null : DateTime.parse(json["dueDate"]),
        expiryDate: json["expiryDate"] == null
            ? null
            : DateTime.parse(json["expiryDate"]),
        closeDate: json["closeDate"] == null
            ? null
            : DateTime.parse(json["closeDate"]),
        serviceType: json["serviceType"] == null
            ? null
            : serviceTypeValues.map[json["serviceType"]],
        billType: json["billType"] == null
            ? null
            : billTypeValues.map[json["billType"]],
        allowPart: json["allowPart"] == null
            ? null
            : allowValues.map[json["allowPart"]],
        lowestToPay: json["lowestToPay"] == null ? null : json["lowestToPay"],
        highestToPay:
            json["highestToPay"] == null ? null : json["highestToPay"],
        allowOver: json["allowOver"] == null
            ? null
            : allowValues.map[json["allowOver"]],
        highestToOverPay:
            json["highestToOverPay"] == null ? null : json["highestToOverPay"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toJson() => {
        "selected": selected == null ? null : selected,
        "billingNo": billingNo == null ? null : billingNo,
        "billNo": billNo == null ? null : billNo,
        "billStatus": billStatus == null ? null : billStatus,
        "dueAmount": dueAmount == null ? null : dueAmount,
        "feeAmount": feeAmount == null ? null : feeAmount,
        "issueDate": issueDate == null ? null : issueDate,
        "openDate": openDate == null ? null : openDate.toIso8601String(),
        "dueDate": dueDate == null ? null : dueDate.toIso8601String(),
        "expiryDate": expiryDate == null ? null : expiryDate.toIso8601String(),
        "closeDate": closeDate == null ? null : closeDate.toIso8601String(),
        "serviceType":
            serviceType == null ? null : serviceTypeValues.reverse[serviceType],
        "billType": billType == null ? null : billTypeValues.reverse[billType],
        "allowPart": allowPart == null ? null : allowValues.reverse[allowPart],
        "lowestToPay": lowestToPay == null ? null : lowestToPay,
        "highestToPay": highestToPay == null ? null : highestToPay,
        "allowOver": allowOver == null ? null : allowValues.reverse[allowOver],
        "highestToOverPay": highestToOverPay == null ? null : highestToOverPay,
        "message": message == null ? null : message,
      };
}

enum Allow { N, Y }

final allowValues = EnumValues({"N": Allow.N, "Y": Allow.Y});

enum BillType { RECURRING }

final billTypeValues = EnumValues({"Recurring": BillType.RECURRING});

enum ServiceType { TLC_01_OFF }

final serviceTypeValues = EnumValues({"TLC_01_OFF": ServiceType.TLC_01_OFF});

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

PayModel payModelFromJson(String str) => PayModel.fromJson(json.decode(str));

String payModelToJson(PayModel data) => json.encode(data.toJson());

class PayModel {
  PayModel({
    this.errorcode,
    this.description,
  });

  String errorcode;
  String description;

  factory PayModel.fromJson(Map<String, dynamic> json) => PayModel(
        errorcode: json["errorcode"] == null ? null : json["errorcode"],
        description: json["description"] == null ? null : json["description"],
      );

  Map<String, dynamic> toJson() => {
        "errorcode": errorcode == null ? null : errorcode,
        "description": description == null ? null : description,
      };
}
