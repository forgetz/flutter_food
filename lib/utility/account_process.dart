import 'package:flutter/material.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOut(BuildContext context) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.clear();

  MaterialPageRoute route = MaterialPageRoute(builder: (context) => Home());
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<void> saveUserModel(UserModel user) async {
  print('saveLoginUser ' + user.username);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('username', user.username);
  preferences.setString('type', user.type);
}

Future<String> getLoginUser() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String username = preferences.getString('username');
  return username;
}
