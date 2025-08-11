import 'package:flutter/material.dart';
import 'package:nti/page/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Example',
      theme: ThemeData.dark(),
      home: const MainPage(),
    );
  }
}
