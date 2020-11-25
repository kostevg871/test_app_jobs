import 'package:http/http.dart' as http;

class PostService {
  http.Client client = http.Client();

  Future<List<Post>> fetchUser() async {
    var url = "https://jsonplaceholder.typicode.com/users";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      print(response);
      return usersFromJson(response.body);
    } else {
      print("err");
    }
  }
}
