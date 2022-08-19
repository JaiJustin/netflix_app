import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/home/widgets/custom_button_widget.dart';

import '../../../core/colors/colors.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: size.width,
          height: size.height * 0.73,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomButtonWidget(
                icon: Icons.add,
                text: 'My List',
              ),
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(kWhitColor),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: kBlackColor,
                  size: 25,
                ),
                label: const Text(
                  'paly',
                  style: TextStyle(color: kBlackColor, fontSize: 25),
                ),
              ),
              const CustomButtonWidget(
                icon: Icons.info_outline,
                text: 'info',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
