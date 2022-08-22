import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants.dart';

class NewAndHotAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewAndHotAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(
          100,
          //kToolbarHeight
        ),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0 or
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'New & Hot',
        style: GoogleFonts.montserrat(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 30,
        ),
        kWidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kWidth
      ],
      bottom: TabBar(
          isScrollable: true,
          labelColor: kBackgroundColor,
          labelStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelColor: kWhitColor,
          indicator: BoxDecoration(
              color: kWhitColor, borderRadius: BorderRadius.circular(30)),
          tabs: const [
            Tab(
              text: '🍿️ Coming soon',
            ),
            Tab(
              text: '👀️ Everyone\'s watching',
            )
          ]),
    );
  }
}
