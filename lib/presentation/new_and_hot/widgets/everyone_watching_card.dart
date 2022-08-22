import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/custom_button_widget.dart';

class EveryoneWatchingCard extends StatelessWidget {
  const EveryoneWatchingCard({
    Key? key,
    required this.imageUrl,
    required this.size,
  }) : super(key: key);

  final String imageUrl;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Friends',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          kHeight10,
          Text(
            'This hit sitcom follows the merry  misadventure of six\n20-something plan as they naivete the pitfalls of work\nlife and love in 1990s manhattan.',
            style: TextStyle(color: kGreyColor, fontSize: 15),
          ),
          kHeight50,
          VideoWidget(
            imageUrl: imageUrl,
            height: size.width * 0.54,
          ),
          kHeight20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              CustomButtonWidget(
                icon: Icons.send,
                text: 'Share',
                iconSize: 30,
                textSize: 14,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.add,
                text: 'My List',
                iconSize: 36,
                textSize: 14,
              ),
              kWidth,
              CustomButtonWidget(
                icon: Icons.play_arrow,
                text: 'Play',
                iconSize: 40,
                textSize: 14,
              ),
              kWidth,
            ],
          )
        ],
      ),
    );
  }
}
