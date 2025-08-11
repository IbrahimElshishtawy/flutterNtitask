import 'package:flutter/material.dart';
import 'package:nti/core/subject_class.dart';

class SubjectGrid extends StatelessWidget {
  final List<SubjectCard> subjects;
  const SubjectGrid({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // عمودين بالشاشة
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.75,
      padding: const EdgeInsets.all(16),
      children: subjects.map((s) => _buildCard(context, s)).toList(),
    );
  }

  Widget _buildCard(BuildContext context, SubjectCard s) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: s.onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                s.teacherName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 8),
              Icon(s.icon, size: 48, color: Theme.of(context).primaryColor),
              const SizedBox(height: 8),
              Text(
                s.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text('${s.itemCount} مرفوع'),
            ],
          ),
        ),
      ),
    );
  }
}
