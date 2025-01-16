import 'dart:convert';

String responseDefaultToJson(ResponseDefault data) =>
    json.encode(data.toJson());

ResponseDefault responseDefaultFromJson(String str) =>
    ResponseDefault.fromJson(json.decode(str));

List<Map<String, dynamic>> responseDefaultListToJson(
        List<ResponseDefault> data) =>
    data.map((x) => x.toJson()).toList();

class ResponseDefault {
  bool responseResult = false;
  String? message = "Terjadi Kesalahan";
  dynamic data;

  ResponseDefault({
    this.responseResult = false,
    this.message = "Terjadi Kesalahan",
    this.data,
  });

  ResponseDefault.fromJson(Map<String, dynamic> json) {
    responseResult = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = responseResult;
    data['message'] = message;
    data['data'] = this.data;
    return data;
  }
}
