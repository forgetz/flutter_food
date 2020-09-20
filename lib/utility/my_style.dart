import 'package:flutter/material.dart';

class MyStyle {
  Color darkColor = Colors.blue.shade900;
  Color primaryColor = Colors.green;

  Text showTitle(String title) => Text(
        title,
        style: TextStyle(
            fontSize: 24.0, color: darkColor, fontWeight: FontWeight.bold),
      );

  SizedBox mySizedBox() => SizedBox(
        width: 8.0,
        height: 16.0,
      );

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('images/flutter_logo.png'),
    );
  }

  MyStyle();
}
