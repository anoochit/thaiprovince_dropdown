// To parse this JSON data, do
//
//     final thaiTambons = thaiTambonsFromJson(jsonString);

import 'dart:convert';

/// Decodes a JSON string into a list of [ThaiTambons] objects.
///
/// Takes a JSON string as input and returns a list of [ThaiTambons].
List<ThaiTambons> thaiTambonsFromJson(String str) => List<ThaiTambons>.from(
  json.decode(str).map((x) => ThaiTambons.fromJson(x)),
);

/// Encodes a list of [ThaiTambons] objects into a JSON string.
///
/// Takes a list of [ThaiTambons] as input and returns a JSON string.
String thaiTambonsToJson(List<ThaiTambons> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Represents a Thai subdistrict (Tambon) with its details.
class ThaiTambons {
  /// The unique identifier of the subdistrict.
  final int? id;

  /// The postal code of the subdistrict.
  final int? zipCode;

  /// The name of the subdistrict in Thai.
  final String? nameTh;

  /// The name of the subdistrict in English.
  final String? nameEn;

  /// The identifier of the district (amphure) this subdistrict belongs to.
  final int? amphureId;

  /// The timestamp of when this record was created.
  final String? createdAt;

  /// The timestamp of when this record was last updated.
  final String? updatedAt;

  /// The timestamp of when this record was deleted (if applicable).
  final dynamic deletedAt;

  /// Creates a [ThaiTambons] instance.
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

  /// Creates a [ThaiTambons] object from a JSON map.
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

  /// Converts this [ThaiTambons] object to a JSON map.
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
