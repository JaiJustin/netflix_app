import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/domain/hot_and_new/model/hot_and_new.dart';

import '../../core/constants.dart';
import 'main_card_widget.dart';
import 'main_title_widget.dart';

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    Key? key,
    required this.imageList,
    required this.title,
  }) : super(key: key);

  final List<HotAndNewData> imageList;
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
                    imageUrl:
                        '$imageAppendUrl${imageList[Random().nextInt(imageList.length)].posterPath}',
                  ),
              separatorBuilder: (ctx, index) => kWidth,
              itemCount: imageList.length),
        ),
      ],
    );
  }
}
