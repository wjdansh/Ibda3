// To parse this JSON data, do
//
//     final FormModel = FormModelFromJson(jsonString);

import 'dart:convert';

FormModel FormModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String FormModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  FormModel({
    this.billerId,
    this.formValues,
  });

  int billerId;
  List<FormValue> formValues;

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        billerId: json["billerId"] == null ? null : json["billerId"],
        formValues: json["formValues"] == null
            ? null
            : List<FormValue>.from(
                json["formValues"].map((x) => FormValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "billerId": billerId == null ? null : billerId,
        "formValues": formValues == null
            ? null
            : List<dynamic>.from(formValues.map((x) => x.toJson())),
      };
}

class FormValue {
  FormValue({
    this.order,
    this.inputId,
    this.value,
  });

  int order;
  int inputId;
  String value;

  factory FormValue.fromJson(Map<String, dynamic> json) => FormValue(
        order: json["order"] == null ? null : json["order"],
        inputId: json["inputId"] == null ? null : json["inputId"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "order": order == null ? null : order,
        "inputId": inputId == null ? null : inputId,
        "value": value == null ? null : value,
      };
}
