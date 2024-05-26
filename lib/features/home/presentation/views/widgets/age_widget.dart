import 'package:animation_bmi/constant.dart';
import 'package:animation_bmi/core/utils/assets.dart';
import 'package:animation_bmi/core/utils/height_animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class AgeWidget extends StatefulWidget {
  const AgeWidget({super.key, required this.onAgeSelected});

  final Function(int) onAgeSelected;
  @override
  State<AgeWidget> createState() => _AgeWidgetState();
}

class _AgeWidgetState extends State<AgeWidget> {
  Artboard? riveArtBoard;
  late RiveAnimationController controllerBeginner;
  late RiveAnimationController controllerIntermediate;
  late RiveAnimationController controllerExpert;
  bool isSmall = false;
  bool isMedium = false;
  bool isBig = false;

  @override
  void initState() {
    super.initState();

    controllerBeginner = SimpleAnimation(HeightAnimationEnum.Beginner.name);
    controllerIntermediate =
        SimpleAnimation(HeightAnimationEnum.Intermediate.name);
    controllerExpert = SimpleAnimation(HeightAnimationEnum.Expert.name);

    rootBundle.load(AssetsData.ageAnimation).then(
      (data) {
        //await RiveFile.initialize();
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(controllerBeginner);
        setState(() {
          riveArtBoard = artboard;
        });
      },
    );
  }

  void removeAllControllers() {
    if (riveArtBoard == null) return;
    riveArtBoard?.artboard.removeController(controllerBeginner);
    riveArtBoard?.artboard.removeController(controllerIntermediate);
    riveArtBoard?.artboard.removeController(controllerExpert);
    isSmall = false;
    isMedium = false;
    isBig = false;
    debugPrint('All Height controllers removed');
  }

  void addBeginnerController() {
    removeAllControllers();
    isSmall = true;
    riveArtBoard?.artboard.addController(controllerBeginner);
    debugPrint('controllerBeginner: $controllerBeginner');
  }

  void addIntermediateController() {
    removeAllControllers();
    isMedium = true;
    riveArtBoard?.artboard.addController(controllerIntermediate);
    debugPrint('controllerBeginner: $controllerIntermediate');
  }

  void addExpertController() {
    removeAllControllers();
    isBig = true;
    riveArtBoard?.artboard.addController(controllerExpert);
    debugPrint('controllerBeginner: $controllerExpert');
  }

  double sliderAgeValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          //width: 100,
          child: riveArtBoard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveArtBoard!,
                  fit: BoxFit.cover,
                ),
        ),
        Slider(
          value: sliderAgeValue,
          min: 0,
          max: 100,
          divisions: 100,
          activeColor: kSail,
          onChanged: (value) {
            setState(() {
              sliderAgeValue = value;
              widget.onAgeSelected(value.round());
              if (value < 15 && !isSmall) {
                addBeginnerController();
              } else if (value > 15 && value < 50 && !isMedium) {
                addIntermediateController();
              } else if (value > 45 && value <= 100 && !isBig) {
                addExpertController();
              }
              debugPrint('sliderValue: $sliderAgeValue');
            });
          },
        ),
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.height / 10,
          decoration: BoxDecoration(
            color: kSail.withOpacity(.1),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Center(
            child: Text(
              '${sliderAgeValue.round()} Year',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: kSail,
                fontSize: 40,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
