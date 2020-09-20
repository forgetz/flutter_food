import 'package:flutter/material.dart';
import 'package:flutterapp/utility/my_style.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColor],
            center: Alignment(0, -0.3),
            radius: 2.0,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                MyStyle().showLogo(),
                MyStyle().mySizedBox(),
                MyStyle().showTitle('Flutter App'),
                MyStyle().mySizedBox(),
                userForm(),
                MyStyle().mySizedBox(),
                passwordForm(),
                MyStyle().mySizedBox(),
                loginButton(),
                MyStyle().mySizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {},
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

  Widget userForm() => Container(
        width: 250.0,
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Username : ',
            labelStyle: TextStyle(color: MyStyle().darkColor),
            prefixIcon: Icon(
              Icons.account_box,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );

  Widget passwordForm() => Container(
        width: 250.0,
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password : ',
            labelStyle: TextStyle(color: MyStyle().darkColor),
            prefixIcon: Icon(
              Icons.lock,
              color: MyStyle().darkColor,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().darkColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: MyStyle().primaryColor)),
          ),
        ),
      );
}
