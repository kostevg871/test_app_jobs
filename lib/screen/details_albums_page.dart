import 'package:flutter/material.dart';
import 'package:json_test_project/models/albums.dart';
import 'package:json_test_project/models/photos.dart';
import 'package:json_test_project/widget/AlbumCarouselPhoto.dart';

class DetailsAlbumsPage extends StatelessWidget {
  final Albums albums;
  final List<Photos> photos;

  const DetailsAlbumsPage(this.albums, this.photos);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Number album ${albums.id.toString()}"),
      ),
      body: Builder(
        builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return AlbumCarouselPhoto(height: height, photos: photos);
        },
      ),
    );
  }
}
