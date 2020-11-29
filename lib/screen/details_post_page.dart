import 'package:flutter/material.dart';
import 'package:json_test_project/models/comments.dart';
import 'package:json_test_project/models/posts.dart';
import 'package:json_test_project/provider/add_comment_provider.dart';
import 'package:json_test_project/services/add_comment_service.dart';
import 'package:json_test_project/widget/details_post_page/custom_flut_button.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/comment_tile.dart';
import 'package:provider/provider.dart';

class DetailsPostPage extends StatelessWidget {
  final Posts posts;

  const DetailsPostPage(this.posts);

  @override
  Widget build(BuildContext context) {
    //Provider.of<AddCommentProvider>(context, listen: false).syncDataWithProvider();
    final TextStyle titleStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    final TextStyle subTitleStyle =
        TextStyle(fontSize: 15, fontWeight: FontWeight.normal);
    final List<Comments> comment = Provider.of<List<Comments>>(context);

    // final AddCommentProvider addCommentProvider = AddCommentProvider();
    final AddCommentProvider addComment =
        Provider.of<AddCommentProvider>(context);
    final addCommentPost = [];
    for (var n in addComment.comment) {
      if (n.postId == posts.id) {
        addCommentPost.add(n);
      }
    }
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
              ListView.builder(
                  reverse: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: addCommentPost.length,
                  itemBuilder: (context, index) {
                    return CommentTile(addCommentPost[index]);
                  }),
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
        floatingActionButton: GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddCommentScreen(posts),
                ),
              ),
            );
          },
          child: CustomFlatButton(),
        ));
  }
}

class AddCommentScreen extends StatelessWidget {
  final Posts posts;

  const AddCommentScreen(this.posts);

  @override
  Widget build(BuildContext context) {
    final AddCommentService addCommentService = AddCommentService();
    final AddCommentProvider addCommentProvider = AddCommentProvider();
    TextEditingController newCommentTitle = new TextEditingController();
    TextEditingController newCommentEmail = new TextEditingController();
    TextEditingController newCommentBody = new TextEditingController();

    void onAdd() {
      Comments commentsAdd = Comments(
        postId: posts.id,
        name: newCommentTitle.text,
        email: newCommentEmail.text,
        body: newCommentBody.text,
      );

      Provider.of<AddCommentProvider>(context, listen: false)
          .addComment(commentsAdd);
      Navigator.of(context).pop(true);
    }

    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Add Comment",
              style: TextStyle(fontSize: 30.0, color: Colors.indigo),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: newCommentTitle,
              obscureText: false,
              decoration: InputDecoration(
                labelText: "Name",
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: newCommentEmail,
              obscureText: false,
              decoration: InputDecoration(
                labelText: "e-mail",
              ),
              textAlign: TextAlign.center,
            ),
            TextField(
              controller: newCommentBody,
              maxLines: 2,
              maxLength: 255,
              obscureText: false,
              decoration: InputDecoration(
                labelText: "Comment",
              ),
              textAlign: TextAlign.center,
            ),
            FlatButton(
              onPressed: () {
                onAdd();
              },
              child: Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.indigo,
            )
          ],
        ),
      ),
    );
  }
}
