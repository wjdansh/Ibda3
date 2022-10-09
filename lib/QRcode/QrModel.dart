import 'dart:convert';

List<QrInfo> qrInfoFromJson(String str) =>
    List<QrInfo>.from(json.decode(str).map((x) => QrInfo.fromJson(x)));

String qrInfoToJson(List<QrInfo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QrInfo {
  QrInfo({
    this.key,
    this.value,
    this.participantNodeId,
    this.participantNode,
    this.id,
    this.createdAt,
    this.lastModefiedAt,
    this.createdBy,
    this.lastModifiedBy,
    this.isDeleted,
  });

  String key;
  String value;
  int participantNodeId;
  dynamic participantNode;
  int id;
  DateTime createdAt;
  dynamic lastModefiedAt;
  String createdBy;
  dynamic lastModifiedBy;
  bool isDeleted;

  factory QrInfo.fromJson(Map<String, dynamic> json) => QrInfo(
        key: json["key"] == null ? null : json["key"],
        value: json["value"] == null ? null : json["value"],
        participantNodeId: json["participantNodeId"] == null
            ? null
            : json["participantNodeId"],
        participantNode: json["participantNode"],
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
        "key": key == null ? null : key,
        "value": value == null ? null : value,
        "participantNodeId":
            participantNodeId == null ? null : participantNodeId,
        "participantNode": participantNode,
        "id": id == null ? null : id,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "lastModefiedAt": lastModefiedAt,
        "createdBy": createdBy == null ? null : createdBy,
        "lastModifiedBy": lastModifiedBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}

QrModel qrModelFromJson(String str) => QrModel.fromJson(json.decode(str));

String qrModelToJson(QrModel data) => json.encode(data.toJson());

class QrModel {
  QrModel({
    this.nodeId,
  });

  String nodeId;

  factory QrModel.fromJson(Map<String, dynamic> json) => QrModel(
        nodeId: json["Node Id"] == null ? null : json["Node Id"],
      );

  Map<String, dynamic> toJson() => {
        "Node Id": nodeId == null ? null : nodeId,
      };
}
// class infoModel {
//   infoModel({
//     this.id,
//     this.name,
//   });
//
//   String id;
//   String name;
//
//   factory infoModel.fromJson(Map<String, dynamic> json) => infoModel(
//         id: json["id"] == null ? null : json["id"],
//         name: json["name"] == null ? null : json["name"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id == null ? null : id,
//         "name": name == null ? null : name,
//       };
// }
