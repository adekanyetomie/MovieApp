import 'package:movies_app/item.dart';
import 'package:movies_app/detail.dart';
import 'package:movies_app/api_provider.dart';
import 'dart:async';
import 'package:movies_app/movieimage.dart';

class Repository{
  final apiProvider = ApiProvider();

  Future <Item> fetchMovieList(String type) => apiProvider.fetchMovieList(type);
  Future <MovieImage> fetchMovieImages(int movieId) => apiProvider.fetchMovieImages(movieId);
  Future <Detail> fetchMovieDetail(int movieId) => apiProvider.fetchMovieDetails(movieId);
}
