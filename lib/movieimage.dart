import 'package:movies_app/base.dart';
import 'package:movies_app/image.dart';

class MovieImage extends Base{
  int id;
  List <Image> posters =[];
  List <Image> backdrops =[];
  MovieImage.fromJson(Map <String,dynamic> parsedJson){
    id = parsedJson['id'];
    posters = Image.fromJsonArray(parsedJson['posters']);
    backdrops = Image.fromJsonArray(parsedJson['backdrops']);
  }

}
