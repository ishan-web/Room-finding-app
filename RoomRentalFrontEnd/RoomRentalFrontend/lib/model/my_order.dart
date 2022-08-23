import 'dart:convert';

List<MyOrder> myOrderFromJson(String str) =>
    List<MyOrder>.from(json.decode(str).map((x) => MyOrder.fromJson(x)));

String myOrderToJson(List<MyOrder> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyOrder {
  MyOrder({
    this.rentItem,
    this.pickingAddress,
    this.id,
    this.user,
    this.rentPrice,
    this.durationFrom,
    this.durationTo,
    this.isRent,
    this.isPickedUp,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  RentItem? rentItem;
  PickingAddress? pickingAddress;
  String? id;
  String? user;
  int? rentPrice;
  DateTime? durationFrom;
  DateTime? durationTo;
  bool? isRent;
  bool? isPickedUp;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory MyOrder.fromJson(Map<String, dynamic> json) => MyOrder(
        rentItem: RentItem.fromJson(json["rentItem"]),
        pickingAddress: PickingAddress.fromJson(json["pickingAddress"]),
        id: json["_id"],
        user: json["user"],
        rentPrice: json["rentPrice"],
        durationFrom: DateTime.parse(json["durationFrom"]),
        durationTo: DateTime.parse(json["durationTo"]),
        isRent: json["isRent"],
        isPickedUp: json["isPickedUp"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "rentItem": rentItem?.toJson(),
        "pickingAddress": pickingAddress?.toJson(),
        "_id": id,
        "user": user,
        "rentPrice": rentPrice,
        "durationFrom": durationFrom?.toIso8601String(),
        "durationTo": durationTo?.toIso8601String(),
        "isRent": isRent,
        "isPickedUp": isPickedUp,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
    this.price,
    this.product,
  });

  String? name;
  String? image;
  int? price;
  String? product;

  factory RentItem.fromJson(Map<String, dynamic> json) => RentItem(
        name: json["name"],
        image: json["image"],
        price: json["price"],
        product: json["product"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "price": price,
        "product": product,
      };
}
