import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_test_project/models/comments.dart';
import 'package:json_test_project/services/add_comment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddCommentProvider with ChangeNotifier {
  List<Comments> comment = [];

  UnmodifiableListView<Comments> get allComments =>
      UnmodifiableListView(comment);

  void initialState() {
    syncDataWithProvider();
  }

  Future addComment(Comments _comment) async {
    final Future<Comments> addCommentService =
        AddCommentService().addComment(_comment);
    var add = addCommentService.whenComplete(() => comment.add(_comment));
    add.whenComplete(() => updateSharedPreferences());
    notifyListeners();
  }

  Future updateSharedPreferences() async {
    List<String> myComments =
        comment.map((f) => json.encode(f.toJson())).toList();
    SharedPreferences pref = await SharedPreferences.getInstance();

    await pref.setStringList('comments', myComments);
  }

  Future syncDataWithProvider() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var result = prefs.getStringList("comments");

    if (result != null) {
      comment = result.map((f) => Comments.fromJson(json.decode(f))).toList();
    }
    notifyListeners();
  }
}
