import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class BMIResultContainer extends StatelessWidget {
  const BMIResultContainer({
    super.key,
    required this.userBMI,
  });

  final double? userBMI;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kSail.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'BMI Result',
            style: TextStyle(
              color: kTanHide,
              fontSize: 42,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            '$userBMI',
            style: const TextStyle(
              color: kChardonnay,
              fontSize: 36,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
