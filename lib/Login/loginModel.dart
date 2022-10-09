import 'dart:convert';

logInUserModel logInUserModelFromJson(String str) =>
    logInUserModel.fromJson(json.decode(str));

String logInUserModelToJson(logInUserModel data) => json.encode(data.toJson());

class logInUserModel {
  logInUserModel({
    this.errors,
    this.successed,
    this.token,
    this.refreshToken,
    this.profilePic,
  });

  List<String> errors;
  bool successed;
  dynamic token;
  dynamic refreshToken;
  dynamic profilePic;

  factory logInUserModel.fromJson(Map<String, dynamic> json) => logInUserModel(
        errors: json["errors"] == null
            ? null
            : List<String>.from(json["errors"].map((x) => x)),
        successed: json["successed"] == null ? null : json["successed"],
        token: json["token"],
        refreshToken: json["refreshToken"],
        profilePic: json["profilePic"],
      );

  Map<String, dynamic> toJson() => {
        "errors":
            errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
        "successed": successed == null ? null : successed,
        "token": token,
        "refreshToken": refreshToken,
        "profilePic": profilePic,
      };
}

class Error {
  Error({
    this.field,
    this.errors,
  });

  String field;
  List<String> errors;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        field: json["field"] == null ? null : json["field"],
        errors: json["errors"] == null
            ? null
            : List<String>.from(json["errors"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "field": field == null ? null : field,
        "errors":
            errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
      };
}
