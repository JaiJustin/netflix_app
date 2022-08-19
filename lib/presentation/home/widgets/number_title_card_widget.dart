import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/main_title_widget.dart';

import '../../../core/constants.dart';
import '../../widgets/main_card_widget.dart';

class NumberTitleCardWidget extends StatelessWidget {
  const NumberTitleCardWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitleWidget(title: 'Top 10 Tv shows in india Tody'),
        SizedBox(
          width: size.width,
          height: size.width * .5,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => Stack(
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 50,
                          ),
                          MainCardWidget(
                            size: size,
                            imageUrl: imageUrl,
                          ),
                        ],
                      ),
                      Positioned(
                        left: 10,
                        bottom: -27,
                        child: BorderedText(
                          strokeColor: Colors.white,
                          strokeWidth: 5.0,
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 120,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              separatorBuilder: (ctx, index) => kWidth,
              itemCount: 10),
        ),
      ],
    );
  }
}
