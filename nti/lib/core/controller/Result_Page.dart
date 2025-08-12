import 'package:flutter/material.dart';
import 'package:nti/core/constants/strings.dart';
import 'package:nti/core/controller/Gender_Page.dart';
import 'package:nti/models/bmi_result_model.dart';
import 'package:nti/pages/result_page.dart';

class ResultPage extends StatefulWidget {
  final BMIResultModel result;
  const ResultPage({super.key, required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _getFunnyTip(String status) {
    switch (status) {
      case AppStrings.statusUnderweight:
        return "يا عم الحق نفسك.. خلّي أكلك متوازن، زي لما بتعمل فول وطعمية على الفطار!";
      case AppStrings.statusNormal:
        return "أنت تمام التمام! استمر في العيشة الحلوة دي، وماتنساش تتمشى شوية.";
      case AppStrings.statusOverweight:
        return "يا باشا، حاول تهدي شوية على الكنافة، والرياضة لازم تدخل جدولك.";
      default:
        return "الطبيب ينصحك تبقى ملتزم، بس إحنا معاك في كل خطوة، شد حيلك!";
    }
  }

  Color _getMainColor(String status) {
    switch (status) {
      case AppStrings.statusUnderweight:
        return Colors.lightBlueAccent;
      case AppStrings.statusNormal:
        return Colors.greenAccent.shade400;
      case AppStrings.statusOverweight:
        return Colors.orangeAccent.shade700;
      default:
        return Colors.redAccent.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    final mainColor = _getMainColor(widget.result.status);
    final funnyTip = _getFunnyTip(widget.result.status);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: ResultView(
        bmiValue: widget.result.bmiValue,
        status: widget.result.status,
        mainColor: mainColor,
        funnyTip: funnyTip,
        onRecalculatePressed: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const GenderPage()),
            (route) => false,
          );
        },
      ),
    );
  }
}
