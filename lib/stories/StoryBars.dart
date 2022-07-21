import 'package:flutter/material.dart';
import 'ProgressBar.dart';

class StoryBars extends StatelessWidget {
  List<double> percentWatched = [];
  StoryBars({required this.percentWatched});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 8, right: 8),
      child: Row(children: [
        Expanded(
            child: ProgressBar(
          percentWatched: percentWatched[0],
        )),
        Expanded(
            child: ProgressBar(
          percentWatched: percentWatched[1],
        )),
        Expanded(
            child: ProgressBar(
          percentWatched: percentWatched[2],
        )),
      ]),
    );
  }
}
