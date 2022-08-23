import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    this.id,
    this.name,
    this.email,
    this.isAdmin,
    this.token,
  });

  String? id;
  String? name;
  String? email;
  bool? isAdmin;
  String? token;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        isAdmin: json["isAdmin"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "isAdmin": isAdmin,
        "token": token,
      };
}
