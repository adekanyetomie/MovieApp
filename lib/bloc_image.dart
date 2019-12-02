import 'package:movies_app/bloc_base.dart';
import 'package:rxdart/rxdart.dart';
import 'package:movies_app/movieimage.dart';



class ImageBloc extends BaseBloc<MovieImage>{
  Observable <MovieImage> get movieimage => fetcher.stream;

  fetchMovieImages(int movieId) async {
    MovieImage item = await repo.fetchMovieImages(movieId);
    fetcher.sink.add(item);
  }
}
final imageBloc = ImageBloc() ;