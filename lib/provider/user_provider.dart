import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:json_test_project/models/Users.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class UsersModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<Users> _user = [];

  UnmodifiableListView<Users> get user => UnmodifiableListView(_user);

  void getUserHttp() async {
    final responseUsers = await RemoteServiceUser().fetchUser();
    if (responseUsers != null) {
      _user.addAll(responseUsers);
      print(_user);
    } else {
      return null;
    }
    // notifyListeners();
  }
}
