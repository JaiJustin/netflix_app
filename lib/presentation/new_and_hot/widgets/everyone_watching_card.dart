import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';
import '../../widgets/custom_button_widget.dart';

class EveryoneWatchingCard extends StatelessWidget {
  const EveryoneWatchingCard({
    Key? key,
    required this.posterPath,
    required this.movieName,
    required this.description,
    required this.id,
  }) : super(key: key);

  final String id;

  final String posterPath;
  final String movieName;
  final String description;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoWidget(
            imageUrl: posterPath,
            height: size.width * 0.54,
          ),
          kHeight20,
          Text(
            movieName,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          kHeight10,
          Text(
            description,
            style: TextStyle(color: kGreyColor, fontSize: 15),
          ),
          kHeight50,
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
