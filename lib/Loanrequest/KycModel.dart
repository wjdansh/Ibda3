import 'dart:convert';

KycModel kycModelFromJson(String str) => KycModel.fromJson(json.decode(str));

String kycModelToJson(KycModel data) => json.encode(data.toJson());

class KycModel {
  KycModel({
    this.result,
    this.hasErrors,
    this.validationErrors,
  });

  Result result;
  bool hasErrors;
  List<dynamic> validationErrors;

  factory KycModel.fromJson(Map<String, dynamic> json) => KycModel(
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        hasErrors: json["hasErrors"] == null ? null : json["hasErrors"],
        validationErrors: json["validationErrors"] == null
            ? null
            : List<dynamic>.from(json["validationErrors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result.toJson(),
        "hasErrors": hasErrors == null ? null : hasErrors,
        "validationErrors": validationErrors == null
            ? null
            : List<dynamic>.from(validationErrors.map((x) => x)),
      };
}

class Result {
  Result({
    this.id,
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.motherLastName,
    this.englishFirstName,
    this.englishFatherName,
    this.englishLastName,
    this.employeeMonthlyIncome,
    this.yearlyIncome,
    this.branchId,
    this.phoneNumber,
    this.mobileNumber,
    this.address,
    this.villageId,
    this.village,
    this.birthDate,
    this.nationalNumber,
    this.nationalNumberConfirm,
    this.gender,
    this.socialStatusId,
    this.residencyTypeId,
    this.userName,
    this.cbsClientId,
  });

  int id;
  String firstName;
  String lastName;
  String fatherName;
  String motherName;
  dynamic motherLastName;
  dynamic englishFirstName;
  dynamic englishFatherName;
  dynamic englishLastName;
  dynamic employeeMonthlyIncome;
  dynamic yearlyIncome;
  dynamic branchId;
  String phoneNumber;
  String mobileNumber;
  dynamic address;
  dynamic villageId;
  dynamic village;
  dynamic birthDate;
  dynamic nationalNumber;
  dynamic nationalNumberConfirm;
  dynamic gender;
  dynamic socialStatusId;
  dynamic residencyTypeId;
  dynamic userName;
  dynamic cbsClientId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        fatherName: json["fatherName"] == null ? null : json["fatherName"],
        motherName: json["motherName"] == null ? null : json["motherName"],
        motherLastName: json["motherLastName"],
        englishFirstName: json["englishFirstName"],
        englishFatherName: json["englishFatherName"],
        englishLastName: json["englishLastName"],
        employeeMonthlyIncome: json["employeeMonthlyIncome"],
        yearlyIncome: json["yearlyIncome"],
        branchId: json["branchId"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        address: json["address"],
        villageId: json["villageId"],
        village: json["village"],
        birthDate: json["birthDate"],
        nationalNumber: json["nationalNumber"],
        nationalNumberConfirm: json["nationalNumberConfirm"],
        gender: json["gender"],
        socialStatusId: json["socialStatusId"],
        residencyTypeId: json["residencyTypeId"],
        userName: json["userName"],
        cbsClientId: json["cbsClientId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "fatherName": fatherName == null ? null : fatherName,
        "motherName": motherName == null ? null : motherName,
        "motherLastName": motherLastName,
        "englishFirstName": englishFirstName,
        "englishFatherName": englishFatherName,
        "englishLastName": englishLastName,
        "employeeMonthlyIncome": employeeMonthlyIncome,
        "yearlyIncome": yearlyIncome,
        "branchId": branchId,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "address": address,
        "villageId": villageId,
        "village": village,
        "birthDate": birthDate,
        "nationalNumber": nationalNumber,
        "nationalNumberConfirm": nationalNumberConfirm,
        "gender": gender,
        "socialStatusId": socialStatusId,
        "residencyTypeId": residencyTypeId,
        "userName": userName,
        "cbsClientId": cbsClientId,
      };
}
