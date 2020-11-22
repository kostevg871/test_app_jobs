import 'package:flutter/material.dart';
import 'package:json_test_project/widget/home_list_tile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("all User")),
      ),
      body: ListView(
        // also create list view builder widget
        children: [
          HomeListTile(),
          HomeListTile(),
          HomeListTile(),
          HomeListTile(),
          HomeListTile(),
          HomeListTile(),
        ],
      ),
    );
  }
}
