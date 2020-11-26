import 'package:flutter/material.dart';
import 'package:json_test_project/models/comments.dart';
import 'package:json_test_project/models/posts.dart';
import 'package:json_test_project/widget/details_post_page/custom_flut_button.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/comment_tile.dart';
import 'package:provider/provider.dart';

class DetailsPostPage extends StatelessWidget {
  final Posts posts;

  const DetailsPostPage(this.posts);

  @override
  Widget build(BuildContext context) {
    final TextStyle titleStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    final TextStyle subTitleStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.normal);
    final List<Comments> comment = Provider.of<List<Comments>>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(" Number posts: ${posts.id.toString()}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text(posts.title, style: titleStyle),
                  subtitle: Text(posts.body, style: subTitleStyle),
                ),
              ),
              (comment == null)
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: comment.length,
                      itemBuilder: (context, index) {
                        return CommentTile(comment[index]);
                      }),
            ],
          ),
        ),
        floatingActionButton: CustomFlatButton());
  }
}
