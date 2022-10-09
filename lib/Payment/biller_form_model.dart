import 'dart:convert';

BillerForm billerFromJson(String str) => BillerForm.fromJson(json.decode(str));

String billerToJson(BillerForm data) => json.encode(data.toJson());

class BillerForm {
  BillerForm({
    this.id,
    this.billerId,
    this.lableNameAr,
    this.lableNameEn,
    this.type,
    this.order,
    this.inputSelects,
    this.inputTexts,
  });

  int id;
  int billerId;
  String lableNameAr;
  String lableNameEn;
  String type;
  int order;
  List<InputSelect> inputSelects;
  InputTexts inputTexts;

  factory BillerForm.fromJson(Map<String, dynamic> json) => BillerForm(
        id: json["id"] == null ? null : json["id"],
        billerId: json["billerId"] == null ? null : json["billerId"],
        lableNameAr: json["lableName_Ar"] == null ? null : json["lableName_Ar"],
        lableNameEn: json["lableName_En"] == null ? null : json["lableName_En"],
        type: json["type"] == null ? null : json["type"],
        order: json["order"] == null ? null : json["order"],
        inputSelects: json["inputSelects"] == null
            ? null
            : List<InputSelect>.from(
                json["inputSelects"].map((x) => InputSelect.fromJson(x))),
        inputTexts: json["inputTexts"] == null
            ? null
            : InputTexts.fromJson(json["inputTexts"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "billerId": billerId == null ? null : billerId,
        "lableName_Ar": lableNameAr == null ? null : lableNameAr,
        "lableName_En": lableNameEn == null ? null : lableNameEn,
        "type": type == null ? null : type,
        "order": order == null ? null : order,
        "inputSelects": inputSelects == null
            ? null
            : List<dynamic>.from(inputSelects.map((x) => x.toJson())),
        "inputTexts": inputTexts == null ? null : inputTexts.toJson(),
      };

  List<BillerForm> listFromJson(List<dynamic> json) {
    return json == null
        ? <BillerForm>[]
        : json.map((value) => BillerForm.fromJson(value)).toList();
  }
}

class InputSelect {
  InputSelect({
    this.inputFieldId,
    this.nameAr,
    this.nameEn,
    this.value,
  });

  int inputFieldId;
  String nameAr;
  String nameEn;
  String value;

  factory InputSelect.fromJson(Map<String, dynamic> json) => InputSelect(
        inputFieldId:
            json["inputFieldId"] == null ? null : json["inputFieldId"],
        nameAr: json["name_Ar"] == null ? null : json["name_Ar"],
        nameEn: json["name_EN"] == null ? null : json["name_EN"],
        value: json["value"] == null ? null : json["value"],
      );

  Map<String, dynamic> toJson() => {
        "inputFieldId": inputFieldId == null ? null : inputFieldId,
        "name_Ar": nameAr == null ? null : nameAr,
        "name_EN": nameEn == null ? null : nameEn,
        "value": value == null ? null : value,
      };
}

InputTexts inputTextsFromJson(String str) =>
    InputTexts.fromJson(json.decode(str));

String inputTextsToJson(InputTexts data) => json.encode(data.toJson());

class InputTexts {
  InputTexts({
    this.inputFieldId,
    this.max,
    this.min,
  });

  int inputFieldId;
  int max;
  int min;

  factory InputTexts.fromJson(Map<String, dynamic> json) => InputTexts(
        inputFieldId:
            json["inputFieldId"] == null ? null : json["inputFieldId"],
        max: json["max"] == null ? null : json["max"],
        min: json["min"] == null ? null : json["min"],
      );

  Map<String, dynamic> toJson() => {
        "inputFieldId": inputFieldId == null ? null : inputFieldId,
        "max": max == null ? null : max,
        "min": min == null ? null : min,
      };
}
