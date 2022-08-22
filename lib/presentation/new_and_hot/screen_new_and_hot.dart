import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_page.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/everyone_watching_page.dart';
import 'widgets/new_and_hot_app_bar.dart';

class ScreenHomeNewAndHot extends StatelessWidget {
  const ScreenHomeNewAndHot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: NewAndHotAppBar(),
          body: TabBarView(
            children: [
              ComingSoonPage(),
              EveryoneWatchingPage(),
            ],
          )),
    );
  }
}
