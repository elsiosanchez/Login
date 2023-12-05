// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  int code;
  String result;

  Login({
    required this.code,
    required this.result,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        code: json["code"],
        result: json["result"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "result": result,
      };
}
