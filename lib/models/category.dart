import 'package:flutter/material.dart';

class Categoryy {
  const Categoryy({
    required this.id,
    required this.title,
    this.color = Colors.cyan,
  });

  final String id;
  final String title;
  final Color color;
}