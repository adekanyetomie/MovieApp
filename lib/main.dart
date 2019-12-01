import 'package:flutter/material.dart';
import 'package:movies_app/views/home.dart';

void main() => runApp(MovieApp());

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: 'Movies',
      home: Home(),
    );
  }
}
