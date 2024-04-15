import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final DateTime? emailVerifiedAt;
  final List<String>? roles;
  final List<String>? permissions;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.roles,
    required this.permissions,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        emailVerifiedAt,
        roles,
        permissions,
        createdAt,
        updatedAt,
      ];
}
