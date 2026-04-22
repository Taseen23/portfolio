import 'package:flutter/material.dart';

class CapabilityModel {
  final String title;
  final String description;
  final IconData icon;
  final List<String> tags;

  CapabilityModel({
    required this.title,
    required this.description,
    required this.icon,
    this.tags = const [],
  });
}

class StatModel {
  final String value;
  final String label;

  StatModel({
    required this.value,
    required this.label,
  });
}
