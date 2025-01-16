// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  bool? status;
  String? message;
  dynamic errors;
  Data? data;

  ResponseLogin({
    this.status,
    this.message,
    this.errors,
    this.data,
  });

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
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
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  Data({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
