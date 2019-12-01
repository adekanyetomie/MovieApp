import 'package:movies_app/base.dart';
import 'package:movies_app/collection.dart';
import 'package:movies_app/genre.dart';

class Detail extends Base{
  int id;
  String title;
  int runtime;
  String homepage;
  String imdb_id;
  String overview;
  String popularity;
  Collection in_a_collection;
  List <Genre> genres = [];
  String backdrop_path;
  String poster_path;
  String release_date;

}
