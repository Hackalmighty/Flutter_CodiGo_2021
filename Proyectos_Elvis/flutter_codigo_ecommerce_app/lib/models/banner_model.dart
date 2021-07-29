

import 'dart:convert';

BannerModel bannerFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
  BannerModel({
    this.id,
    this.image,
    this.description,
    this.active,
  });

  int id;
  String image;
  String description;
  bool active;

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
    id: json["id"],
    image: json["image"],
    description: json["description"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "description": description,
    "active": active,
  };
}
