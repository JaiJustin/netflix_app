import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/widgets/custom_button_widget.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/video_widget.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class ComingSoonCard extends StatelessWidget {
  final String id;
  final String month;
  final String day;
  final String posterPath;
  final String movieName;
  final String description;

  const ComingSoonCard(
      {super.key,
      required this.id,
      required this.month,
      required this.day,
      required this.posterPath,
      required this.movieName,
      required this.description});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        ComingSoonDate(
          size: size,
          day: day,
          month: month,
        ),
        SizedBox(
          width: size.width - 50,
          height: size.height * 0.66,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kHeight10,
              VideoWidget(height: size.width * 0.5, imageUrl: posterPath),
              kHeight10,
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      movieName,
                      style: TextStyle(
                          fontSize: size.width * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    child: Row(
                      children: const [
                        Expanded(
                          child: CustomButtonWidget(
                            icon: Icons.notifications_outlined,
                            text: 'Remind',
                            iconSize: 18,
                            textSize: 12,
                          ),
                        ),
                        kWidth,
                        Expanded(
                          child: CustomButtonWidget(
                            icon: Icons.info_outline,
                            text: 'info',
                            iconSize: 20,
                            textSize: 14,
                          ),
                        ),
                        kWidth
                      ],
                    ),
                  ),
                ],
              ),
              const Text('Coming on Friday'),
              kHeight10,
              Text(
                movieName,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              kHeight10,
              Text(
                description,
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
    required this.day,
    required this.month,
  }) : super(key: key);

  final Size size;
  final String day;
  final String month;

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
            month,
            style: TextStyle(
              fontSize: 16,
              color: kGreyColor,
            ),
          ),
          Text(
            day,
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
