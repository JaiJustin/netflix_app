import 'package:flutter/material.dart';

import '../../../core/constants.dart';

class HomeAppBarWidget extends StatelessWidget {
  const HomeAppBarWidget({
    Key? key,
    required this.netflixLogo,
  }) : super(key: key);

  final String netflixLogo;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: double.infinity,
      height: 80,
      color: Colors.black.withOpacity(.1),
      duration: const Duration(seconds: 5),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                netflixLogo,
                width: 70,
              ),
              const Spacer(),
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                width: 30,
                height: 30,
                color: Colors.blue,
              ),
            ],
          ),
          kHeight10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Text('Tv Shows', style: kHomeAppBarTextStyle),
              Text(
                'Movies',
                style: kHomeAppBarTextStyle,
              ),
              Text(
                'Categories',
                style: kHomeAppBarTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
