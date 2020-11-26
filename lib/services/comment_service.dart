import 'package:http/http.dart' as http;
import 'package:json_test_project/models/comments.dart';

class CommentService {
  http.Client client = http.Client();

  Future<List<Comments>> fetchComment(post) async {
    var postId = post.id;
    var url = "https://jsonplaceholder.typicode.com/comments?postId=$postId";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return commentsFromJson(response.body);
    } else {
      print("err");
    }
  }
}
