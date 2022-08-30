import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/failures/main_failure.dart';
import 'package:netflix_app/domain/downloads/i_downloads_repo.dart';

import '../../domain/downloads/models/downloads.dart';

part 'fast_laugh_event.dart';
part 'fast_laugh_state.dart';
part 'fast_laugh_bloc.freezed.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
];

ValueNotifier<Set<int>> likedVideosIdsNotifier = ValueNotifier({});

@injectable
class FastLaughBloc extends Bloc<FastLaughEvent, FastLaughState> {
  FastLaughBloc(IDownloadsRepo _downloadService)
      : super(FastLaughState.initial()) {
    on<Initialize>((event, emit) async {
      //sending lodging to Ui
      emit(
        const FastLaughState(
          videoList: [],
          isLoading: true,
          isError: false,
        ),
      );
//get trending movies
      final _result = await _downloadService.getDownloadsImages();
      final _state = _result.fold((l) {
        return const FastLaughState(
          videoList: [],
          isLoading: false,
          isError: true,
        );
      }, (resp) {
        return FastLaughState(
          videoList: resp,
          isLoading: false,
          isError: false,
        );
      });

//send  to ui
      emit(_state);
    });
    on<LikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.add(event.id);
    });
    on<UnlikeVideo>((event, emit) async {
      likedVideosIdsNotifier.value.remove(event.id);
    });
  }
}
