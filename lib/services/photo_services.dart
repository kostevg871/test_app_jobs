import 'package:http/http.dart' as http;
import 'package:json_test_project/models/photos.dart';

class PhotoService {
  http.Client client = http.Client();

  Future<List<Photos>> fetchPhoto(album) async {
    var albumId = album.id;
    var url = "https://jsonplaceholder.typicode.com/photos?albumId=$albumId";
    var response = await client.get(url);
    if (response.statusCode == 200) {
      return photosFromJson(response.body);
    } else {
      print("err");
    }
  }
}
