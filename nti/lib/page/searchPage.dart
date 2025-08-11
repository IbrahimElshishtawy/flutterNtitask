import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  List<String> _results = [];

  void _onSearch(String query) {
    // بيانات بحث تجريبية
    setState(() {
      if (query.isEmpty) {
        _results = [];
      } else {
        _results = List.generate(
          10,
          (index) => 'نتيجة ${index + 1} عن "$query"',
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // خلفية داكنة
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),

              // شعار جوجل أو نص
              const Text(
                "Google",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // نص أبيض للوضع الداكن
                  fontFamily: 'Arial',
                ),
              ),

              const SizedBox(height: 30),

              // مربع البحث
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  style: const TextStyle(color: Colors.white), // لون النص أبيض
                  controller: _controller,
                  onChanged: _onSearch,
                  decoration: InputDecoration(
                    hintText: "ابحث في جوجل...",
                    hintStyle: const TextStyle(color: Colors.white70),
                    prefixIcon: const Icon(Icons.search, color: Colors.white70),
                    filled: true,
                    fillColor: Colors.grey[900], // خلفية داكنة لحقل البحث
                    contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[700]!),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.grey[700]!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // نتائج البحث
              if (_results.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _results.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.search, color: Colors.white70),
                      title: Text(
                        _results[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        // فتح النتيجة
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
