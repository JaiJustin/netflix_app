import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:netflix_app/presentation/fast_laugh/widgets/video_list_item_widget.dart';

import '../../application/fast_laugh/fast_laugh_bloc.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FastLaughBloc, FastLaughState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                strokeWidth: 2,
              ));
            } else if (state.isError) {
              return const Center(
                child: Text('Error while getting data'),
              );
            } else if (state.videoList.isEmpty) {
              return const Center(
                child: Text('Video list empty'),
              );
            } else {
              return PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(
                  state.videoList.length,
                  (index) => VideoListItemInheritedWidget(
                      widget: VideoListItemItemWidget(
                        index: index,
                        key: Key(index.toString()),
                      ),
                      movieData: state.videoList[index]),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
