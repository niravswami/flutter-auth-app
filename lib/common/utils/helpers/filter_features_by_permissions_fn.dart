import 'package:flutter/material.dart';

List<Map<String, dynamic>> filterFeaturesByPermission(
    BuildContext context, List<Map<String, dynamic>> features) {
  return features.where((feature) {
    bool hasPermission = feature['hasPermission'];
    if (hasPermission) {
      if (feature['children'] != null && feature['children'].isNotEmpty) {
        feature['children'] =
            filterFeaturesByPermission(context, feature['children']);
      }
      return true;
    } else {
      if (feature['children'] != null && feature['children'].isNotEmpty) {
        feature['children'] =
            filterFeaturesByPermission(context, feature['children']).toList();
      }
      return false;
    }
  }).toList();
}
