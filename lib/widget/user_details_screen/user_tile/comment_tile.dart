import 'package:flutter/material.dart';
import 'package:json_test_project/models/comments.dart';

class CommentTile extends StatelessWidget {
  final Comments comments;

  const CommentTile(this.comments);

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyleTitle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
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
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(comments.name, style: textStyleTitle),
              Text(comments.email),
            ],
          ),
          subtitle: Text(comments.body),
          isThreeLine: true,
        ),
      ),
    );
  }
}
