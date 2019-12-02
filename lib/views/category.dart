import 'package:flutter/material.dart';
import 'package:movies_app/movie_list_bloc.dart';
import 'package:movies_app/item.dart';
import 'package:movies_app/General.dart';

class MovieCategory extends StatefulWidget {
  @override
  _MovieCategoryState createState() => _MovieCategoryState();
}

class _MovieCategoryState extends State<MovieCategory> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(MovieListType.upcoming);
    return StreamBuilder(
      stream: movieListBloc.movielist,
      builder: (context, AsyncSnapshot<Item> snapshot) {
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

  Widget buildPage(AsyncSnapshot<Item> snapshot, BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      height: width / 4,
      margin: EdgeInsets.only(top: 20, bottom: 10),
      child: ListView.builder(
          itemCount: snapshot.data.results.length > 10 ? 10 : snapshot.data
              .results.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return buildElement(snapshot.data.results[index].release_date,
              snapshot.data.results[index].backdrop_path, index == 0,
              width / 3.5,);
          }
      ),

    );
  }
  buildElement(String imagePath, String category, bool isFirst, double itemHeight){

    return Container(
      width: itemHeight*1.5,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 10,
        margin: EdgeInsets.only(bottom: 20, right: 10, left: isFirst?20:10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: LayoutBuilder(
          builder: (BuildContext context,BoxConstraints constraints ){
            return Stack(
              children: <Widget>[
                 Image.network('https://image.tmdb.org/t/p/w500$imagePath' ,fit: BoxFit.cover, width: constraints.biggest.width,height: constraints.biggest.height),
                Container(
                  alignment: Alignment.center,
                  width: constraints.biggest.width,
                  height: constraints.biggest.height,
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),

              ],
            );
          },
        ),
      ),
    );
  }
}