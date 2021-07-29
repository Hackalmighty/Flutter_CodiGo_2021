
import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    this.id,
    this.brand,
    this.image,
  });

  int id;
  String brand;
  String image;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json["id"],
    brand: json["brand"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "brand": brand,
    "image": image,
  };
}
