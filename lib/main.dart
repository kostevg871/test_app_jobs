import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_test_project/services/users_service.dart';
import 'package:json_test_project/shared/add_comment_provider.dart';
import 'package:provider/provider.dart';

import 'screen/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCommentProvider>(
      create: (context) => AddCommentProvider(),
      child: FutureProvider(
        create: (context) => userService.fetchUser(),
        catchError: (context, error) {
          print(error.toString());
        },
        child: MaterialApp(
          title: 'Test.app',
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(
            brightness: Brightness.light,
            accentColor: Colors.indigo,
            primaryColor: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
