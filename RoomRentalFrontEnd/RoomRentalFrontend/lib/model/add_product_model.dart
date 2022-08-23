import 'dart:convert';

AddProduct addProductFromJson(String str) =>
    AddProduct.fromJson(json.decode(str));

String addProductToJson(AddProduct data) => json.encode(data.toJson());

class AddProduct {
  AddProduct({
    this.user,
    this.name,
    this.image,
    this.brand,
    this.category,
    this.description,
    this.rating,
    this.numReviews,
    this.price,
    this.availableVehicle,
    this.id,
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? user;
  String? name;
  String? image;
  String? brand;
  String? category;
  String? description;
  int? rating;
  int? numReviews;
  int? price;
  int? availableVehicle;
  String? id;
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory AddProduct.fromJson(Map<String, dynamic> json) => AddProduct(
        user: json["user"],
        name: json["name"],
        image: json["image"],
        brand: json["brand"],
        category: json["category"],
        description: json["description"],
        rating: json["rating"],
        numReviews: json["numReviews"],
        price: json["price"],
        availableVehicle: json["availableVehicle"],
        id: json["_id"],
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "image": image,
        "brand": brand,
        "category": category,
        "description": description,
        "rating": rating,
        "numReviews": numReviews,
        "price": price,
        "availableVehicle": availableVehicle,
        "_id": id,
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
