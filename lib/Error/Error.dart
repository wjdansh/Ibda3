import 'dart:convert';

ErrorRe ErrorReFromJson(String str) => ErrorRe.fromJson(json.decode(str));

String ErrorReToJson(ErrorRe data) => json.encode(data.toJson());

class ErrorRe {
  ErrorRe({
    this.result,
    this.hasErrors,
    this.validationErrors,
  });

  dynamic result;
  bool hasErrors;
  List<ValidationError> validationErrors;

  factory ErrorRe.fromJson(Map<String, dynamic> json) => ErrorRe(
        result: json["result"] == null ? null : json["result"],
        hasErrors: json["hasErrors"] == null ? null : json["hasErrors"],
        validationErrors: json["validationErrors"] == null
            ? null
            : List<ValidationError>.from(json["validationErrors"]
                .map((x) => ValidationError.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result,
        "hasErrors": hasErrors == null ? null : hasErrors,
        "validationErrors": validationErrors == null
            ? null
            : List<dynamic>.from(validationErrors.map((x) => x.toJson())),
      };
}

class ValidationError {
  ValidationError({
    this.field,
    this.errors,
  });

  String field;
  List<String> errors;

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      ValidationError(
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

// To parse this JSON data, do
//

ErrorR ErrorRFromJson(String str) => ErrorR.fromJson(json.decode(str));

String ErrorRToJson(ErrorR data) => json.encode(data.toJson());

class ErrorR {
  ErrorR({
    this.result,
    this.id,
    this.exception,
    this.status,
    this.isCanceled,
    this.isCompleted,
    this.isCompletedSuccessfully,
    this.creationOptions,
    this.asyncState,
    this.isFaulted,
  });

  ErrorRResult result;
  int id;
  dynamic exception;
  int status;
  bool isCanceled;
  bool isCompleted;
  bool isCompletedSuccessfully;
  int creationOptions;
  dynamic asyncState;
  bool isFaulted;

  factory ErrorR.fromJson(Map<String, dynamic> json) => ErrorR(
        result: json["result"] == null
            ? null
            : ErrorRResult.fromJson(json["result"]),
        id: json["id"] == null ? null : json["id"],
        exception: json["exception"],
        status: json["status"] == null ? null : json["status"],
        isCanceled: json["isCanceled"] == null ? null : json["isCanceled"],
        isCompleted: json["isCompleted"] == null ? null : json["isCompleted"],
        isCompletedSuccessfully: json["isCompletedSuccessfully"] == null
            ? null
            : json["isCompletedSuccessfully"],
        creationOptions:
            json["creationOptions"] == null ? null : json["creationOptions"],
        asyncState: json["asyncState"],
        isFaulted: json["isFaulted"] == null ? null : json["isFaulted"],
      );

  Map<String, dynamic> toJson() => {
        "result": result == null ? null : result.toJson(),
        "id": id == null ? null : id,
        "exception": exception,
        "status": status == null ? null : status,
        "isCanceled": isCanceled == null ? null : isCanceled,
        "isCompleted": isCompleted == null ? null : isCompleted,
        "isCompletedSuccessfully":
            isCompletedSuccessfully == null ? null : isCompletedSuccessfully,
        "creationOptions": creationOptions == null ? null : creationOptions,
        "asyncState": asyncState,
        "isFaulted": isFaulted == null ? null : isFaulted,
      };
}

class ErrorRResult {
  ErrorRResult({
    this.result,
    this.hasErrors,
    this.validationErrors,
  });

  ResultResult result;
  bool hasErrors;
  List<dynamic> validationErrors;

  factory ErrorRResult.fromJson(Map<String, dynamic> json) => ErrorRResult(
        result: json["result"] == null
            ? null
            : ResultResult.fromJson(json["result"]),
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

class ResultResult {
  ResultResult({
    this.id,
    this.currentPassword,
    this.password,
    this.passwordConfirm,
  });

  String id;
  String currentPassword;
  String password;
  String passwordConfirm;

  factory ResultResult.fromJson(Map<String, dynamic> json) => ResultResult(
        id: json["id"] == null ? null : json["id"],
        currentPassword:
            json["currentPassword"] == null ? null : json["currentPassword"],
        password: json["password"] == null ? null : json["password"],
        passwordConfirm:
            json["passwordConfirm"] == null ? null : json["passwordConfirm"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "currentPassword": currentPassword == null ? null : currentPassword,
        "password": password == null ? null : password,
        "passwordConfirm": passwordConfirm == null ? null : passwordConfirm,
      };
}

//
// List<ErrorR> ErrorRFromJson(String str) =>
//     List<ErrorR>.from(json.decode(str).map((x) => ErrorR.fromJson(x)));
//
// String ErrorRToJson(List<ErrorR> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
//
// class ErrorR {
//   ErrorR({
//     this.field,
//     this.errors,
//   });
//
//   String field;
//   List<String> errors;
//
//   factory ErrorR.fromJson(Map<String, dynamic> json) => ErrorR(
//         field: json["field"] == null ? null : json["field"],
//         errors: json["errors"] == null
//             ? null
//             : List<String>.from(json["errors"].map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "field": field == null ? null : field,
//         "errors":
//             errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
//       };
// }
