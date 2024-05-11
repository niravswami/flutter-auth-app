import 'dart:convert';

UserRolesAndPermissionsModel userRolesAndPermissionsModelFromJson(String str) =>
    UserRolesAndPermissionsModel.fromJson(json.decode(str));

String userRolesAndPermissionsModelToJson(UserRolesAndPermissionsModel data) =>
    json.encode(data.toJson());

class UserRolesAndPermissionsModel {
  int id;
  String name;
  String email;
  List<UserRoleModel> roles;

  UserRolesAndPermissionsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
  });

  UserRolesAndPermissionsModel copyWith({
    int? id,
    String? name,
    String? email,
    List<UserRoleModel>? roles,
  }) =>
      UserRolesAndPermissionsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        roles: roles ?? this.roles,
      );

  factory UserRolesAndPermissionsModel.fromJson(Map<String, dynamic> json) =>
      UserRolesAndPermissionsModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        roles: List<UserRoleModel>.from(
            json["roles"].map((x) => UserRoleModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
      };
}

class UserRoleModel {
  int id;
  String name;

  UserRoleModel({
    required this.id,
    required this.name,
  });

  UserRoleModel copyWith({
    int? id,
    String? name,
  }) =>
      UserRoleModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory UserRoleModel.fromJson(Map<String, dynamic> json) => UserRoleModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
