import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyone_watching_card.dart';

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({Key? key}) : super(key: key);
  final imageUrl =
      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/9IDJpHROaC0S1ZlIxrvzOcOX5yC.jpg';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ListView.separated(
        itemBuilder: (context, index) =>
            EveryoneWatchingCard(imageUrl: imageUrl, size: size),
        separatorBuilder: (context, index) => kHeight10,
        itemCount: 10);
  }
}
