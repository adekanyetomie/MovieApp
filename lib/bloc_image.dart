import 'package:movies_app/bloc_base.dart';
import 'package:movies_app/item.dart';
import 'package:movies_app/image.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movies_app/movieimage.dart';



class ImageBloc extends BaseBloc<MovieImage>{
  Observable <Item> get movieimage => fetcher.stream;

  fetchMovieList(int movieId) async {
    MovieImage item = await repo.fetchMovieImages(movieId);
    fetcher.sink.add(item);
  }
}
final imageBloc = ImageBloc() ;