import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.products,
    this.page,
    this.pages,
  });

  List<ProductElement>? products;
  int? page;
  int? pages;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        products: List<ProductElement>.from(
            json["products"].map((x) => ProductElement.fromJson(x))),
        page: json["page"],
        pages: json["pages"],
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
        "page": page,
        "pages": pages,
      };
}

class ProductElement {
  ProductElement({
    this.id,
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
    this.reviews,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
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
  List<dynamic>? reviews;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory ProductElement.fromJson(Map<String, dynamic> json) => ProductElement(
        id: json["_id"],
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
        reviews: List<dynamic>.from(json["reviews"].map((x) => x)),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
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
        "reviews": List<dynamic>.from(reviews!.map((x) => x)),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}
