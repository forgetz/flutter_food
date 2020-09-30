import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';

void main() {
  runApp(MyApp());
}


// main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    print('run main.dart');

    return MaterialApp(
      title: 'Flutter App',
      home: Home(),
    );
  }
}