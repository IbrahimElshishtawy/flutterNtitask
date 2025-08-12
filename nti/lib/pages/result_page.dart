import 'package:flutter/material.dart';
import 'package:nti/widget/custom_button.dart';
import 'package:nti/widget/result_bar.dart';
import '../core/constants/strings.dart';
import '../core/constants/styles.dart';

typedef OnRecalculatePressed = void Function();

class ResultView extends StatelessWidget {
  final double bmiValue;
  final String status;
  final Color mainColor;
  final String funnyTip;
  final OnRecalculatePressed onRecalculatePressed;

  const ResultView({
    super.key,
    required this.bmiValue,
    required this.status,
    required this.mainColor,
    required this.funnyTip,
    required this.onRecalculatePressed,
  });

  LinearGradient _getGradient() {
    return LinearGradient(
      colors: [
        mainColor.withOpacity(0.7),
        mainColor.withOpacity(0.4),
        Colors.black.withOpacity(0.6),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  Widget _statusIcon() {
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
      color: mainColor,
      size: 40,
      shadows: const [
        Shadow(color: Colors.black45, blurRadius: 5, offset: Offset(1, 1)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.85),
      body: Container(
        decoration: BoxDecoration(gradient: _getGradient()),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    gradient: _getGradient(),
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
                          bmiValue.toStringAsFixed(1),
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
                            _statusIcon(),
                            const SizedBox(width: 12),
                            Text(
                              status,
                              style: AppStyles.subtitleStyle.copyWith(
                                color: mainColor,
                                fontSize: 28,
                                fontWeight: FontWeight.w800,
                                shadows: const [
                                  Shadow(
                                    color: Colors.black54,
                                    offset: Offset(1, 1),
                                    blurRadius: 3,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        ResultBar(currentBMI: bmiValue, bmi: bmiValue),
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
                    funnyTip,
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
                  onPressed: onRecalculatePressed,
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
    );
  }
}
