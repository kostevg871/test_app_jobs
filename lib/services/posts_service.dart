import 'package:http/http.dart' as http;
import 'package:json_test_project/models/posts.dart';

class PostService {
  http.Client client = http.Client();

  Future<List<Posts>> fetchPost(user) async {
    var userId = user.id;
    var url = "https://jsonplaceholder.typicode.com/posts?userId=$userId";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return postsFromJson(response.body);
    } else {
      print("err");
    }
  }
}
