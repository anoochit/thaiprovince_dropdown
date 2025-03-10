// To parse this JSON data, do
//
//     final thaiProvinces = thaiProvincesFromJson(jsonString);

import 'dart:convert';

/// Decodes a JSON string into a list of [ThaiProvinces] objects.
///
/// Takes a JSON string as input and returns a list of [ThaiProvinces].
List<ThaiProvinces> thaiProvincesFromJson(String str) =>
    List<ThaiProvinces>.from(
      json.decode(str).map((x) => ThaiProvinces.fromJson(x)),
    );

/// Encodes a list of [ThaiProvinces] objects into a JSON string.
///
/// Takes a list of [ThaiProvinces] as input and returns a JSON string.
String thaiProvincesToJson(List<ThaiProvinces> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Represents a Thai province with its details.
class ThaiProvinces {
  /// The unique identifier of the province.
  final int? id;

  /// The name of the province in Thai.
  final String? nameTh;

  /// The name of the province in English.
  final String? nameEn;

  /// The identifier of the geography this province belongs to.
  final int? geographyId;

  /// The timestamp of when this record was created.
  final String? createdAt;

  /// The timestamp of when this record was last updated.
  final String? updatedAt;

  /// The timestamp of when this record was deleted (if applicable).
  final dynamic deletedAt;

  /// Creates a [ThaiProvinces] instance.
  ThaiProvinces({
    this.id,
    this.nameTh,
    this.nameEn,
    this.geographyId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  /// Creates a [ThaiProvinces] object from a JSON map.
  factory ThaiProvinces.fromJson(Map<String, dynamic> json) => ThaiProvinces(
    id: json["id"],
    nameTh: json["name_th"],
    nameEn: json["name_en"],
    geographyId: json["geography_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  /// Converts this [ThaiProvinces] object to a JSON map.
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
