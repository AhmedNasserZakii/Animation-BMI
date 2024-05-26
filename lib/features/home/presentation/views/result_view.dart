import 'package:animation_bmi/constant.dart';

import 'package:flutter/material.dart';

import 'widgets/bmi_category_and_advice.dart';
import 'widgets/bmi_result_container.dart';
import 'widgets/category_data_section.dart';
import 'widgets/custom_elevated_button.dart';
import 'widgets/noonnap_animation.dart';

class ResultView extends StatelessWidget {
  const ResultView({
    super.key,
    required this.userAge,
    required this.userWeight,
    required this.userHeight,
    required this.userGender,
    required this.userBMI,
  });

  final int? userAge;
  final int? userWeight;
  final int? userHeight;
  final String? userGender;
  final double? userBMI;

  @override
  Widget build(BuildContext context) {
    List<String> dataTitle = ['Gender', 'Age', 'Weight', 'Height'];
    List<String> secData = [
      '$userGender',
      '$userAge Y',
      '$userWeight KG',
      '$userHeight cm'
    ];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const NoonnapAnimation(),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: kSail.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                CategoryDataSection(dataTitle: dataTitle, secData: secData),
                BMIResultContainer(userBMI: userBMI),
                BMICategoryAndAdvice(userBMI: userBMI),
              ],
            ),
          ),
          const CustomElevatedButton(),
        ],
      ),
    );
  }
}
