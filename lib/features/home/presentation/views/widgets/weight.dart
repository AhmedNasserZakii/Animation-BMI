import 'package:animation_bmi/core/utils/assets.dart';
import 'package:animation_bmi/core/utils/weight_animation_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

import '../../../../../constant.dart';

class WeightWidget extends StatefulWidget {
  const WeightWidget({super.key, required this.onWeightSelected});
  final Function(int) onWeightSelected;
  @override
  State<WeightWidget> createState() => _WeightWidgetState();
}

class _WeightWidgetState extends State<WeightWidget> {
  Artboard? riveArtboard;

  late RiveAnimationController controllerIdel;
  late RiveAnimationController controllerMediumSize;
  late RiveAnimationController controllerLargeSize;
  bool isMedium = false;
  bool isLarge = false;

  @override
  void initState() {
    super.initState();
    controllerIdel = SimpleAnimation(WeightAnimationEnum.idle.name);
    controllerMediumSize =
        SimpleAnimation(WeightAnimationEnum.medium_size.name);
    controllerLargeSize = SimpleAnimation(WeightAnimationEnum.large_size.name);
    rootBundle.load(AssetsData.weightAnimation).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(controllerIdel);
        setState(() {
          riveArtboard = artboard;
        });
      },
    );
  }

  void removeAllControllers() {
    if (riveArtboard == null) return;
    riveArtboard!.artboard.removeController(controllerIdel);
    riveArtboard!.artboard.removeController(controllerMediumSize);
    riveArtboard!.artboard.removeController(controllerLargeSize);
    isMedium = false;
    isLarge = false;
    debugPrint('All Weight controllers removed');
  }

  void addIdelController() {
    removeAllControllers();
    riveArtboard?.artboard.addController(controllerIdel);
    debugPrint('Idle');
  }

  void addMediumSizeController() {
    removeAllControllers();
    isMedium = true;
    riveArtboard?.artboard.addController(controllerMediumSize);
    debugPrint('Meduim Size');
  }

  void addLargeSizeController() {
    removeAllControllers();
    isLarge = true;
    riveArtboard?.artboard.addController(controllerLargeSize);
    debugPrint('large Size');
  }

  double sliderWeightValue = 40;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          //width: 100,
          child: riveArtboard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveArtboard!,
                  fit: BoxFit.cover,
                ),
        ),
        Slider(
          value: sliderWeightValue,
          min: 40,
          max: 200,
          divisions: 160,
          activeColor: kSail,
          onChanged: (value) {
            setState(() {
              sliderWeightValue = value;
              widget.onWeightSelected(value.round());
              if (value < 80 && !isMedium) {
                addMediumSizeController();
              } else if (value > 80 && value < 200 && !isLarge) {
                addLargeSizeController();
              } else if (value == 40) {
                addIdelController();
              }
              debugPrint('sliderValue: ${sliderWeightValue.round()}');
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
              '${sliderWeightValue.round()} KG',
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
