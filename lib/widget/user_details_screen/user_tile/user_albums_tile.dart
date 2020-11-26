import 'package:flutter/material.dart';
import 'package:json_test_project/models/albums.dart';
import 'package:json_test_project/models/photos.dart';
import 'package:json_test_project/services/photo_services.dart';
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
          child: ListTile(
            title: Text(album.title),
            leading: ImageAlbumsTile(),
            trailing: Text(album.id.toString()),
          ),
        ),
      ),
    );
  }
}

class ImageAlbumsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Photos> photos = Provider.of<List<Photos>>(context);
    return (photos == null)
        ? CircularProgressIndicator()
        :
        // add photo and idPhoto
        Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(photos.last.thumbnailUrl),
          );
  }
}
