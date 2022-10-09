import 'dart:convert';

headModel headModelFromJson(String str) => headModel.fromJson(json.decode(str));

String headModelToJson(headModel data) => json.encode(data.toJson());

class headModel {
  headModel({
    this.result,
    this.hasErrors,
    this.validationErrors,
  });

  Result result;
  bool hasErrors;
  List<dynamic> validationErrors;

  factory headModel.fromJson(Map<String, dynamic> json) => headModel(
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
    this.name,
    this.parentId,
    this.stringId,
  });

  int id;
  String name;
  int parentId;
  dynamic stringId;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        parentId: json["parentId"] == null ? null : json["parentId"],
        stringId: json["stringId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "parentId": parentId == null ? null : parentId,
        "stringId": stringId,
      };
}
