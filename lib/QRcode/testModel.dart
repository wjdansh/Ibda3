import 'dart:convert';

QrtestModel qrtestModelFromJson(String str) =>
    QrtestModel.fromJson(json.decode(str));

String qrtestModelToJson(QrtestModel data) => json.encode(data.toJson());

class QrtestModel {
  QrtestModel({
    this.syndicate,
    this.branch,
    this.box,
    this.uniqueId,
    this.zeroOne,
    this.zeroTwo,
    this.zeroThree,
  });

  String syndicate;
  String branch;
  String box;
  String uniqueId;
  String zeroOne;
  String zeroTwo;
  String zeroThree;

  factory QrtestModel.fromJson(Map<String, dynamic> json) => QrtestModel(
        syndicate: json["Syndicate"] == null ? null : json["Syndicate"],
        branch: json["branch"] == null ? null : json["branch"],
        box: json["box"] == null ? null : json["box"],
        uniqueId: json["UniqueId"] == null ? null : json["UniqueId"],
        zeroOne: json["zero_one"] == null ? null : json["zero_one"],
        zeroTwo: json["zero_two"] == null ? null : json["zero_two"],
        zeroThree: json["zero_three"] == null ? null : json["zero_three"],
      );

  Map<String, dynamic> toJson() => {
        "Syndicate": syndicate == null ? null : syndicate,
        "branch": branch == null ? null : branch,
        "box": box == null ? null : box,
        "UniqueId": uniqueId == null ? null : uniqueId,
        "zero_one": zeroOne == null ? null : zeroOne,
        "zero_two": zeroTwo == null ? null : zeroTwo,
        "zero_three": zeroThree == null ? null : zeroThree,
      };
}
