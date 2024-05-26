import 'package:animation_bmi/core/utils/assets.dart';
import 'package:animation_bmi/core/utils/continue_animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../../../../core/functions/show_angry_dialog.dart';
import '../../../../../core/utils/mom_animation_enum.dart';

class ContinueButtomAnimation extends StatefulWidget {
  const ContinueButtomAnimation({
    super.key,
    required this.gender,
    required this.age,
    required this.weight,
  });

  final String? gender;
  final int? age;
  final int? weight;
  @override
  State<ContinueButtomAnimation> createState() =>
      _ContinueButtomAnimationState();
}

class _ContinueButtomAnimationState extends State<ContinueButtomAnimation> {
  Artboard? riveContinueArtboard;
  late RiveAnimationController controllerHover;
  late RiveAnimationController controllerClick;

  Artboard? riveAngryArtboard;

  late RiveAnimationController controllerAngry;
  late RiveAnimationController controllerHappy;
  String? userInput;
  @override
  void initState() {
    super.initState();
    controllerHover = SimpleAnimation(ContinueAnimationEnum.hover.name);
    controllerClick = SimpleAnimation(ContinueAnimationEnum.click.name);

    rootBundle.load(AssetsData.continueAnimation).then(
      (data) {
        final file = RiveFile.import(data);
        final continueArtboard = file.mainArtboard;
        continueArtboard.addController(controllerHover);
        setState(() {
          riveContinueArtboard = continueArtboard;
        });
      },
    );
    controllerAngry = SimpleAnimation(MomAnimationEnum.angry2.name);
    controllerHappy = SimpleAnimation(MomAnimationEnum.happy2.name);

    rootBundle.load(AssetsData.angryAnimation).then(
      (data) {
        final file = RiveFile.import(data);
        final angryArtboard = file.mainArtboard;
        angryArtboard.addController(controllerAngry);
        setState(() {
          riveAngryArtboard = angryArtboard;
        });
      },
    );
  }

  void removeAllContinueControllers() {
    if (riveContinueArtboard == null) return;
    riveContinueArtboard!.artboard.removeController(controllerHover);
    riveContinueArtboard!.artboard.removeController(controllerClick);
    debugPrint('All Continue controllers removed');
  }

  void addHoverController() {
    removeAllContinueControllers();
    riveContinueArtboard?.artboard.addController(controllerHover);
    debugPrint('Idle');
  }

  void addClickController() {
    removeAllContinueControllers();

    riveContinueArtboard?.artboard.addController(controllerClick);
    debugPrint('Meduim Size');
  }

  void removeAllAngryControllers() {
    if (riveAngryArtboard == null) return;
    riveAngryArtboard!.artboard.removeController(controllerAngry);
    riveAngryArtboard!.artboard.removeController(controllerHappy);
    debugPrint('All Angry controllers removed');
  }

  void addAngryController() {
    removeAllAngryControllers();
    riveAngryArtboard?.artboard.addController(controllerAngry);
    debugPrint('Angry');
  }

  void addHappyController() {
    removeAllAngryControllers();
    riveAngryArtboard?.artboard.addController(controllerHappy);
    debugPrint('Happy');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addClickController();
        Future.delayed(
          const Duration(
            seconds: 1,
          ),
          () {
            addHoverController();
            showAnimationAndInputDialog(
              context,
              riveAngryArtboard,
              riveContinueArtboard,
              age: widget.age,
              gender: widget.gender,
              weight: widget.weight,
            );
          },
        );
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        //width: 100,
        child: riveContinueArtboard == null
            ? const SizedBox.shrink()
            : Rive(
                artboard: riveContinueArtboard!,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
