import 'package:flutter/material.dart';
import 'package:json_test_project/models/posts.dart';

class UserPostTile extends StatelessWidget {
  final Posts post;
  const UserPostTile(this.post);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.indigo,
              width: 2,
            )),
        child: ListTile(
          title: Text(post.title),
          subtitle: Text(post.body.split("\n")[0] + " ..."),
          trailing: Text(post.id.toString()),
        ),
      ),
    );
  }
}
