// To parse this JSON data, do
//
//     final responseAuthRegis = responseAuthRegisFromJson(jsonString);

import 'dart:convert';

ResponseAuthRegis responseAuthRegisFromJson(String str) =>
    ResponseAuthRegis.fromJson(json.decode(str));

String responseAuthRegisToJson(ResponseAuthRegis data) =>
    json.encode(data.toJson());

class ResponseAuthRegis {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ResponseAuthRegis({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseAuthRegis.fromJson(Map<String, dynamic> json) =>
      ResponseAuthRegis(
        status: json["status"],
        message: json["message"],
        errors: json["errors"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "errors": errors,
        "data": data?.toJson(),
      };
}

class Data {
  String? name;
  String? email;
  String? referralCode;
  String? id;
  DateTime? createdAt;

  Data({
    this.name,
    this.email,
    this.referralCode,
    this.id,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        referralCode: json["referral_code"],
        id: json["id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "referral_code": referralCode,
        "id": id,
        "created_at": createdAt?.toIso8601String(),
      };
}
