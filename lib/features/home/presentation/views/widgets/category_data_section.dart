import 'package:flutter/material.dart';

import '../../../../../constant.dart';
import 'container_data.dart';

class CategoryDataSection extends StatelessWidget {
  const CategoryDataSection({
    super.key,
    required this.dataTitle,
    required this.secData,
  });

  final List<String> dataTitle;
  final List<String> secData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) {
          return Container(
            width: MediaQuery.of(context).size.width / 5,
            height: 100,
            margin: const EdgeInsets.symmetric(
              horizontal: 5,
              vertical: 16,
            ),
            decoration: BoxDecoration(
              color: kSail.withOpacity(0.3),
              borderRadius: BorderRadius.circular(16),
            ),
            child: ContainerData(
              mainTitle: dataTitle[index],
              secTitle: secData[index],
            ),
          );
        },
      ),
    );
  }
}
