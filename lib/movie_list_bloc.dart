import 'package:movies_app/bloc_base.dart';
import 'package:movies_app/item.dart';
import 'package:rxdart/rxdart.dart';


class MovieListBloc extends BaseBloc<Item>{
  Observable <Item> get movielist => fetcher.stream;

  fetchMovieList(String type) async {
    Item item = await repo.fetchMovieList(type);
    fetcher.sink.add(item);
  }
}
final movieListBloc = MovieListBloc();
