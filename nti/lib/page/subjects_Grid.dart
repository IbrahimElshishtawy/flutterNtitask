import 'package:flutter/material.dart';
import 'package:nti/core/subject_class.dart';

class SubjectCardWidget extends StatelessWidget {
  final SubjectCard subject;
  const SubjectCardWidget({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // الوسط عمودياً
          children: [
            Icon(subject.icon, size: 40, color: Colors.blue),
            const SizedBox(height: 8),
            Text(
              subject.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Text(
              subject.teacherName,
              style: const TextStyle(fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            const SizedBox(height: 4),
            Text(
              "${subject.fileCount} ملفات",
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
