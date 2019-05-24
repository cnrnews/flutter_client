import 'package:flutter/material.dart';
import 'package:app/pages/splash_welcome.dart';

void main() {
  runApp(Main());
}
class Main extends StatefulWidget {
  _MainState createState() => _MainState();
}
class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false, 
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SplashPage(),
    );
  }
}
