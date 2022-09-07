import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_card.dart';

import '../../../core/constants.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<HotAndNewBloc>(context)
            .add(const LoadDataInComingSoon());
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
          } else if (state.comingSoonList.isEmpty) {
            return const Center(
              child: Text('List is Empty'),
            );
          } else {
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                final movie = state.comingSoonList[index];
                if (movie.id == null) {
                  return const SizedBox();
                }
                final _date = DateTime.parse(movie.releaseDate.toString());
                final formatedDate = DateFormat.yMMMMd('en_US').format(_date);

                return ComingSoonCard(
                  id: movie.id != null ? movie.id.toString() : 'id is null',
                  month: formatedDate
                      .split(' ')
                      .first
                      .substring(0, 3)
                      .toUpperCase(),
                  day: movie.releaseDate!.split('-')[1],
                  posterPath: '$imageAppendUrl${movie.backdropPath}',
                  movieName: movie.posterPath != null
                      ? movie.originalTitle.toString()
                      : 'NO title',
                  description: movie.overview != null
                      ? movie.overview.toString()
                      : 'NO description available',
                );
              },
              separatorBuilder: (BuildContext context, int index) => kHeight10,
              itemCount: state.comingSoonList.length,
            );
          }
        },
      ),
    );
  }
}
