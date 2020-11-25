import 'package:flutter/material.dart';
import 'package:json_test_project/models/Users.dart';
import 'package:json_test_project/widget/home_list_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Users> users = Provider.of<List<Users>>(context);
    // Provider.of<UsersModel>(context).getUserHttp();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Center(child: Text("all User")),
        ),
        body: (users == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return HomeListTile(users[index]);
                })
        // Consumer<UsersModel>(
        //   builder: (context, userModel, child) {
        //     if (userModel.user.isEmpty) {
        //       return CircularProgressIndicator();
        //     } else {
        //       return ListView.builder(
        //         itemCount: userModel.user.length,
        //         itemBuilder: (context, index) {
        //           return HomeListTile(userModel.user[index]);
        //         },
        //       );
        //     }
        //   },
        // ),
        );
  }
}
