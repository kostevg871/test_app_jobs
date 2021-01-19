import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_test_project/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersProvider with ChangeNotifier {
  List<Users> user = [];

  UnmodifiableListView<Users> get allUsers => UnmodifiableListView(user);

  void initialState() {
    syncDataWithProvider();
  }

  Future addComment(Users _users) async {
    user.add(_users);
    updateSharedPreferences();
    notifyListeners();
  }

  Future addUsers(List<Users> _user) async {
    user.addAll(_user);
    notifyListeners();
  }

  Future updateSharedPreferences() async {
    List<String> myUsers = user.map((f) => json.encode(f.toJson())).toList();
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setStringList('users', myUsers);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList("users");

    if (result != null) {
      user = result.map((f) => Users.fromJson(json.decode(f))).toList();
    }
    notifyListeners();
  }
}
