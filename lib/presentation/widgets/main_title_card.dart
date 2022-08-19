import 'package:flutter/material.dart';

import '../../core/constants.dart';
import 'main_card_widget.dart';
import 'main_title_widget.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(title: title),
        SizedBox(
          width: size.width,
          height: size.width * .5,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => MainCardWidget(
                    size: size,
                    imageUrl: imageUrl,
                  ),
              separatorBuilder: (ctx, index) => kWidth,
              itemCount: 20),
        ),
      ],
    );
  }
}
