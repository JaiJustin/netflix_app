import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyone_watching_card.dart';

import '../../../application/hot_and_new/hot_and_new_bloc.dart';
import '../../../core/strings.dart';

class EveryoneWatchingPage extends StatelessWidget {
  const EveryoneWatchingPage({Key? key}) : super(key: key);
  final imageUrl =
      'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/9IDJpHROaC0S1ZlIxrvzOcOX5yC.jpg';

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInEveryOneWatching());
      },
      child: BlocBuilder<HotAndNewBloc, HotAndNewState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          } else if (state.isError) {
            return const Center(
              child: Text('Error while loading coming soon list'),
            );
          } else if (state.everyOneIsWatchingList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final movie = state.everyOneIsWatchingList[index];

                if (movie.id == null) {
                  return const SizedBox();
                }
                final _date = DateTime.parse(movie.releaseDate.toString());
                final formatedDate = DateFormat.yMMMMd('en_US').format(_date);

                return EveryoneWatchingCard(
                  id: movie.id != null ? movie.id.toString() : 'id is null',
                  posterPath: '$imageAppendUrl${movie.backdropPath}',
                  movieName:
                      movie.title != null ? movie.title.toString() : 'NO title',
                  description: movie.overview != null
                      ? movie.overview.toString()
                      : 'NO description available',
                );
              },
              separatorBuilder: (BuildContext context, int index) => kHeight10,
              itemCount: state.everyOneIsWatchingList.length,
            );
          }
        },
      ),
    );
  }
}
