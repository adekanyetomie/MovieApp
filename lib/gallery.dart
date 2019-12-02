import 'package:flutter/material.dart';
import 'package:movies_app/bloc_image.dart';
import 'package:movies_app/movieimage.dart';

class Gallery extends StatefulWidget {
  final int id;

  Gallery({Key key, this.id}): super(key:key);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    ImageBloc.fetchMovieImages(widget.id);
    return StreamBuilder(
      stream: ImageBloc.movieimage,
      builder: (context, AsyncSnapshot<MovieImage> snapshot) {
        if (snapshot.hasData) {
          return buildPage(snapshot, context);
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return Container(
          padding: EdgeInsets.all(15),
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

