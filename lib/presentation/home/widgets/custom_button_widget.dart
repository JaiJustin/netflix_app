import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 25,
          color: kWhitColor,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            color: kWhitColor,
          ),
        )
      ],
    );
  }
}
