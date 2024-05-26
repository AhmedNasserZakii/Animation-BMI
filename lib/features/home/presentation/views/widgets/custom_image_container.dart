import 'package:flutter/material.dart';

class CustomImageContainer extends StatefulWidget {
  const CustomImageContainer({
    super.key,
    required this.assetsName,
  });
  final String assetsName;

  @override
  State<CustomImageContainer> createState() => _CustomImageContainerState();
}

class _CustomImageContainerState extends State<CustomImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.width / 2.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          image: DecorationImage(
            image: AssetImage(
              widget.assetsName,
            ),
          ),
        ),
      ),
    );
  }
}
