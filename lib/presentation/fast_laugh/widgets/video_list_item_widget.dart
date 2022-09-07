import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/strings.dart';
import 'package:netflix_app/domain/downloads/models/downloads.dart';
import 'package:share_plus/share_plus.dart';
import 'package:video_player/video_player.dart';

import '../../../application/fast_laugh/fast_laugh_bloc.dart';

class VideoListItemInheritedWidget extends InheritedWidget {
  final Widget widget;
  final Downloads movieData;

  const VideoListItemInheritedWidget({
    Key? key,
    required this.widget,
    required this.movieData,
  }) : super(child: widget, key: key);
  @override
  bool updateShouldNotify(covariant VideoListItemInheritedWidget oldWidget) {
    return oldWidget.movieData != movieData;
  }

  static VideoListItemInheritedWidget? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<VideoListItemInheritedWidget>();
  }
}

class VideoListItemItemWidget extends StatelessWidget {
  const VideoListItemItemWidget({Key? key, required this.index})
      : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    final posterPath =
        VideoListItemInheritedWidget.of(context)?.movieData.posterPath;
    final videoUrl = dummyVideoUrls[index % dummyVideoUrls.length];
    return Stack(
      children: [
        FastLaughVideoPlayer(
          videoUrl: videoUrl,
          onStateChanced: (bool) {},
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 24,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_off,
                      size: 22,
                      color: kWhitColor,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: posterPath == null
                          ? null
                          : NetworkImage('$imageAppendUrl$posterPath'),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: likedVideosIdsNotifier,
                    builder: (
                      BuildContext context,
                      Set<int> newLikedListIds,
                      Widget? child,
                    ) {
                      final _index = index;
                      if (newLikedListIds.contains(_index)) {
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.remove(_index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.favorite,
                            title: 'Liked',
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            likedVideosIdsNotifier.value.add(_index);
                            likedVideosIdsNotifier.notifyListeners();
                          },
                          child: const VideoActionsWidget(
                            icon: Icons.emoji_emotions_rounded,
                            title: 'LOL',
                          ),
                        );
                      }
                    },
                  ),
                  const VideoActionsWidget(
                    icon: Icons.add,
                    title: 'My List',
                  ),
                  GestureDetector(
                    onTap: () {
                      final movieLink = VideoListItemInheritedWidget.of(context)
                          ?.movieData
                          .posterPath;
                      if (movieLink != null) {
                        Share.share('$imageAppendUrl$movieLink');
                      }
                    },
                    child: const VideoActionsWidget(
                      icon: Icons.send,
                      title: 'Share',
                    ),
                  ),
                  const VideoActionsWidget(
                    icon: Icons.play_circle_fill,
                    title: 'Paly',
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  const VideoActionsWidget({Key? key, required this.icon, required this.title})
      : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhitColor,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhitColor, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  final void Function(bool isPlaying) onStateChanced;
  const FastLaughVideoPlayer(
      {super.key, required this.videoUrl, required this.onStateChanced});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(
              aspectRatio: _videoPlayerController.value.aspectRatio,
              child: VideoPlayer(_videoPlayerController),
            )
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }
}
