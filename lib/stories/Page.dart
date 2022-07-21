import 'dart:async';
import 'package:flutter/material.dart';
import 'ProgressBar.dart';
import 'StoryBars.dart';
import 'Story_1.dart';
import 'Story_2.dart';
import 'Story_3.dart';

class StoryPage extends StatefulWidget {
  const StoryPage({Key? key}) : super(key: key);

  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  int currentStoryIndex = 0;
  final List<Widget> MyStories = [
    MyStory1(), //* 0
    MyStory2(), //* 1
    MyStory3(), //* 2
  ];
  List<double> percentWatched = [];

  void initState() {
    super.initState();
    for (int i = 0; i < MyStories.length; i++) {
      percentWatched.add(0);
    }

    _startWatching();
  }

  void _startWatching() {
    Timer.periodic(Duration(microseconds: 50), (timer) {
      setState(() {
        //* only add 0.01 as long as it's below 1
        if (percentWatched[currentStoryIndex] + 0.001 < 1) {
          percentWatched[currentStoryIndex] += 0.001;
        }
        //* if adding 0.01 exceeds 1 set percentage to 1 and cancel timer
        else {
          percentWatched[currentStoryIndex] = 1;
          timer.cancel();
          if (currentStoryIndex < MyStories.length - 1) {
            currentStoryIndex++;
            //* restart story timer
            _startWatching();
          }
          //* if we are finishing the last story then return to homepage
          else {
            Navigator.pop(context);
          }
        }
      });
    });
  }

  void _onTapDown(TapDownDetails details) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double dx = details.globalPosition.dx;
    //* user taps on first half of screen
    if (dx < screenWidth / 2) {
      setState(() {
        if (currentStoryIndex > 0) {
          percentWatched[currentStoryIndex - 1] = 0;
          percentWatched[currentStoryIndex] = 0;
          currentStoryIndex--;
        }
      });
    } else {
      setState(() {
        if (currentStoryIndex < MyStories.length - 1) {
          percentWatched[currentStoryIndex] = 1;
          currentStoryIndex++;
        } else {
          percentWatched[currentStoryIndex] = 1;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapDown(details),
      child: Scaffold(
        body: Stack(
          children: [
            MyStories[currentStoryIndex],
            StoryBars(
              percentWatched: percentWatched,
            )
          ],
        ),
      ),
    );
  }
}
