// To parse this JSON data, do
//
//     final thaiProvinces = thaiProvincesFromJson(jsonString);

import 'dart:convert';

List<ThaiProvinces> thaiProvincesFromJson(String str) =>
    List<ThaiProvinces>.from(
      json.decode(str).map((x) => ThaiProvinces.fromJson(x)),
    );

String thaiProvincesToJson(List<ThaiProvinces> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThaiProvinces {
  final int? id;
  final String? nameTh;
  final String? nameEn;
  final int? geographyId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  ThaiProvinces({
    this.id,
    this.nameTh,
    this.nameEn,
    this.geographyId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ThaiProvinces.fromJson(Map<String, dynamic> json) => ThaiProvinces(
    id: json["id"],
    nameTh: json["name_th"],
    nameEn: json["name_en"],
    geographyId: json["geography_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_th": nameTh,
    "name_en": nameEn,
    "geography_id": geographyId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
