import 'package:flutter/material.dart';
import 'package:nti/core/subject_class.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    // قائمة المواد
    List<SubjectCard> subjects = [
      SubjectCard(
        id: 's101',
        title: 'برمجة متقدمة',
        teacherName: 'د. أحمد',
        fileCount: 5,
        icon: Icons.code,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's102',
        title: 'تحليل رياضي',
        teacherName: 'د. سارة',
        fileCount: 8,
        icon: Icons.calculate,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's103',
        title: 'شبكات الحاسب',
        teacherName: 'د. محمد',
        fileCount: 6,
        icon: Icons.router,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's104',
        title: 'ذكاء اصطناعي',
        teacherName: 'د. ليلى',
        fileCount: 7,
        icon: Icons.psychology,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's105',
        title: 'قواعد البيانات',
        teacherName: 'د. كريم',
        fileCount: 9,
        icon: Icons.storage,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's106',
        title: 'أنظمة التشغيل',
        teacherName: 'د. هبة',
        fileCount: 4,
        icon: Icons.computer,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's107',
        title: 'برمجة تطبيقات الموبايل',
        teacherName: 'د. ياسر',
        fileCount: 10,
        icon: Icons.phone_android,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's108',
        title: 'تحليل وتصميم النظم',
        teacherName: 'د. منى',
        fileCount: 6,
        icon: Icons.design_services,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's109',
        title: 'أمن المعلومات',
        teacherName: 'د. حسام',
        fileCount: 5,
        icon: Icons.security,
        onTap: () {},
        itemCount: null,
      ),
      SubjectCard(
        id: 's110',
        title: 'معالجة البيانات',
        teacherName: 'د. سلمى',
        fileCount: 3,
        icon: Icons.data_object,
        onTap: () {},
        itemCount: null,
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('المواد'))),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // عدد الأعمدة
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2, // عرض/ارتفاع العنصر
        ),
        itemCount: subjects.length,
        itemBuilder: (context, index) {
          final subject = subjects[index];
          return GestureDetector(
            onTap: subject.onTap,
            child: Card(
              elevation: 4,
              child: Column(
                mainAxisSize: MainAxisSize.min, // 🔹 يمنع التمدد الزائد
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(subject.icon, size: 40, color: Colors.blue),
                  const SizedBox(height: 6),
                  Flexible(
                    child: Text(
                      subject.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      subject.teacherName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "${subject.fileCount} ملفات",
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
