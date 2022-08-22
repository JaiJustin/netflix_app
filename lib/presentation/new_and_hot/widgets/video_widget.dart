import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required this.imageUrl,
    this.height = 700,
    this.width = double.infinity,
  }) : super(key: key);

  final String imageUrl;

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Image.network(imageUrl),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              radius: 24,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  size: 22,
                  color: kWhitColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
