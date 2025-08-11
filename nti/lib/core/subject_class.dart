import 'package:flutter/material.dart';

class SubjectCard {
  final String id;
  final String title;
  final String teacherName;
  final int fileCount;
  final IconData icon;
  final VoidCallback onTap;
  final int? itemCount; // خليها optional

  SubjectCard({
    required this.id,
    required this.title,
    required this.teacherName,
    required this.fileCount,
    required this.icon,
    required this.onTap,
    this.itemCount,
  });
}
