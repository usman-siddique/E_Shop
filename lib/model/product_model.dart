// ignore_for_file: override_on_non_overriding_member

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    required this.image,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.isFavourite,
    required this.status,
    this.qty,
  });

  String image;
  String id;
  bool isFavourite;
  String name;
  String price;
  String description;
  String status;
  int? qty;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
        isFavourite: false,
        price: json["price"],
        qty: json["qty"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "description": description,
        "isFavourite": isFavourite,
        "price": price,
        "status": status,
        "qty": qty,
      };

  @override
  ProductModel copyWith({
    int? qty,
  }) =>
      ProductModel(
        id: id,
        name: name,
        description: description,
        image: image,
        isFavourite: isFavourite,
        qty: qty ?? this.qty,
        price: price,
        status: status,
      );
}
