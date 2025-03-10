// To parse this JSON data, do
//
//     final thaiAmphures = thaiAmphuresFromJson(jsonString);

import 'dart:convert';

/// Decodes a JSON string into a list of [ThaiAmphures] objects.
///
/// Takes a JSON string as input and returns a list of [ThaiAmphures].
List<ThaiAmphures> thaiAmphuresFromJson(String str) => List<ThaiAmphures>.from(
  json.decode(str).map((x) => ThaiAmphures.fromJson(x)),
);

/// Encodes a list of [ThaiAmphures] objects into a JSON string.
///
/// Takes a list of [ThaiAmphures] as input and returns a JSON string.
String thaiAmphuresToJson(List<ThaiAmphures> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

/// Represents a Thai district (Amphure) with its details.
class ThaiAmphures {
  /// The unique identifier of the district.
  final int? id;

  /// The name of the district in Thai.
  final String? nameTh;

  /// The name of the district in English.
  final String? nameEn;

  /// The identifier of the province this district belongs to.
  final int? provinceId;

  /// The timestamp of when this record was created.
  final String? createdAt;

  /// The timestamp of when this record was last updated.
  final String? updatedAt;

  /// The timestamp of when this record was deleted (if applicable).
  final dynamic deletedAt;

  /// Creates a [ThaiAmphures] instance.
  ThaiAmphures({
    this.id,
    this.nameTh,
    this.nameEn,
    this.provinceId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  /// Creates a [ThaiAmphures] object from a JSON map.
  factory ThaiAmphures.fromJson(Map<String, dynamic> json) => ThaiAmphures(
    id: json["id"],
    nameTh: json["name_th"],
    nameEn: json["name_en"],
    provinceId: json["province_id"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  /// Converts this [ThaiAmphures] object to a JSON map.
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
