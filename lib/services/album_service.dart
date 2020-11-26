import 'package:http/http.dart' as http;
import 'package:json_test_project/models/albums.dart';

class AlbumService {
  http.Client client = http.Client();

  Future<List<Albums>> fetchAlbums(user) async {
    var userId = user.id;
    var url = "https://jsonplaceholder.typicode.com/albums?userId=$userId";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return albumsFromJson(response.body);
    } else {
      print("err");
    }
  }
}
