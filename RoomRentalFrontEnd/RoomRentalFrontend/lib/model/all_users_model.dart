import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    this.id,
    this.name,
    this.email,
    this.password,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.isAdmin,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  bool? isAdmin;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        isAdmin: json["isAdmin"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "email": email,
        "password": password,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "isAdmin": isAdmin,
      };
}
