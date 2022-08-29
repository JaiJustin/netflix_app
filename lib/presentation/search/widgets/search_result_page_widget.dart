import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/core/strings.dart';
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
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2 / 3,
                children: List.generate(state.searchResultList.length, (index) {
                  final moviesPoster = state
                              .searchResultList[index].posterPath ==
                          null
                      ? 'https://www.pikpng.com/pngl/b/106-1069399_iam-add-group1-sorry-no-image-available-clipart.png'
                      : '$imageAppendUrl${state.searchResultList[index].posterPath}';

                  return state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : ImageCardWidget(imageUrl: moviesPoster);
                }),
              );
            },
          ),
        ),
      ],
    );
  }
}

class ImageCardWidget extends StatelessWidget {
  const ImageCardWidget({Key? key, required this.imageUrl}) : super(key: key);
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('$imageUrl'),
        ),
      ),
    );
  }
}
