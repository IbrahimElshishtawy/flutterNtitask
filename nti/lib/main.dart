import 'package:flutter/material.dart';
import 'package:nti/page/task_page.dart';

void main() {
  runApp(Nti());
}

class Nti extends StatelessWidget {
  const Nti({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const TaskPage());
  }
}
