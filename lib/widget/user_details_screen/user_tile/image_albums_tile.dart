import 'package:flutter/material.dart';
import 'package:json_test_project/models/photos.dart';
import 'package:provider/provider.dart';

class ImageAlbumsTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Photos> photos = Provider.of<List<Photos>>(context);
    return (photos == null)
        ? CircularProgressIndicator()
        : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(photos.last.thumbnailUrl),
          );
  }
}
