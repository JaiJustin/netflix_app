import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
    this.iconSize = 25,
    this.textSize = 20,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: kWhitColor,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: textSize,
            color: kGreyColor,
          ),
        )
      ],
    );
  }
}
