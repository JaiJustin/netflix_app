import 'package:flutter/material.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_idle_page_widget.dart';
import 'package:netflix_app/presentation/search/widgets/search_text_title_widget.dart';

class SearchResultPageWidget extends StatelessWidget {
  const SearchResultPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitleWidget(title: 'movies & TV'),
        kHeight10,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 2 / 3,
            children: List.generate(20, (index) => const MainCardWidget()),
          ),
        ),
      ],
    );
  }
}

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({Key? key}) : super(key: key);
  final imageUrl =
      'https://www.themoviedb.org/t/p/w220_and_h330_face/ox4goZd956BxqJH6iLwhWPL9ct4.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(imageUrl),
        ),
      ),
    );
  }
}
