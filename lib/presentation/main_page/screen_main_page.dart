import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/presentation/downloads/screen_downloads.dart';
import 'package:netflix_app/presentation/fast_laugh/screen_fast_laugh.dart';
import 'package:netflix_app/presentation/home/screen_home.dart';
import 'package:netflix_app/presentation/main_page/widgets/bottom_nav.dart';
import 'package:netflix_app/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_app/presentation/search/screen_search.dart';

class ScreenManPage extends StatelessWidget {
  ScreenManPage({Key? key}) : super(key: key);

  final pages = [
    ScreenHome(),
    ScreenHomeNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (BuildContext context, int value, Widget? child) => Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(child: pages[indexChangeNotifier.value]),
        bottomNavigationBar: const BottomNavigationWidget(),
      ),
    );
  }
}
