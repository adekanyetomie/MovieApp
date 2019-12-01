import 'dart:core';
import 'package:flutter/material.dart';
import 'package:movies_app/base.dart';

 class Item extends Base{
   int page;
   int total_pages;
   int total_result;
   List < Result > results = [];
   List < Result > temp = [];



   Item.fromJson(Map <String, dynamic> parsedJson){
     print(parsedJson['results'].length);
     page = parsedJson['page'];
     total_result = parsedJson['total_results'];
     total_pages = parsedJson['total_pages'];
     //List < Result > = temp [];

     for (int i = 0; i <parsedJson['results'].length; i++ ){
       Result result  = Result(parsedJson['results'][i]);
       temp.add(result);
     }
     results = temp;
   }
   //List < Result > get results => results;
   //int get total_pages => total_pages;
   //int get total_result => total_result;
   //int get page => page;


 }
class Result{
  int id;
  String title;
  bool video;
  String release_date;
  String overview;
  int vote_count;
  double popularity;
  String poster_path;
  List < int > genre_ids = [];
  String backdrop_path;

  Result(result){
    id = result['id'];
    title = result['title'];
    video = result['video'];
    release_date = result[' release_date'];
    overview = result['overview'];
    vote_count = result['vote_count'];
    popularity = result['popularity'];
    poster_path = result['poster_path'];
    backdrop_path = result['backdrop_path '];

    for (int i =0; i< result['genre_ids'][i]; i++ ){
      genre_ids.add(result['genre_ids'][i]);
    }
  }


}
