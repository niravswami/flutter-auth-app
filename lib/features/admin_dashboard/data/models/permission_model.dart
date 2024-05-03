import 'dart:convert';
import 'role_model.dart';

PermissionModel permissionModelFromJson(String str) =>
    PermissionModel.fromJson(json.decode(str));

String permissionModelToJson(PermissionModel data) =>
    json.encode(data.toJson());

class PermissionModel {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  List<RoleModel>? roles;

  PermissionModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.roles,
  });

  PermissionModel copyWith({
    int? id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<RoleModel>? roles,
  }) =>
      PermissionModel(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        roles: roles ?? this.roles,
      );

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        roles: json["roles"] == null
            ? []
            : List<RoleModel>.from(
                json["roles"]!.map((x) => RoleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "roles": roles == null
            ? []
            : List<dynamic>.from(roles!.map((x) => x.toJson())),
      };
}
