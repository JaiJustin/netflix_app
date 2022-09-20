import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/home/home_bloc.dart';

import 'package:netflix_app/core/constants.dart';
import 'package:netflix_app/presentation/home/widgets/background_card_widget.dart';

import 'package:netflix_app/presentation/home/widgets/home_app_bar_widget.dart';

import '../widgets/main_title_card.dart';

import 'widgets/number_title_card_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  final imageUrl =
      'https://www.themoviedb.org/t/p/w220_and_h330_face/62HCnUTziyWcpDaBO2i1DX17ljH.jpg';
  final imageUrl2 =
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/1G5mt3uGUW5OWUcxcBUtHm5Zdd9.jpg';

  final netflixImage =
      'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      BlocProvider.of<HomeBloc>(context).add(const GetHomeScreenData());
    });
    ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

    final widgetsList = [
      BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(children: [
            BackgroundCard(imageUrl: imageUrl2),
            MainTitleCard(
              title: 'Released in th past year',
              imageList: state.pastYearMovieList,
            ),
            MainTitleCard(
              title: 'Trending Now',
              imageList: state.trendingMovieList,
            ),
            MainTitleCard(
              title: 'Tense Dramas',
              imageList: state.teensDramasMovieList,
            ),
            MainTitleCard(
              title: 'South Indican cinema',
              imageList: state.southIndianMovieList,
            ),
            NumberTitleCardWidget(movePostList: state.trendingMovieAndTvList),
          ]);
        },
      )
    ];

    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: scrollNotifier,
        builder: (BuildContext context, bool value, Widget? child) =>
            NotificationListener<UserScrollNotification>(
          onNotification: ((notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }

            return true;
          }),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    if (state.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      );
                    } else if (state.hasError) {
                      return const Text('Error whale getting data');
                    }

                    return ListView.separated(
                        itemBuilder: (ctx, index) => widgetsList[index],
                        separatorBuilder: (ctx, index) => kHeight10,
                        itemCount: widgetsList.length);
                  },
                ),
              ),
              Visibility(
                visible: scrollNotifier.value,
                child: HomeAppBarWidget(netflixLogo: netflixImage),
              )
            ],
          ),
        ),
      ),
    );
  }
}
