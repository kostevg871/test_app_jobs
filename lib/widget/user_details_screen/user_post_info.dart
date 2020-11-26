import 'package:flutter/material.dart';
import 'package:json_test_project/models/posts.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/screen/user_post_all_page.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/user_post_tile.dart';
import 'package:provider/provider.dart';

class UserPostInfo extends StatelessWidget {
  final Users user;

  const UserPostInfo(this.user);

  @override
  Widget build(BuildContext context) {
    final List<Posts> posts = Provider.of<List<Posts>>(context);
    final title = TextStyle(fontSize: 20);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Post user', style: title),
              RaisedButton(
                child: Text("all post"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserPostAllPage(posts, user)));
                  // add UserPostAllPage();
                },
                textColor: Colors.white,
                color: Colors.indigo,
              ),
            ],
          ),
        ),
        (posts == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return UserPostTile(posts[posts.length - 1 - index]);
                },
              ),
      ],
    );
  }
}
