import 'dart:convert';

GroupLoanModel groupLoanModelFromJson(String str) =>
    GroupLoanModel.fromJson(json.decode(str));

String groupLoanModelToJson(GroupLoanModel data) => json.encode(data.toJson());

class GroupLoanModel {
  GroupLoanModel({
    this.loanInfo,
    this.projectInfo,
    this.customerId,
  });

  LoanInfo loanInfo; // = new LoanInfo();
  ProjectInfo projectInfo; // = new ProjectInfo();
  String customerId;

  factory GroupLoanModel.fromJson(Map<String, dynamic> json) => GroupLoanModel(
        loanInfo: json["loanInfo"] == null
            ? null
            : LoanInfo.fromJson(json["loanInfo"]),
        projectInfo: json["projectInfo"] == null
            ? null
            : ProjectInfo.fromJson(json["projectInfo"]),
        customerId: json["customerId"] == null ? null : json["customerId"],
      );

  Map<String, dynamic> toJson() => {
        "loanInfo": loanInfo == null ? null : loanInfo.toJson(),
        "projectInfo": projectInfo == null ? null : projectInfo.toJson(),
        "customerId": customerId == null ? null : customerId,
      };
}

class LoanInfo {
  LoanInfo({
    this.amount,
    this.possiblePaymentAmount,
    this.installmentsCount,
    this.loanReason,
    this.institutionIdentificationWayId,
  });

  double amount;
  String possiblePaymentAmount;
  String installmentsCount;
  String loanReason;
  int institutionIdentificationWayId;

  factory LoanInfo.fromJson(Map<String, dynamic> json) => LoanInfo(
        amount: json["amount"] == null ? null : json["amount"],
        possiblePaymentAmount: json["possiblePaymentAmount"] == null
            ? null
            : json["possiblePaymentAmount"],
        installmentsCount: json["installmentsCount"] == null
            ? null
            : json["installmentsCount"],
        loanReason: json["loanReason"] == null ? null : json["loanReason"],
        institutionIdentificationWayId:
            json["institutionIdentificationWayId"] == null
                ? null
                : json["institutionIdentificationWayId"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount == null ? null : amount,
        "possiblePaymentAmount":
            possiblePaymentAmount == null ? null : possiblePaymentAmount,
        "installmentsCount":
            installmentsCount == null ? null : installmentsCount,
        "loanReason": loanReason == null ? null : loanReason,
        "institutionIdentificationWayId": institutionIdentificationWayId == null
            ? null
            : institutionIdentificationWayId,
      };
}

class ProjectInfo {
  ProjectInfo({
    this.projectName,
    this.projectOwner,
    this.projectAddress,
    this.phone,
    this.propertyOwner,
    this.experienceYears,
    this.projectStateId,
    this.projectResidentRent,
    this.contractStartDate,
    this.contractEndDate,
    this.monthlySales,
    this.permanentWorkers,
    this.temporalWorkers,
    this.fule,
    this.maintenance,
    this.workersSalaries,
    this.goodsEstimatedValue,
    this.equipmentEstimatedValue,
    this.customersDeptBalance,
    this.suppliersDebtBalance,
  });

  String projectName;
  String projectOwner;
  String projectAddress;
  String phone;
  String propertyOwner;
  String experienceYears;
  int projectStateId;
  String projectResidentRent;
  String contractStartDate;
  String contractEndDate;
  String monthlySales;
  String permanentWorkers;
  String temporalWorkers;
  String fule;
  String maintenance;
  String workersSalaries;
  String goodsEstimatedValue;
  String equipmentEstimatedValue;
  String customersDeptBalance;
  String suppliersDebtBalance;

  factory ProjectInfo.fromJson(Map<String, dynamic> json) => ProjectInfo(
        projectName: json["projectName"] == null ? null : json["projectName"],
        projectOwner:
            json["projectOwner"] == null ? null : json["projectOwner"],
        projectAddress:
            json["projectAddress"] == null ? null : json["projectAddress"],
        phone: json["phone"] == null ? null : json["phone"],
        propertyOwner:
            json["propertyOwner"] == null ? null : json["propertyOwner"],
        experienceYears:
            json["experienceYears"] == null ? null : json["experienceYears"],
        projectStateId:
            json["projectStateId"] == null ? null : json["projectStateId"],
        projectResidentRent: json["projectResidentRent"] == null
            ? null
            : json["projectResidentRent"],
        contractStartDate: json["contractStartDate"] == null
            ? null
            : json[
                "contractStartDate"], // DateTime.parse(json["contractStartDate"]),
        contractEndDate: json["contractEndDate"] == null
            ? null
            : json[
                "contractEndDate"], //DateTime.parse(json["contractEndDate"]),
        monthlySales:
            json["monthlySales"] == null ? null : json["monthlySales"],
        permanentWorkers:
            json["permanentWorkers"] == null ? null : json["permanentWorkers"],
        temporalWorkers:
            json["temporalWorkers"] == null ? null : json["temporalWorkers"],
        fule: json["fule"] == null ? null : json["fule"],
        maintenance: json["maintenance"] == null ? null : json["maintenance"],
        workersSalaries:
            json["workersSalaries"] == null ? null : json["workersSalaries"],
        goodsEstimatedValue: json["goodsEstimatedValue"] == null
            ? null
            : json["goodsEstimatedValue"],
        equipmentEstimatedValue: json["equipmentEstimatedValue"] == null
            ? null
            : json["equipmentEstimatedValue"],
        customersDeptBalance: json["customersDeptBalance"] == null
            ? null
            : json["customersDeptBalance"],
        suppliersDebtBalance: json["suppliersDebtBalance"] == null
            ? null
            : json["suppliersDebtBalance"],
      );

  Map<String, dynamic> toJson() => {
        "projectName": projectName == null ? null : projectName,
        "projectOwner": projectOwner == null ? null : projectOwner,
        "projectAddress": projectAddress == null ? null : projectAddress,
        "phone": phone == null ? null : phone,
        "propertyOwner": propertyOwner == null ? null : propertyOwner,
        "experienceYears": experienceYears == null ? null : experienceYears,
        "projectStateId": projectStateId == null ? null : projectStateId,
        "projectResidentRent":
            projectResidentRent == null ? null : projectResidentRent,
        "contractStartDate": contractStartDate == null
            ? null
            : contractStartDate, //contractStartDate.toIso8601String(),
        "contractEndDate": contractEndDate == null
            ? null
            : contractEndDate, //contractEndDate.toIso8601String(),
        "monthlySales": monthlySales == null ? null : monthlySales,
        "permanentWorkers": permanentWorkers == null ? null : permanentWorkers,
        "temporalWorkers": temporalWorkers == null ? null : temporalWorkers,
        "fule": fule == null ? null : fule,
        "maintenance": maintenance == null ? null : maintenance,
        "workersSalaries": workersSalaries == null ? null : workersSalaries,
        "goodsEstimatedValue":
            goodsEstimatedValue == null ? null : goodsEstimatedValue,
        "equipmentEstimatedValue":
            equipmentEstimatedValue == null ? null : equipmentEstimatedValue,
        "customersDeptBalance":
            customersDeptBalance == null ? null : customersDeptBalance,
        "suppliersDebtBalance":
            suppliersDebtBalance == null ? null : suppliersDebtBalance,
      };
}
