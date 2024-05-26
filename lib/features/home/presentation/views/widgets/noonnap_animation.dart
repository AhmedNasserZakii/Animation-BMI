import 'package:animation_bmi/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class NoonnapAnimation extends StatefulWidget {
  const NoonnapAnimation({super.key});

  @override
  State<NoonnapAnimation> createState() => _NoonnapAnimationState();
}

class _NoonnapAnimationState extends State<NoonnapAnimation> {
  Artboard? riveArtboard;
  late RiveAnimationController controllerIdle;

  @override
  void initState() {
    super.initState();
    controllerIdle = SimpleAnimation('Idle');

    rootBundle.load(AssetsData.noonnapAnimation).then(
      (data) {
        final file = RiveFile.import(data);
        final artboard = file.mainArtboard;
        artboard.addController(controllerIdle);
        setState(() {
          riveArtboard = artboard;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      //width: 100,
      child: riveArtboard == null
          ? const SizedBox.shrink()
          : Rive(
              artboard: riveArtboard!,
              fit: BoxFit.cover,
            ),
    );
  }
}
