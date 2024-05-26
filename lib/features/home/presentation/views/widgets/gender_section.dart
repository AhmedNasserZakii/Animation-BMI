import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../core/utils/assets.dart';

class GenderSection extends StatefulWidget {
  const GenderSection({
    super.key,
    required this.onGenderSelected,
  });
  final Function(String) onGenderSelected;
  @override
  State<GenderSection> createState() => _GenderSectionState();
}

class _GenderSectionState extends State<GenderSection> {
  bool isMale = false;
  bool isFemale = false;
  void _selectGender(String gender) {
    widget.onGenderSelected(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      // children: [
      //   CustomImageContainer(
      //     assetsName: AssetsData.boy,
      //   ),
      //   SizedBox(width: 16),
      //   CustomImageContainer(assetsName: AssetsData.girl)
      // ],
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (isFemale == true) {
                  isFemale = false;
                  isMale = true;
                } else {
                  isMale = !isMale;
                }
                _selectGender(isMale ? 'Male' : 'None');
                debugPrint('Male Tapped $isMale');
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.width / 2.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(
                    isMale ? AssetsData.happyBoy : AssetsData.boy,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                if (isMale == true) {
                  isMale = false;
                  isFemale = true;
                } else {
                  isFemale = !isFemale;
                }
                _selectGender(isFemale ? 'Female' : 'None');
                debugPrint('Female Tapped');
              });
            },
            child: Container(
              height: MediaQuery.of(context).size.width / 2.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: AssetImage(
                    isFemale ? AssetsData.happyGirl : AssetsData.girl,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
