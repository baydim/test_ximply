// To parse this JSON data, do
//
//     final responseCategory = responseCategoryFromJson(jsonString);

import 'dart:convert';

ResponseCategory responseCategoryFromJson(String str) =>
    ResponseCategory.fromJson(json.decode(str));

String responseCategoryToJson(ResponseCategory data) =>
    json.encode(data.toJson());

class ResponseCategory {
  bool? status;
  String? message;
  dynamic errors;
  List<Categori>? data;

  ResponseCategory({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseCategory.fromJson(Map<String, dynamic> json) =>
      ResponseCategory(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null
            ? []
            : List<Categori>.from(
                json["data"]!.map((x) => Categori.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Categori {
  String? id;
  String? name;

  Categori({
    this.id,
    this.name,
  });

  factory Categori.fromJson(Map<String, dynamic> json) => Categori(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
