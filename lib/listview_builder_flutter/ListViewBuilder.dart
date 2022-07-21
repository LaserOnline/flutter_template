import 'package:flutter/material.dart';
import 'package:flutter_template/listview_builder_flutter/Square.dart';
import 'Circle.dart';

class ListViewBuilder extends StatelessWidget {
  final List _posts = ["post 1", "post 2", "post 3", "post 4"];
  final List _story = ["post 1", "post 2", "post 3", "post 4", "post 5"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //* instagram stories
          Container(
            height: 150,
            child: ListView.builder(
                itemCount: _story.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return MyCircle(
                    child: _story[index],
                  );
                }),
          ),

          //* instagram posts
          Expanded(
            child: ListView.builder(
                itemCount: _posts.length,
                itemBuilder: (context, index) {
                  return MySquare(
                    child: _posts[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
