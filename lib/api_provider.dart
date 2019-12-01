import 'dart:async';
import 'dart:convert';
import 'package:movies_app/item.dart';
import 'package:movies_app/detail.dart';
import 'package:movies_app/image.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart' show Client;

class ApiProvider{
  Client client = Client();
  final apikey = '08c65e2bf9f790fa4cd81ced80a0edbd';
  
  Future <Item> fetchMovieList(String type) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$type?api_key=$apikey');
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200){
      return Item.fromJson(json.decode(response.body));
    }else{
      throw Exception('something went wrong');
    }
  }
  Future <Image> fetchMovieImages(int movieId) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$movieId/imaages?api_key=$apikey');
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200){
      return Image.fromJson(json.decode(response.body));
    }else{
      throw Exception('something went wrong');
    }
  }
  Future <Detail> fetchMovieDetails(int movieId) async {
    final response = await client.get('https://api.themoviedb.org/3/movie/$movieId?api_key=$apikey');
    print(response.request.url);
    print(response.body.toString());
    if (response.statusCode == 200){
      return Detail.fromJson(json.decode(response.body));
    }else{
      throw Exception('something went wrong');
    }
  }
  
}