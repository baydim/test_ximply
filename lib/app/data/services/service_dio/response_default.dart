import 'dart:convert';

String responseDefaultToJson(ResponseDefault data) =>
    json.encode(data.toJson());

ResponseDefault responseDefaultFromJson(String str) =>
    ResponseDefault.fromJson(json.decode(str));

List<Map<String, dynamic>> responseDefaultListToJson(
        List<ResponseDefault> data) =>
    data.map((x) => x.toJson()).toList();

class ResponseDefault {
  bool status = false;
  String? message = "Terjadi Kesalahan";
  dynamic errors;
  dynamic data;

  ResponseDefault({
    this.status = false,
    this.message = "Terjadi Kesalahan",
    this.errors,
    this.data,
  });

  ResponseDefault.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['errors'] = errors;
    data['data'] = this.data;
    return data;
  }
}
