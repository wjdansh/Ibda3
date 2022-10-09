import 'dart:convert';

CustomerModel CustomerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String CustomerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    this.firstName,
    this.lastName,
    this.fatherName,
    this.motherName,
    this.motherLastName,
    this.emailAddress,
    this.userName,
    this.phoneNumber,
    this.mobileNumber,
    this.villageId,
    this.village,
    this.address,
    this.birthDate,
    this.nationalNumber,
    this.gender,
    this.dependentsNumber,
    this.socialStatusId,
    this.socialStatus,
    this.socialPartnerName,
    this.socilaPartnerNationalNumber,
    this.childrenCount,
    this.educationLevelId,
    this.educationLevel,
    this.militaryStatusId,
    this.militaryStatus,
    this.militaryStatusNotes,
    this.residencyTypeId,
    this.residencyType,
    this.residencyStatusId,
    this.residencyStatus,
    this.rentAmount,
    this.jobTypeId,
    this.jobType,
    this.professionId,
    this.profession,
    this.employeeMonthlyIncome,
    this.monthlyExpenses,
    this.customerInstallments,
    this.customerBankDeals,
    this.loanRequests,
    this.isGuarantor,
    this.guarantorTypeId,
    this.guarantorType,
    this.customerPatchInfoId,
    this.customerPatchInfo,
    this.userId,
    this.authorizedGroupHeadId,
    this.selfCreated,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
  });

  String firstName;
  String lastName;
  String fatherName;
  String motherName;
  String motherLastName;
  String emailAddress;
  dynamic userName;
  String phoneNumber;
  String mobileNumber;
  dynamic villageId;
  EducationLevel village;
  String address;
  DateTime birthDate;
  String nationalNumber;
  String gender;
  dynamic dependentsNumber;
  dynamic socialStatusId;
  EducationLevel socialStatus;
  dynamic socialPartnerName;
  dynamic socilaPartnerNationalNumber;
  dynamic childrenCount;
  dynamic educationLevelId;
  EducationLevel educationLevel;
  dynamic militaryStatusId;
  dynamic militaryStatus;
  dynamic militaryStatusNotes;
  dynamic residencyTypeId;
  EducationLevel residencyType;
  dynamic residencyStatusId;
  EducationLevel residencyStatus;
  dynamic rentAmount;
  dynamic jobTypeId;
  EducationLevel jobType;
  dynamic professionId;
  Profession profession;
  dynamic employeeMonthlyIncome;
  dynamic monthlyExpenses;
  List<dynamic> customerInstallments;
  List<dynamic> customerBankDeals;
  dynamic loanRequests;
  bool isGuarantor;
  dynamic guarantorTypeId;
  dynamic guarantorType;
  dynamic customerPatchInfoId;
  dynamic customerPatchInfo;
  String userId;
  dynamic authorizedGroupHeadId;
  bool selfCreated;
  dynamic id;
  dynamic createdAt;
  DateTime lastModefiedAt;
  dynamic createdBy;
  String lastModifiedBy;
  bool isDeleted;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        fatherName: json["fatherName"] == null ? null : json["fatherName"],
        motherName: json["motherName"] == null ? null : json["motherName"],
        motherLastName:
            json["motherLastName"] == null ? null : json["motherLastName"],
        emailAddress:
            json["emailAddress"] == null ? null : json["emailAddress"],
        userName: json["userName"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        villageId: json["villageId"] == null ? null : json["villageId"],
        village: json["village"] == null
            ? null
            : EducationLevel.fromJson(json["village"]),
        address: json["address"] == null ? null : json["address"],
        birthDate: json["birthDate"] == null
            ? null
            : DateTime.parse(json["birthDate"]),
        nationalNumber:
            json["nationalNumber"] == null ? null : json["nationalNumber"],
        gender: json["gender"] == null ? null : json["gender"],
        dependentsNumber:
            json["dependentsNumber"] == null ? null : json["dependentsNumber"],
        socialStatusId:
            json["socialStatusId"] == null ? null : json["socialStatusId"],
        socialStatus: json["socialStatus"] == null
            ? null
            : EducationLevel.fromJson(json["socialStatus"]),
        socialPartnerName: json["socialPartnerName"],
        socilaPartnerNationalNumber: json["socilaPartnerNationalNumber"],
        childrenCount:
            json["childrenCount"] == null ? null : json["childrenCount"],
        educationLevelId:
            json["educationLevelId"] == null ? null : json["educationLevelId"],
        educationLevel: json["educationLevel"] == null
            ? null
            : EducationLevel.fromJson(json["educationLevel"]),
        militaryStatusId: json["militaryStatusId"],
        militaryStatus: json["militaryStatus"],
        militaryStatusNotes: json["militaryStatusNotes"],
        residencyTypeId:
            json["residencyTypeId"] == null ? null : json["residencyTypeId"],
        residencyType: json["residencyType"] == null
            ? null
            : EducationLevel.fromJson(json["residencyType"]),
        residencyStatusId: json["residencyStatusId"] == null
            ? null
            : json["residencyStatusId"],
        residencyStatus: json["residencyStatus"] == null
            ? null
            : EducationLevel.fromJson(json["residencyStatus"]),
        rentAmount: json["rentAmount"],
        jobTypeId: json["jobTypeId"] == null ? null : json["jobTypeId"],
        jobType: json["jobType"] == null
            ? null
            : EducationLevel.fromJson(json["jobType"]),
        professionId:
            json["professionId"] == null ? null : json["professionId"],
        profession: json["profession"] == null
            ? null
            : Profession.fromJson(json["profession"]),
        employeeMonthlyIncome: json["employeeMonthlyIncome"] == null
            ? null
            : json["employeeMonthlyIncome"],
        monthlyExpenses:
            json["monthlyExpenses"] == null ? null : json["monthlyExpenses"],
        customerInstallments: json["customerInstallments"] == null
            ? null
            : List<dynamic>.from(json["customerInstallments"].map((x) => x)),
        customerBankDeals: json["customerBankDeals"] == null
            ? null
            : List<dynamic>.from(json["customerBankDeals"].map((x) => x)),
        loanRequests: json["loanRequests"],
        isGuarantor: json["isGuarantor"] == null ? null : json["isGuarantor"],
        guarantorTypeId: json["guarantorTypeId"],
        guarantorType: json["guarantorType"],
        customerPatchInfoId: json["customerPatchInfoId"],
        customerPatchInfo: json["customerPatchInfo"],
        userId: json["userId"] == null ? null : json["userId"],
        authorizedGroupHeadId: json["authorizedGroupHeadId"],
        selfCreated: json["selfCreated"] == null ? null : json["selfCreated"],
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"],
        lastModefiedAt: json["lastModefiedAt"] == null
            ? null
            : DateTime.parse(json["lastModefiedAt"]),
        createdBy: json["createdBy"],
        lastModifiedBy:
            json["lastModifiedBy"] == null ? null : json["lastModifiedBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "fatherName": fatherName == null ? null : fatherName,
        "motherName": motherName == null ? null : motherName,
        "motherLastName": motherLastName == null ? null : motherLastName,
        "emailAddress": emailAddress == null ? null : emailAddress,
        "userName": userName,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "villageId": villageId == null ? null : villageId,
        "village": village == null ? null : village.toJson(),
        "address": address == null ? null : address,
        "birthDate": birthDate == null ? null : birthDate.toIso8601String(),
        "nationalNumber": nationalNumber == null ? null : nationalNumber,
        "gender": gender == null ? null : gender,
        "dependentsNumber": dependentsNumber == null ? null : dependentsNumber,
        "socialStatusId": socialStatusId == null ? null : socialStatusId,
        "socialStatus": socialStatus == null ? null : socialStatus.toJson(),
        "socialPartnerName": socialPartnerName,
        "socilaPartnerNationalNumber": socilaPartnerNationalNumber,
        "childrenCount": childrenCount == null ? null : childrenCount,
        "educationLevelId": educationLevelId == null ? null : educationLevelId,
        "educationLevel":
            educationLevel == null ? null : educationLevel.toJson(),
        "militaryStatusId": militaryStatusId,
        "militaryStatus": militaryStatus,
        "militaryStatusNotes": militaryStatusNotes,
        "residencyTypeId": residencyTypeId == null ? null : residencyTypeId,
        "residencyType": residencyType == null ? null : residencyType.toJson(),
        "residencyStatusId":
            residencyStatusId == null ? null : residencyStatusId,
        "residencyStatus":
            residencyStatus == null ? null : residencyStatus.toJson(),
        "rentAmount": rentAmount,
        "jobTypeId": jobTypeId == null ? null : jobTypeId,
        "jobType": jobType == null ? null : jobType.toJson(),
        "professionId": professionId == null ? null : professionId,
        "profession": profession == null ? null : profession.toJson(),
        "employeeMonthlyIncome":
            employeeMonthlyIncome == null ? null : employeeMonthlyIncome,
        "monthlyExpenses": monthlyExpenses == null ? null : monthlyExpenses,
        "customerInstallments": customerInstallments == null
            ? null
            : List<dynamic>.from(customerInstallments.map((x) => x)),
        "customerBankDeals": customerBankDeals == null
            ? null
            : List<dynamic>.from(customerBankDeals.map((x) => x)),
        "loanRequests": loanRequests,
        "isGuarantor": isGuarantor == null ? null : isGuarantor,
        "guarantorTypeId": guarantorTypeId,
        "guarantorType": guarantorType,
        "customerPatchInfoId": customerPatchInfoId,
        "customerPatchInfo": customerPatchInfo,
        "userId": userId == null ? null : userId,
        "authorizedGroupHeadId": authorizedGroupHeadId,
        "selfCreated": selfCreated == null ? null : selfCreated,
        "id": id == null ? null : id,
        "createdAt": createdAt,
        "lastModefiedAt":
            lastModefiedAt == null ? null : lastModefiedAt.toIso8601String(),
        "createdBy": createdBy,
        "lastModifiedBy": lastModifiedBy == null ? null : lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}

class Region {
  Region({
    this.name,
    this.cityId,
    this.city,
    this.villages,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
  });

  String name;
  dynamic cityId;
  EducationLevel city;
  List<dynamic> villages;
  dynamic id;
  DateTime createdAt;
  dynamic lastModefiedAt;
  String createdBy;
  dynamic lastModifiedBy;
  bool isDeleted;

  factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"] == null ? null : json["name"],
        cityId: json["cityId"] == null ? null : json["cityId"],
        city:
            json["city"] == null ? null : EducationLevel.fromJson(json["city"]),
        villages: json["villages"] == null
            ? null
            : List<dynamic>.from(json["villages"].map((x) => x)),
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
        "name": name == null ? null : name,
        "cityId": cityId == null ? null : cityId,
        "city": city == null ? null : city.toJson(),
        "villages": villages == null
            ? null
            : List<dynamic>.from(villages.map((x) => x)),
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "lastModefiedAt": lastModefiedAt,
        "createdBy": createdBy == null ? null : createdBy,
        "lastModifiedBy": lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}

class EducationLevel {
  EducationLevel({
    this.name,
    this.customers,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
    this.professions,
    this.regionId,
    this.region,
    this.regions,
  });

  String name;
  List<dynamic> customers;
  dynamic id;
  DateTime createdAt;
  DateTime lastModefiedAt;
  String createdBy;
  String lastModifiedBy;
  bool isDeleted;
  List<dynamic> professions;
  dynamic regionId;
  Region region;
  List<dynamic> regions;

  factory EducationLevel.fromJson(Map<String, dynamic> json) => EducationLevel(
        name: json["name"] == null ? null : json["name"],
        customers: json["customers"] == null
            ? null
            : List<dynamic>.from(json["customers"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastModefiedAt: json["lastModefiedAt"] == null
            ? null
            : DateTime.parse(json["lastModefiedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        lastModifiedBy:
            json["lastModifiedBy"] == null ? null : json["lastModifiedBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
        professions: json["professions"] == null
            ? null
            : List<dynamic>.from(json["professions"].map((x) => x)),
        regionId: json["regionId"] == null ? null : json["regionId"],
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        regions: json["regions"] == null
            ? null
            : List<dynamic>.from(json["regions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "customers": customers == null
            ? null
            : List<dynamic>.from(customers.map((x) => x)),
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "lastModefiedAt":
            lastModefiedAt == null ? null : lastModefiedAt.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "lastModifiedBy": lastModifiedBy == null ? null : lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
        "professions": professions == null
            ? null
            : List<dynamic>.from(professions.map((x) => x)),
        "regionId": regionId == null ? null : regionId,
        "region": region == null ? null : region.toJson(),
        "regions":
            regions == null ? null : List<dynamic>.from(regions.map((x) => x)),
      };
}

class Profession {
  Profession({
    this.name,
    this.code,
    this.professionSectorId,
    this.professionSector,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
  });

  String name;
  String code;
  dynamic professionSectorId;
  EducationLevel professionSector;
  dynamic id;
  DateTime createdAt;
  DateTime lastModefiedAt;
  String createdBy;
  String lastModifiedBy;
  bool isDeleted;

  factory Profession.fromJson(Map<String, dynamic> json) => Profession(
        name: json["name"] == null ? null : json["name"],
        code: json["code"] == null ? null : json["code"],
        professionSectorId: json["professionSectorId"] == null
            ? null
            : json["professionSectorId"],
        professionSector: json["professionSector"] == null
            ? null
            : EducationLevel.fromJson(json["professionSector"]),
        id: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        lastModefiedAt: json["lastModefiedAt"] == null
            ? null
            : DateTime.parse(json["lastModefiedAt"]),
        createdBy: json["createdBy"] == null ? null : json["createdBy"],
        lastModifiedBy:
            json["lastModifiedBy"] == null ? null : json["lastModifiedBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "code": code == null ? null : code,
        "professionSectorId":
            professionSectorId == null ? null : professionSectorId,
        "professionSector":
            professionSector == null ? null : professionSector.toJson(),
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "lastModefiedAt":
            lastModefiedAt == null ? null : lastModefiedAt.toIso8601String(),
        "createdBy": createdBy == null ? null : createdBy,
        "lastModifiedBy": lastModifiedBy == null ? null : lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}
