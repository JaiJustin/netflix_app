import 'package:flutter/material.dart';
import 'package:netflix_app/presentation/new_and_hot/widgets/coming_soon_card.dart';

import '../../../core/constants.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) => ComingSoonCard(
        imageUrl:
            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/nW5fUbldp1DYf2uQ3zJTUdachOu.jpg',
        index: index,
      ),
      separatorBuilder: (BuildContext context, int index) => kHeight10,
      itemCount: 10,
    );
  }
}
