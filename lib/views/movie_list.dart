import 'package:flutter/material.dart';
import 'package:movies_app/movie_list_bloc.dart';
import 'package:movies_app/item.dart';

class MovieList extends StatefulWidget {
  final String type;
  final Function(int movieId) onItemInteraction;

  MovieList({Key key, this.type, this.onItemInteraction }): super(key:key);
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    movieListBloc.fetchMovieList(widget.type);
    return StreamBuilder(
      stream: movieListBloc.movielist,
      builder: (context, AsyncSnapshot<Item> snapshot){
        if(snapshot.hasData){
          return buildPage(snapshot, context);
        }else if(snapshot.hasError){
          return Text(snapshot.error.toString());
        }
        return Container(
          padding:  EdgeInsets.all(15),
          child: Center(child: CircularProgressIndicator() ),
        );

      },
    );
  }
  Widget buildPage(AsyncSnapshot<Item> snapshot, BuildContext context){
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width/1.70,
      margin: EdgeInsets.only(top:20, bottom: 10),
      child: ListView.builder(
        itemCount: snapshot.data.results.length > 10 ? 10: snapshot.data.results.length,
        scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: (){
                if (widget.onItemInteraction != null){
                  widget.onItemInteraction(snapshot.data.results[index].id);
                }else{
                  print('no handle');
                }
              },
              child: buildElement(snapshot.data.results[index].poster_path, snapshot.data.results[index].backdrop_path, width/3.5 ,index == 0,  ),
            );
          }
      ),

    );

  }
  buildElement(String imagePath, String backdropPath, bool isFirst, double itemHeight){

    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      elevation: 10,
      margin: EdgeInsets.only(bottom: 20, right: 10, left: isFirst?20:10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Image.network('https://image.tmdb.org/t/p/w500$imagePath' ,fit: BoxFit.cover, width: itemHeight*1.5,height: itemHeight*0.5,),
    );
  }


}
