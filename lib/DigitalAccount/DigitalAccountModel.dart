import 'dart:convert';

DigitalAccountModel digitalAccountModelFromJson(String str) =>
    DigitalAccountModel.fromJson(json.decode(str));

String digitalAccountModelToJson(DigitalAccountModel data) =>
    json.encode(data.toJson());

class DigitalAccountModel {
  DigitalAccountModel({
    this.result,
    this.hasErrors,
    this.validationErrors,
  });

  Result result;
  bool hasErrors;
  List<dynamic> validationErrors;

  factory DigitalAccountModel.fromJson(Map<String, dynamic> json) =>
      DigitalAccountModel(
        result: Result.fromJson(json["result"]),
        hasErrors: json["hasErrors"],
        validationErrors:
            List<dynamic>.from(json["validationErrors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result": result.toJson(),
        "hasErrors": hasErrors,
        "validationErrors": List<dynamic>.from(validationErrors.map((x) => x)),
      };
}

class Result {
  Result({
    this.id,
    this.customerId,
    this.customerName,
    this.accountType,
    this.amount,
    this.customerNationalNumber,
    this.customerMobileNumber,
    this.fillAmount,
    this.date,
    this.confirmed,
    this.active,
  });

  int id;
  int customerId;
  dynamic customerName;
  String accountType;
  dynamic amount;
  String customerNationalNumber;
  String customerMobileNumber;
  dynamic fillAmount;
  DateTime date;
  bool confirmed;
  bool active;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        customerId: json["customerId"],
        customerName: json["customerName"],
        accountType: json["accountType"],
        amount: json["amount"],
        customerNationalNumber: json["customerNationalNumber"],
        customerMobileNumber: json["customerMobileNumber"],
        fillAmount: json["fillAmount"],
        date: DateTime.parse(json["date"]),
        confirmed: json["confirmed"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "customerId": customerId,
        "customerName": customerName,
        "accountType": accountType,
        "amount": amount,
        "customerNationalNumber": customerNationalNumber,
        "customerMobileNumber": customerMobileNumber,
        "fillAmount": fillAmount,
        "date": date.toIso8601String(),
        "confirmed": confirmed,
        "active": active,
      };
}
