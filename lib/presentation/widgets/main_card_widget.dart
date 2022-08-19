import 'package:flutter/material.dart';

import '../../core/constants.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    Key? key,
    required this.size,
    required this.imageUrl,
  }) : super(key: key);

  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.35,
      height: size.width * 0.6,
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
