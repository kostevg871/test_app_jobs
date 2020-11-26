import 'package:flutter/material.dart';
import 'package:json_test_project/models/posts.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/user_post_tile.dart';

class UserPostAllPage extends StatelessWidget {
  final List<Posts> posts;
  final Users users;

  const UserPostAllPage(this.posts, this.users);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post ${users.name}"),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => UserPostTile(posts[index]),
      ),
    );
  }
}
