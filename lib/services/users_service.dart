import 'package:http/http.dart' as http;
import 'package:json_test_project/models/Users.dart';

class UserService {
  http.Client client = http.Client();

  Future<List<Users>> fetchUser() async {
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
