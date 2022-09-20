import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/hot_and_new/hot_and_new_service.dart';

import '../../domain/hot_and_new/model/hot_and_new.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HotAndNewService _homeService;

  HomeBloc(this._homeService) : super(HomeState.initial()) {
    /*on event get HomeScreen data */
    on<GetHomeScreenData>((event, emit) async {
      //send loading to UI
      emit(state.copyWith(isLoading: true, hasError: false));
      final _upcomeMoveResult =
          await _homeService.getHotAndNewEveryOneWatchingData();
      final _trendingMoveResult = await _homeService.getHotAndNewMoveData();
      //transform data
      final _state1 = _upcomeMoveResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            teensDramasMovieList: [],
            southIndianMovieList: [],
            trendingMovieAndTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final pastYear = resp.results;
        final trending = resp.results;

        final drama = resp.results;
        final southIndian = resp.results;

        pastYear.shuffle();
        trending.shuffle();
        trending.shuffle();
        drama.shuffle();
        southIndian.shuffle();

        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: pastYear,
            trendingMovieList: trending,
            teensDramasMovieList: drama,
            southIndianMovieList: southIndian,
            trendingMovieAndTvList: state.trendingMovieAndTvList,
            isLoading: false,
            hasError: false);
      });
      emit(_state1);
      final _state2 = _trendingMoveResult.fold((MainFailure failure) {
        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: [],
            trendingMovieList: [],
            teensDramasMovieList: [],
            southIndianMovieList: [],
            trendingMovieAndTvList: [],
            isLoading: false,
            hasError: true);
      }, (HotAndNewResp resp) {
        final top10MovieList = resp.results;

        return HomeState(
            stateId: DateTime.now().microsecondsSinceEpoch.toString(),
            pastYearMovieList: state.pastYearMovieList,
            trendingMovieList: state.trendingMovieList,
            teensDramasMovieList: state.teensDramasMovieList,
            southIndianMovieList: state.southIndianMovieList,
            trendingMovieAndTvList: top10MovieList,
            isLoading: false,
            hasError: false);
      });
      //send to UI
      emit(_state2);
    });
  }
}
