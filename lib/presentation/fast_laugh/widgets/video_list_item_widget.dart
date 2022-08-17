import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';

class VideoLIstItemItemWidget extends StatelessWidget {
  const VideoLIstItemItemWidget({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
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
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://www.themoviedb.org/t/p/w220_and_h330_face/ox4goZd956BxqJH6iLwhWPL9ct4.jpg'),
                    ),
                  ),
                  VideoActionsWidget(
                      icon: Icons.emoji_emotions_rounded, title: 'LOL'),
                  VideoActionsWidget(icon: Icons.add, title: 'My List'),
                  VideoActionsWidget(icon: Icons.send, title: 'Share'),
                  VideoActionsWidget(
                      icon: Icons.play_circle_fill, title: 'Paly'),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhitColor,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhitColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
