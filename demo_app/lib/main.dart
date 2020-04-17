import 'package:demo_app/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "lockedylockock",
      theme: new ThemeData(
        primarySwatch: Colors.deepOrange
      ),
      home: new LoginPage()
    );
  }

}