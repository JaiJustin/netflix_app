import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/widgets/app_bar_widget.dart';

import '../../core/constants.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({Key? key}) : super(key: key);

  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBarWidget(
              title: 'Download',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(10),
            itemBuilder: (ctx, index) => _widgetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: _widgetList.length));
  }
}

class Section2 extends StatelessWidget {
  Section2({Key? key}) : super(key: key);
  final imageList = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/pIkRyD18kl4FhoCNQuWxWu5cBLM.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/ox4goZd956BxqJH6iLwhWPL9ct4.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          'Introduction Downloads for You',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhitColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        kHeight10,
        const Text(
          'We Will download a personalized selection of \n movies and shows for you , so there\'s\n always something to watch you \ndevice.',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width - 80,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.40),
                  radius: size.width * 0.32,
                ),
              ),
              DownloadsImageWidget(
                size: Size(size.width * 0.30, size.width * 0.46),
                image: imageList[0],
                margin: const EdgeInsets.only(
                  left: 150,
                  bottom: 10,
                ),
                angle: 20,
              ),
              DownloadsImageWidget(
                size: Size(size.width * 0.30, size.width * 0.46),
                image: imageList[1],
                margin: const EdgeInsets.only(
                  right: 150,
                  bottom: 10,
                ),
                angle: -20,
              ),
              DownloadsImageWidget(
                size: Size(size.width * 0.32, size.width * 0.49),
                image: imageList[2],
                margin: const EdgeInsets.only(top: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Setup',
                  style: TextStyle(
                    color: kWhitColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        kHeight10,
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              color: kButtonColorWhite,
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'See what you can download',
                  style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        kWidth,
        Icon(
          Icons.settings,
          color: kWhitColor,
          size: 28,
        ),
        kWidth,
        Text(
          'Smart Downloads',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size})
      : super(key: key);

  final double angle;
  final String image;
  final EdgeInsets margin;
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kBlackColor,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
