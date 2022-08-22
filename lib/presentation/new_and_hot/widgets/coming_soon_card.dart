import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({
    Key? key,
    required this.index,
    required this.imageUrl,
  }) : super(key: key);
  final int index;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        ComingSoonDate(size: size, index: index),
        SizedBox(
          width: size.width - 50,
          height: size.height * 0.58,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              VideoWidget(height: size.width * 0.5, imageUrl: imageUrl),
              kHeight10,
              Row(
                children: [
                  const Text(
                    'Tall Girl 2',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications_outlined,
                        text: 'Remind me',
                        iconSize: 20,
                        textSize: 14,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        icon: Icons.info_outline,
                        text: 'info',
                        iconSize: 20,
                        textSize: 14,
                      ),
                      kWidth
                    ],
                  ),
                ],
              ),
              const Text('Coming on Friday'),
              kHeight10,
              const Text(
                'Tall Girl 2',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              kHeight10,
              Text(
                'Leading the lead in the school music is a dream come true for Jodi, until the pressure sends her confidence - and her relationship - into a tailspin.',
                style: TextStyle(color: kGreyColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ComingSoonDate extends StatelessWidget {
  const ComingSoonDate({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);

  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: size.height * 0.58,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          kHeight10,
          Text(
            'FEB',
            style: TextStyle(
              fontSize: 16,
              color: kGreyColor,
            ),
          ),
          Text(
            '${index + 11}',
            style: const TextStyle(
              fontSize: 30,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}
