import 'package:animation_bmi/core/utils/assets.dart';
import 'package:animation_bmi/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  Artboard? riveMainArtboard;
  Artboard? riveMartyArtboard;
  late RiveAnimationController controllerSplashMainArtboard;
  late RiveAnimationController controllerSplashMartyArtboard;
  @override
  void initState() {
    super.initState();
    controllerSplashMainArtboard = SimpleAnimation('Background Scroll');
    controllerSplashMartyArtboard = SimpleAnimation('Marty Loop');

    rootBundle.load(AssetsData.splashAnimation).then(
      (data) {
        final file = RiveFile.import(data);
        final mainArtboard = file.mainArtboard;
        final martyArtboard = file.artboards[1];
        mainArtboard.addController(controllerSplashMainArtboard);
        martyArtboard.addController(controllerSplashMartyArtboard);
        setState(() {
          riveMainArtboard = mainArtboard;
          riveMartyArtboard = martyArtboard;
        });
      },
    );
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: riveMainArtboard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveMainArtboard!,
                  fit: BoxFit.cover,
                ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: riveMartyArtboard == null
              ? const SizedBox.shrink()
              : Rive(
                  artboard: riveMartyArtboard!,
                  fit: BoxFit.cover,
                ),
        ),
      ],
    );
  }
}
