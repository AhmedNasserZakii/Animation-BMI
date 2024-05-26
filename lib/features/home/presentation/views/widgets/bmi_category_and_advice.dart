import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import '../../../../../core/functions/bmi_result_calculate.dart';

class BMICategoryAndAdvice extends StatelessWidget {
  const BMICategoryAndAdvice({
    super.key,
    required this.userBMI,
  });

  final double? userBMI;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSail.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            bmiResult(userBMI!),
            style: const TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w600,
              color: kTanHide,
            ),
          ),
          Text(
            bmiAdvice(userBMI!),
            style: const TextStyle(
              color: kChardonnay,
              fontSize: 24,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
