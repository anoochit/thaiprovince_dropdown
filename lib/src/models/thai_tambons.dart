// To parse this JSON data, do
//
//     final thaiTambons = thaiTambonsFromJson(jsonString);

import 'dart:convert';

List<ThaiTambons> thaiTambonsFromJson(String str) => List<ThaiTambons>.from(
  json.decode(str).map((x) => ThaiTambons.fromJson(x)),
);

String thaiTambonsToJson(List<ThaiTambons> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThaiTambons {
  final int? id;
  final int? zipCode;
  final String? nameTh;
  final String? nameEn;
  final int? amphureId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  ThaiTambons({
    this.id,
    this.zipCode,
    this.nameTh,
    this.nameEn,
    this.amphureId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ThaiTambons.fromJson(Map<String, dynamic> json) => ThaiTambons(
    id: json["id"],
    zipCode: json["zip_code"],
    nameTh: json["name_th"],
    nameEn: json["name_en"],
    amphureId: json["amphure_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "zip_code": zipCode,
    "name_th": nameTh,
    "name_en": nameEn,
    "amphure_id": amphureId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
