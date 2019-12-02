import 'package:movies_app/base.dart';
import 'package:movies_app/repository.dart';
import 'package:rxdart/rxdart.dart';

abstract class BaseBloc<T extends Base>{
  final repo = Repository();
  final fetcher = PublishSubject();

  dispose(){
    fetcher.close();
  }
}