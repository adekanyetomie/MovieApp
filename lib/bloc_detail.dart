import 'package:movies_app/bloc_base.dart';
import 'package:movies_app/item.dart';
import 'package:movies_app/detail.dart';
import 'package:rxdart/rxdart.dart';


class DetailBloc extends BaseBloc<Detail>{
  Observable <Item> get moviedetail => fetcher.stream;

  fetchMovieList(int movieId) async {
    Detail item = await repo.fetchMovieDetail(movieId);
    fetcher.sink.add(item);
  }
}
final movieDetailBloc = DetailBloc() ;