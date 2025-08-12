import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/result_bar.dart';
import '../models/bmi_result_model.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

import 'gender_page.dart';

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

  // دالة لاختيار تدرج لوني بناءً على حالة الوزن
  LinearGradient _getGradient(Color color) {
    return LinearGradient(
      colors: [
        color.withOpacity(0.7),
        color.withOpacity(0.4),
        Colors.black.withOpacity(0.6),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  // دالة لاختيار لون رئيسي حسب الحالة
  Color _getMainColor() {
    switch (widget.result.status) {
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

  // نصائح باللهجة المصرية مع شوية هزار
  String _getFunnyTip() {
    switch (widget.result.status) {
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

  @override
  Widget build(BuildContext context) {
    Color mainColor = _getMainColor();

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),

      body: Container(
        decoration: BoxDecoration(gradient: _getGradient(mainColor)),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // أيقونة جسم الإنسان مع تدرج لوني
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      gradient: _getGradient(mainColor),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: mainColor.withOpacity(0.6),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Icon(
                      Icons.accessibility_new,
                      size: 90,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "نتيجتك يا زعيم",
                    style: AppStyles.titleStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          color: Colors.black54,
                          offset: Offset(1, 1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),

                  Card(
                    elevation: 15,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    color: Colors.white.withOpacity(0.15),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 28,
                        vertical: 36,
                      ),
                      child: Column(
                        children: [
                          Text(
                            "الـ BMI بتاعك:",
                            style: AppStyles.subtitleStyle.copyWith(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 16),

                          Text(
                            widget.result.bmiValue.toStringAsFixed(1),
                            style: AppStyles.bmiValueStyle.copyWith(
                              color: mainColor,
                              fontSize: 78,
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  color: mainColor.withOpacity(0.7),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),

                          const SizedBox(height: 8),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _statusIcon(widget.result.status, mainColor),
                              const SizedBox(width: 12),
                              Text(
                                widget.result.status,
                                style: AppStyles.subtitleStyle.copyWith(
                                  color: mainColor,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w800,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black54,
                                      offset: const Offset(1, 1),
                                      blurRadius: 3,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 28),

                          ResultBar(
                            currentBMI: widget.result.bmiValue,
                            bmi: widget.result.bmiValue,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 18,
                    ),
                    decoration: BoxDecoration(
                      color: mainColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: mainColor.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Text(
                      _getFunnyTip(),
                      style: AppStyles.tipTextStyle.copyWith(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        shadows: const [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(1, 1),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  const Spacer(),

                  CustomButton(
                    text: "احسب تاني يا نجم",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const GenderPage(),
                        ),
                        (route) => false,
                      );
                    },
                    buttonColor: mainColor,
                    textStyle: AppStyles.buttonTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                      shadows: const [
                        Shadow(
                          blurRadius: 6,
                          color: Colors.black38,
                          offset: Offset(1, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // أيقونة تعبيرية حسب الحالة
  Widget _statusIcon(String status, Color color) {
    IconData iconData;
    switch (status) {
      case AppStrings.statusUnderweight:
        iconData = Icons.sentiment_dissatisfied;
        break;
      case AppStrings.statusNormal:
        iconData = Icons.sentiment_very_satisfied;
        break;
      case AppStrings.statusOverweight:
        iconData = Icons.sentiment_neutral;
        break;
      default:
        iconData = Icons.sentiment_very_dissatisfied;
    }
    return Icon(
      iconData,
      color: color,
      size: 40,
      shadows: [
        Shadow(color: Colors.black45, blurRadius: 5, offset: Offset(1, 1)),
      ],
    );
  }
}
