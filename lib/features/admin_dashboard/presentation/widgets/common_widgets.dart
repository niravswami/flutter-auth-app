import 'package:flutter/material.dart';

import '../../data/models/permission_model.dart';
import '../../data/models/role_model.dart';

Widget buildChips<T>(List<T> items) {
  final chips = items.map((item) {
    String label = item is RoleModel
        ? (item as RoleModel).name
        : (item as PermissionModel).name;
    return Chip(
      label: Text(label),
    );
  }).toList();

  return Wrap(
    spacing: 8, // Adjust spacing between chips
    children: chips,
  );
}
