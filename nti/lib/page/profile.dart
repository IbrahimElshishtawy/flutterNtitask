import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900], // خلفية داكنة
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("الملف الشخصي"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            // صورة البروفايل
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                'https://www.facebook.com/share/1AHvhECf5U/', // رابط صورة من الإنترنت
              ),
            ),

            const SizedBox(height: 15),

            // الاسم
            const Text(
              " ibrahim khaled",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              "  flutter developer",
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),

            const SizedBox(height: 20),

            // خط فاصل
            Divider(color: Colors.grey[700], thickness: 1),

            // معلومات
            _buildInfoTile(
              Icons.email,
              "البريد الإلكتروني",
              "himashishtawy@example.com",
            ),
            _buildInfoTile(Icons.phone, "رقم الهاتف", "+20 122 3070 571"),
            _buildInfoTile(Icons.location_on, "الموقع", "mahalla"),
            _buildInfoTile(Icons.school, "الجامعة", " tanta university"),
            _buildInfoTile(Icons.computer, "التخصص", "computer scinece "),
            _buildInfoTile(Icons.cake, "تاريخ الميلاد", "29 october 2003"),

            const SizedBox(height: 20),

            ElevatedButton.icon(
              onPressed: () {
                // إضافة أكشن لتعديل البيانات
              },
              icon: const Icon(Icons.edit, color: Colors.white),
              label: const Text(
                "تعديل البيانات",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // عنصر عرض البيانات
  Widget _buildInfoTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.white70)),
    );
  }
}
