import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/models/user_model.dart';
import 'package:flutterapp/screens/main_rider.dart';
import 'package:flutterapp/screens/main_shop.dart';
import 'package:flutterapp/screens/main_user.dart';
import 'package:flutterapp/utility/normal_dialog.dart';

String apiurl = 'http://developer.bangkokair.pg:16009';

Future<void> authenLoginApi(
    BuildContext context, String username, String password) async {
  String callurl =
      apiurl + '/api/Account/Login?username=$username&password=$password';

  try {
    Response response = await Dio().get(callurl);
    final body = json.decode(response.toString());
    final status = body['status'];
    final token = body['message'];

    UserModel userModel = UserModel.fromJson(body['result']);

    print('token: $token');
    print('username: ' + userModel.username);

    if (status == 'Completed') {
      if (userModel.type == 'R') {
        routeToService(context, MainRider());
      }
      else if (userModel.type == 'S') {
        routeToService(context, MainShop());
      }
      else {
        routeToService(context, MainUser());
      }
    } else {
      normalDialog(context, 'Username or password incorrect');
    }
  } catch (e) {}
}

void routeToService(BuildContext context, Widget myWidget) {

  

  MaterialPageRoute route = MaterialPageRoute(
    builder: (context) => myWidget,
  );
  Navigator.pushAndRemoveUntil(context, route, (route) => false);
}

Future<Null> registerApi(BuildContext context, String username, String password,
    String email, String chooseType) async {
  String callurl = apiurl +
      '/api/User/Add?username=$username&password=$password&email=$email&type=$chooseType';

  try {
    Response response = await Dio().post(callurl);
    final body = json.decode(response.toString());
    final status = body['status'];

    print('res = $response');
    if (status == 'Completed') {
      Navigator.pop(context);
    } else {
      normalDialog(context, 'Can\'t Register please try again');
    }
  } catch (e) {}
}
