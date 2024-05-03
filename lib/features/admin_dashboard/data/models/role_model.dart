// To parse this JSON data, do
//
//     final roleModel = roleModelFromJson(jsonString);

import 'dart:convert';

import 'permission_model.dart';

RoleModel roleModelFromJson(String str) => RoleModel.fromJson(json.decode(str));

String roleModelToJson(RoleModel data) => json.encode(data.toJson());

class RoleModel {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<PermissionModel>? permissions;

  RoleModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.permissions,
  });

  RoleModel copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<PermissionModel>? permissions,
  }) =>
      RoleModel(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        permissions: permissions ?? this.permissions,
      );

  factory RoleModel.fromJson(Map<String, dynamic> json) => RoleModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        permissions: json["permissions"] != null && json["permissions"] is List
            ? List<PermissionModel>.from(
                json["permissions"].map((x) => PermissionModel.fromJson(x)))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "permissions": permissions == null
            ? []
            : List<dynamic>.from(permissions!.map((x) => x.toJson())),
      };
}
