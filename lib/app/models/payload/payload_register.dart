// To parse this JSON data, do
//
//     final payloadRegister = payloadRegisterFromJson(jsonString);

import 'dart:convert';

PayloadRegister payloadRegisterFromJson(String str) =>
    PayloadRegister.fromJson(json.decode(str));

String payloadRegisterToJson(PayloadRegister data) =>
    json.encode(data.toJson());

class PayloadRegister {
  String? name;
  String? email;
  String? password;
  String? passwordConfirmation;
  bool? isWhatsapp;
  String? referralCode;

  PayloadRegister({
    this.name,
    this.email,
    this.password,
    this.passwordConfirmation,
    this.isWhatsapp,
    this.referralCode,
  });

  factory PayloadRegister.fromJson(Map<String, dynamic> json) =>
      PayloadRegister(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        passwordConfirmation: json["password_confirmation"],
        isWhatsapp: json["is_whatsapp"],
        referralCode: json["referral_code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
        "is_whatsapp": isWhatsapp,
        "referral_code": referralCode,
      };
}
