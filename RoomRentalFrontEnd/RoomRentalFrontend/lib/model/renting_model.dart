import 'dart:convert';

RequestAttendance requestAttendanceFromJson(String str) =>
    RequestAttendance.fromJson(json.decode(str));

String requestAttendanceToJson(RequestAttendance data) =>
    json.encode(data.toJson());

class RequestAttendance {
  RequestAttendance({
    this.user,
    this.rentItem,
    this.rentPrice,
    this.durationFrom,
    this.durationTo,
    this.pickingAddress,
    this.isRent,
    this.isPickedUp,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? user;
  RentItem? rentItem;
  int? rentPrice;
  DateTime? durationFrom;
  DateTime? durationTo;
  PickingAddress? pickingAddress;
  bool? isRent;
  bool? isPickedUp;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory RequestAttendance.fromJson(Map<String, dynamic> json) =>
      RequestAttendance(
        user: json["user"],
        rentItem: RentItem.fromJson(json["rentItem"]),
        rentPrice: json["rentPrice"],
        durationFrom: DateTime.parse(json["durationFrom"]),
        durationTo: DateTime.parse(json["durationTo"]),
        pickingAddress: PickingAddress.fromJson(json["pickingAddress"]),
        isRent: json["isRent"],
        isPickedUp: json["isPickedUp"],
        id: json["_id"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "rentItem": rentItem?.toJson(),
        "rentPrice": rentPrice,
        "durationFrom": durationFrom?.toIso8601String(),
        "durationTo": durationTo?.toIso8601String(),
        "pickingAddress": pickingAddress?.toJson(),
        "isRent": isRent,
        "isPickedUp": isPickedUp,
        "_id": id,
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
