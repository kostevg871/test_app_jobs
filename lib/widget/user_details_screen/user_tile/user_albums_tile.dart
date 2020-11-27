import 'package:flutter/material.dart';
import 'package:json_test_project/models/albums.dart';
import 'package:json_test_project/models/photos.dart';
import 'package:json_test_project/screen/details_albums_page.dart';
import 'package:json_test_project/services/photo_services.dart';
import 'package:json_test_project/widget/user_details_screen/user_tile/image_albums_tile.dart';
import 'package:provider/provider.dart';

class UserAlbumTile extends StatelessWidget {
  final Albums album;

  const UserAlbumTile(this.album);

  @override
  Widget build(BuildContext context) {
    final PhotoService photoService = PhotoService();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.indigo,
              width: 2,
            )),
        child: FutureProvider(
          create: (context) => photoService.fetchPhoto(album),
          catchError: (context, error) {
            print(error.toString());
          },
          child: AlbumsTile(album: album),
        ),
      ),
    );
  }
}

class AlbumsTile extends StatelessWidget {
  const AlbumsTile({@required this.album});

  final Albums album;

  @override
  Widget build(BuildContext context) {
    final List<Photos> photo = Provider.of<List<Photos>>(context);
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailsAlbumsPage(album, photo)));
        },
        child: ListTile(
          title: Text(album.title),
          leading: ImageAlbumsTile(),
          trailing: Text(album.id.toString()),
        ),
      ),
    );
  }
}
