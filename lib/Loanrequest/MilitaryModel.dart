import 'dart:convert';

List<MilitaryModel> MilitaryModelFromJson(String str) =>
    List<MilitaryModel>.from(
        json.decode(str).map((x) => MilitaryModel.fromJson(x)));

String MilitaryModelToJson(List<MilitaryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<LoanOfficerModel> LoanOfficerModelFromJson(String str) =>
    List<LoanOfficerModel>.from(
        json.decode(str).map((x) => LoanOfficerModel.fromJson(x)));

String LoanOfficerModelToJson(List<LoanOfficerModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MilitaryModel {
  MilitaryModel({
    this.id,
    this.name,
  });

  int id;
  String name;

  factory MilitaryModel.fromJson(Map<String, dynamic> json) => MilitaryModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}

class LoanOfficerModel {
  LoanOfficerModel({
    this.id,
    this.name,
    this.parentId,
    this.stringId,
  });

  int id;
  String name;
  int parentId;
  String stringId;

  factory LoanOfficerModel.fromJson(Map<String, dynamic> json) =>
      LoanOfficerModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        stringId: json["stringId"] == null ? null : json["stringId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        'parentId': parentId == null ? null : parentId,
        'stringId': stringId == null ? null : stringId,
      };
  @override
  String toString() {
    return '${name} ${id}';
  }
}
