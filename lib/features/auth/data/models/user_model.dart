import '../../../../common/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.roles,
    required super.permissions,
    required super.emailVerifiedAt,
    required super.createdAt,
    required super.updatedAt,
  });

  UserModel copyWith({
    int? id,
    String? name,
    String? email,
    List<String>? roles,
    List<String>? permissions,
    DateTime? emailVerifiedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        roles: roles ?? this.roles,
        permissions: permissions ?? this.permissions,
        emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: (json["roles"] as List<dynamic>?)
                ?.map((role) => role.toString())
                .toList() ??
            [],
        permissions: (json["permissions"] as List<dynamic>?)
                ?.map((permission) => permission.toString())
                .toList() ??
            [],
        emailVerifiedAt: json["email_verified_at"] != null
            ? DateTime.parse(json["email_verified_at"])
            : json["email_verified_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": roles,
        "permissions": permissions,
        "email_verified_at": emailVerifiedAt != null
            ? emailVerifiedAt?.toIso8601String()
            : emailVerifiedAt,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
