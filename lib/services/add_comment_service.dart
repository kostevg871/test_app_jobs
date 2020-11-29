import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_test_project/models/comments.dart';

class AddCommentService {
  http.Client client = http.Client();

  Future<Comments> addComment(Comments comment) async {
    final int postId = comment.postId;
    final String name = comment.name;
    final String body = comment.body;
    final String email = comment.email;

    final addComment = jsonEncode({
      "postId": postId,
      "name": '$name',
      "body": "$body",
      "email": "$email"
    });
    var url = 'https://jsonplaceholder.typicode.com/comments';
    var response = await client.post(
      url,
      body: addComment,
      headers: {'Content-type': 'application/json; charset=UTF-8'},
    );
    if (response.statusCode == 201) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      print("err");
    }
  }
}
