import 'package:flutter/material.dart';
import 'package:json_test_project/models/albums.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/user_albums_tile.dart';

class UserAlbumAllPage extends StatelessWidget {
  final Users users;
  final List<Albums> albums;

  const UserAlbumAllPage({this.users, this.albums});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Albums ${users.name}"),
      ),
      body: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) => UserAlbumTile(albums[index])),
    );
  }
}
