import 'package:flutter/material.dart';
import 'package:json_test_project/models/albums.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/screen/user_albums_all_page.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/user_albums_tile.dart';
import 'package:provider/provider.dart';

class UserAlbumsInfo extends StatelessWidget {
  final Users users;

  const UserAlbumsInfo(this.users);

  @override
  Widget build(BuildContext context) {
    final List<Albums> albums = Provider.of<List<Albums>>(context);
    final title = TextStyle(fontSize: 20);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Albums user', style: title),
              RaisedButton(
                child: Text("all albums"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UserAlbumAllPage(
                                users: users,
                                albums: albums,
                              )));
                },
                textColor: Colors.white,
                color: Colors.indigo,
              ),
            ],
          ),
        ),
        (albums == null)
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  // final PhotoService photoService = PhotoService();
                  // final photos = photoService.fetchPhoto(albums[index]);
                  return UserAlbumTile(
                    albums[albums.length - 1 - index],
                  );
                },
              ),
      ],
    );
  }
}
