import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/assets/main.jpg'),
        centerTitle: true,
        backgroundColor: Colors.white70,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white70,
      ),
    );
  }
}
