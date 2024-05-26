import 'package:animation_bmi/constant.dart';
import 'package:animation_bmi/features/home/presentation/views/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

void showAnimationAndInputDialog(
  BuildContext context,
  Artboard? angryRiveArtboard,
  Artboard? continueRiveArtboard, {
  required String? gender,
  required int? age,
  required int? weight,
}) {
  final TextEditingController textFieldController = TextEditingController();

  int? height;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kPrimaryColor,
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                textAlign: TextAlign.center,
                'Forget Your Height!',
                style: TextStyle(
                  color: kSail,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 3,
                //width: 100,
                child: angryRiveArtboard == null
                    ? const SizedBox.shrink()
                    : Rive(
                        artboard: angryRiveArtboard,
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 45,
                width: 120,
                child: TextField(
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kSail,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  inputFormatters: [LengthLimitingTextInputFormatter(3)],
                  cursorColor: kSail,
                  controller: textFieldController,
                  decoration: InputDecoration(
                    //hintText: "Enter Height",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kSail),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: kSail),
                    ),
                    label: const Text(
                      'Your Height!',
                      style: TextStyle(
                        color: kSail,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    height = int.parse(value);
                  },
                ),
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultView(
                        userAge: age,
                        userWeight: weight,
                        userHeight: height,
                        userGender: gender,
                        userBMI: bmiCalculator(
                          weight: weight,
                          height: height,
                        ),
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                  //width: 100,
                  child: continueRiveArtboard == null
                      ? const SizedBox.shrink()
                      : Rive(
                          artboard: continueRiveArtboard,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

double bmiCalculator({required int? weight, required int? height}) {
  double heightInM = height! / 100;
  double result = weight! / (heightInM * heightInM);
  return double.parse(result.toStringAsFixed(3));
}
