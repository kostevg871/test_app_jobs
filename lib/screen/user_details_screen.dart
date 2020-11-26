import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/widget/user_details_screen/user_album_info.dart';
import 'package:json_test_project/widget/user_details_screen/user_info_widget.dart';
import 'package:json_test_project/widget/user_details_screen/user_post_info.dart';

class UserDetailsPage extends StatelessWidget {
  final Users user;

  const UserDetailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          UserInfoWidget(user),
          UserPostInfo(),
          UserAlbumsInfo(),
        ]),
      ),
    );
  }
}
