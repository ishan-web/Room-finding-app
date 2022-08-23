import 'dart:convert';

ErrorModel errorModelFromJson(String str) =>
    ErrorModel.fromJson(json.decode(str));

String errorModelToJson(ErrorModel data) => json.encode(data.toJson());

class ErrorModel {
  ErrorModel({
    this.message,
    this.stack,
  });

  String? message;
  String? stack;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"],
        stack: json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "stack": stack,
      };
}
