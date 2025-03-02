// To parse this JSON data, do
//
//     final thaiAmphures = thaiAmphuresFromJson(jsonString);

import 'dart:convert';

List<ThaiAmphures> thaiAmphuresFromJson(String str) => List<ThaiAmphures>.from(
  json.decode(str).map((x) => ThaiAmphures.fromJson(x)),
);

String thaiAmphuresToJson(List<ThaiAmphures> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ThaiAmphures {
  final int? id;
  final String? nameTh;
  final String? nameEn;
  final int? provinceId;
  final String? createdAt;
  final String? updatedAt;
  final dynamic deletedAt;

  ThaiAmphures({
    this.id,
    this.nameTh,
    this.nameEn,
    this.provinceId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory ThaiAmphures.fromJson(Map<String, dynamic> json) => ThaiAmphures(
    id: json["id"],
    nameTh: json["name_th"],
    nameEn: json["name_en"],
    provinceId: json["province_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_th": nameTh,
    "name_en": nameEn,
    "province_id": provinceId,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
