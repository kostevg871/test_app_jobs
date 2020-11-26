import 'package:flutter/material.dart';
import 'package:json_test_project/models/users.dart';
import 'package:json_test_project/screen/user_details_screen.dart';
import 'package:json_test_project/services/album_service.dart';
import 'package:json_test_project/services/posts_service.dart';
import 'package:provider/provider.dart';

class HomeListTile extends StatelessWidget {
  final Users user;

  HomeListTile(this.user);

  @override
  Widget build(BuildContext context) {
    final PostService postService = PostService();
    final AlbumService albumService = AlbumService();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FutureProvider(
                    create: (context) => postService.fetchPost(user),
                    catchError: (context, error) {
                      print(error.toString());
                    },
                    child: FutureProvider(
                        create: (context) => albumService.fetchAlbums(user),
                        catchError: (context, error) {
                          print(error.toString());
                        },
                        child: UserDetailsPage(user)))));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: <Widget>[
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: Colors.blueAccent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.indigo,
                        child: Center(
                          child: Text(user.id.toString()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              user.username,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              user.name,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
