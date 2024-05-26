import 'package:flutter/material.dart';

import '../../../../../constant.dart';

class ContainerData extends StatelessWidget {
  const ContainerData({
    super.key,
    required this.mainTitle,
    required this.secTitle,
  });

  final String mainTitle;
  final String secTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          mainTitle,
          style: const TextStyle(
            fontSize: 18,
            color: kTanHide,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          secTitle,
          style: const TextStyle(
            fontSize: 18,
            color: kChardonnay,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
