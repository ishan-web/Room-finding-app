import 'dart:convert';

SignUp signUpFromJson(String str) => SignUp.fromJson(json.decode(str));

String signUpToJson(SignUp data) => json.encode(data.toJson());

class SignUp {
  SignUp({
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

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
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
