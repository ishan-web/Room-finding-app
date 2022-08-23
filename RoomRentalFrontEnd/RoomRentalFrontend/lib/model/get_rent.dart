// To parse this JSON data, do
//
//     final getOrders = getOrdersFromJson(jsonString);

import 'dart:convert';

List<GetOrders> getOrdersFromJson(String str) =>
    List<GetOrders>.from(json.decode(str).map((x) => GetOrders.fromJson(x)));

String getOrdersToJson(List<GetOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOrders {
  GetOrders({
    this.rentItem,
    this.pickingAddress,
    this.id,
    // this.user,
    this.rentPrice,
    this.durationFrom,
    this.durationTo,
    this.isRent,
    this.isPickedUp,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.rentAt,
    this.pickedAt,
    this.qty,
  });

  RentItem? rentItem;
  PickingAddress? pickingAddress;
  String? id;
  // dynamic user;
  int? rentPrice;
  DateTime? durationFrom;
  DateTime? durationTo;
  bool? isRent;
  bool? isPickedUp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  DateTime? rentAt;
  DateTime? pickedAt;
  String? qty;

  factory GetOrders.fromJson(Map<String, dynamic> json) => GetOrders(
        rentItem: RentItem?.fromJson(json["rentItem"]),
        pickingAddress: PickingAddress.fromJson(json["pickingAddress"]),
        id: json["_id"],
        // user: User.fromJson(json["user"]),
        rentPrice: json["rentPrice"],
        durationFrom: DateTime.parse(json["durationFrom"]),
        durationTo: DateTime.parse(json["durationTo"]),
        isRent: json["isRent"],
        isPickedUp: json["isPickedUp"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        rentAt: json["rentAt"] == null ? null : DateTime.parse(json["rentAt"]),
        pickedAt:
            json["pickedAt"] == null ? null : DateTime.parse(json["pickedAt"]),
        qty: json["qty"] == null ? null : json["qty"],
      );

  Map<String, dynamic> toJson() => {
        "rentItem": rentItem?.toJson(),
        "pickingAddress": pickingAddress?.toJson(),
        "_id": id,
        // "user": user?.toJson(),
        "rentPrice": rentPrice,
        "durationFrom": durationFrom?.toIso8601String(),
        "durationTo": durationTo?.toIso8601String(),
        "isRent": isRent,
        "isPickedUp": isPickedUp,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "rentAt": rentAt == null ? null : rentAt?.toIso8601String(),
        "pickedAt": pickedAt == null ? null : pickedAt?.toIso8601String(),
        "qty": qty == null ? null : qty,
      };
}

class PickingAddress {
  PickingAddress({
    this.address,
    this.city,
    this.postalCode,
    this.country,
  });

  String? address;
  String? city;
  String? postalCode;
  String? country;

  factory PickingAddress.fromJson(Map<String, dynamic> json) => PickingAddress(
        address: json["address"],
        city: json["city"],
        postalCode: json["postalCode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "city": city,
        "postalCode": postalCode,
        "country": country,
      };
}

class RentItem {
  RentItem({
    this.name,
    this.image,
    this.qty,
    this.price,
    this.product,
  });

  String? name;
  String? image;
  String? qty;
  int? price;
  String? product;

  factory RentItem.fromJson(Map<String, dynamic> json) => RentItem(
        name: json["name"],
        image: json["image"],
        qty: json["qty"],
        price: json["price"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "qty": qty,
        "price": price,
        "product": product,
      };
}

// class User {
//   User({
//     this.id,
//     this.name,
//   });

//   String? id;
//   String? name;

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["_id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//       };
// }
