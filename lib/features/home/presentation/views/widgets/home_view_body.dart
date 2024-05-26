import 'package:animation_bmi/constant.dart';
import 'package:animation_bmi/features/home/presentation/views/widgets/age_widget.dart';
import 'package:animation_bmi/features/home/presentation/views/widgets/continue_buttom_animation.dart';
import 'package:animation_bmi/features/home/presentation/views/widgets/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'bmi_app_bar.dart';
import 'gender_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  String? selectedGender;
  int? selectedAge;
  int? selectedWeight;

  void _onGenderSelected(String gender) {
    setState(() {
      selectedGender = gender;
    });
    debugPrint('Selected Gender: $selectedGender');
  }

  void _onAgeSelected(int age) {
    setState(() {
      selectedAge = age;
    });
    debugPrint('selectedAge: $selectedAge');
  }

  void _onWeightSelected(int weight) {
    setState(() {
      selectedWeight = weight;
    });
    debugPrint('selectedWeight: $selectedWeight');
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomAppBar(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              children: [
                const Text(
                  'Make Your Gender Happy',
                  style: TextStyle(
                    color: kSail,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                GenderSection(onGenderSelected: _onGenderSelected),
                const SizedBox(height: 12),
                const Text(
                  'What\'s Your Age',
                  style: TextStyle(
                    color: kSail,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AgeWidget(
                  onAgeSelected: _onAgeSelected,
                ),
                const SizedBox(height: 12),
                const Text(
                  'What\'s Your Weight',
                  style: TextStyle(
                    color: kSail,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                WeightWidget(
                  onWeightSelected: _onWeightSelected,
                ),
                const SizedBox(height: 12),
                ContinueButtomAnimation(
                  age: selectedAge,
                  gender: selectedGender,
                  weight: selectedWeight,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
