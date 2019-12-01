import 'package:movies_app/base.dart';
import 'package:movies_app/collection.dart';
import 'package:movies_app/company.dart';
import 'package:movies_app/country.dart';
import 'package:movies_app/genre.dart';
import 'package:movies_app/language.dart';

class Detail extends Base{
  int id;
  int runtime;
  int vote_count;
  double vote_average;
  String title;
  String homepage;
  String imdb_id;
  String overview;
  String popularity;
  String backdrop_path;
  String poster_path;
  String release_date;
  String status;
  String tagline;
  bool video;
  Collection collection;
  List <Genre> genres = [];
  List <Company> company = [];
  List <Country> country = [];
  List <Language> language = [];

  Detail.fromJson(Map <String, dynamic> parsedJson){
    id = parsedJson['id'];
    runtime =  parsedJson['runtime'];
    vote_count =  parsedJson['vote_count'];
    vote_average =  parsedJson['vote_average'];
    title =  parsedJson['title'];
    homepage =  parsedJson['homepage'];
    imdb_id =  parsedJson['imdb_id'];
    overview = parsedJson['overview'];
    popularity =  parsedJson['popularity'];
    backdrop_path =  parsedJson['backdrop_path'];
    poster_path =  parsedJson['poster_path'];
    release_date =  parsedJson['release_date'];
    status =  parsedJson['status'];
    tagline =  parsedJson['tagline'];
    video =  parsedJson['video'];
    collection = Collection.fromJson(parsedJson['collection']);
    genres = Genre.fromJsonArray(parsedJson['genres']);
    company = Company.fromJsonArray(parsedJson['company']);
    country = Country.fromJsonArray(parsedJson['country']);
    language = Language.fromJsonArray(parsedJson['language']);

  }

}
