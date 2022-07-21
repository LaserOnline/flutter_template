import 'package:flutter/material.dart';
import './template_music_player/SongPage.dart';
import 'listview_builder_flutter/ListViewBuilder.dart';
import './stories/Stories.dart';
import './Template_Coffee/Coffee.dart';
import './test_project/Momemts.dart';
import './test_project/ListView.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      debugShowCheckedModeBanner: false,
      home: Test_ListView(),
      //* Theme Coffee
    );
  }
}
