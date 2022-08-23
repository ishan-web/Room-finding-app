import 'dart:convert';

DeleteProduct deleteProductFromJson(String str) =>
    DeleteProduct.fromJson(json.decode(str));

String deleteProductToJson(DeleteProduct data) => json.encode(data.toJson());

class DeleteProduct {
  DeleteProduct({
    this.message,
  });

  String? message;

  factory DeleteProduct.fromJson(Map<String, dynamic> json) => DeleteProduct(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
