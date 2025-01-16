// To parse this JSON data, do
//
//     final responseAuthMe = responseAuthMeFromJson(jsonString);

import 'dart:convert';

ResponseAuthMe responseAuthMeFromJson(String str) =>
    ResponseAuthMe.fromJson(json.decode(str));

String responseAuthMeToJson(ResponseAuthMe data) => json.encode(data.toJson());

class ResponseAuthMe {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ResponseAuthMe({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseAuthMe.fromJson(Map<String, dynamic> json) => ResponseAuthMe(
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
  String? id;
  String? name;
  String? email;
  dynamic mobilePhone;
  dynamic isWhatsapp;
  String? referralCode;
  dynamic emailVerifiedAt;
  dynamic mobilePhoneVerifiedAt;
  dynamic avatarPath;
  DateTime? createdAt;

  Data({
    this.id,
    this.name,
    this.email,
    this.mobilePhone,
    this.isWhatsapp,
    this.referralCode,
    this.emailVerifiedAt,
    this.mobilePhoneVerifiedAt,
    this.avatarPath,
    this.createdAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobilePhone: json["mobile_phone"],
        isWhatsapp: json["is_whatsapp"],
        referralCode: json["referral_code"],
        emailVerifiedAt: json["email_verified_at"],
        mobilePhoneVerifiedAt: json["mobile_phone_verified_at"],
        avatarPath: json["avatar_path"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_phone": mobilePhone,
        "is_whatsapp": isWhatsapp,
        "referral_code": referralCode,
        "email_verified_at": emailVerifiedAt,
        "mobile_phone_verified_at": mobilePhoneVerifiedAt,
        "avatar_path": avatarPath,
        "created_at": createdAt?.toIso8601String(),
      };
}
