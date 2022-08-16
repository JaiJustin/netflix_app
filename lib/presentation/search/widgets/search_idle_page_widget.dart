import 'package:flutter/cupertino.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/search/widgets/search_text_title_widget.dart';

class SearchIdlePageWidget extends StatelessWidget {
  const SearchIdlePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitleWidget(
          title: 'Top Search',
        ),
        kHeight10,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) => const TopSearchItemTile(),
              separatorBuilder: (ctx, index) => kHeight20,
              itemCount: 10),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({Key? key}) : super(key: key);
  final imageUrl =
      'https://www.themoviedb.org/t/p/w250_and_h141_face/nvxrQQspxmSblCYDtvDAbVFX8Jt.jpg';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.37,
          height: size.width * 0.2,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Movie Name',
              style: TextStyle(
                color: kWhitColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const Icon(
          CupertinoIcons.play_circle,
          color: kWhitColor,
          size: 40,
        )
      ],
    );
  }
}
