part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required String stateId,
    required List<HotAndNewData> pastYearMovieList,
    required List<HotAndNewData> trendingMovieList,
    required List<HotAndNewData> teensDramasMovieList,
    required List<HotAndNewData> southIndianMovieList,
    required List<HotAndNewData> trendingMovieAndTvList,
    required bool isLoading,
    required bool hasError,
  }) = _Initial;
  factory HomeState.initial() => const HomeState(
      stateId: '0',
      pastYearMovieList: [],
      trendingMovieList: [],
      teensDramasMovieList: [],
      southIndianMovieList: [],
      trendingMovieAndTvList: [],
      isLoading: false,
      hasError: false);
}
