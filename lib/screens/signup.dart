import 'package:flutter/material.dart';
import 'package:flutterapp/utility/my_style.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30.0),
        children: <Widget>[
          myLogo(),
          MyStyle().mySizedBox(),
          showAppName(),
          MyStyle().mySizedBox(),
          nameForm(),
          MyStyle().mySizedBox(),
          userForm(),
          MyStyle().mySizedBox(),
          passwordForm(),
          MyStyle().mySizedBox(),
          userWidgetRadio('User', chooseType, 'ผู้สั่งอาหาร'),
          userWidgetRadio('Shop', chooseType, 'เจ้าของร้านอาหาร'),
          userWidgetRadio('Rider', chooseType, 'ผู้สั่งอาหาร'),
        ],
      ),
    );
  }

  Widget userWidgetRadio(value, groupValue, text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: value,
                groupValue: groupValue,
                onChanged: (value) {
                  setState(() {
                    groupValue = value;
                  });
                },
              ),
              Text(
                text,
                style: TextStyle(color: MyStyle().darkColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget userRadio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 250.0,
          child: Row(
            children: <Widget>[
              Radio(
                value: 'User',
                groupValue: chooseType,
                onChanged: (value) {
                  setState(() {
                    chooseType = value;
                  });
                },
              ),
              Text(
                'ผู้สั่งอาหาร',
                style: TextStyle(color: MyStyle().darkColor),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget showAppName() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MyStyle().showTitle('Flutter App'),
      ],
    );
  }

  Widget myLogo() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyStyle().showLogo(),
        ],
      );

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Name : ',
                labelStyle: TextStyle(color: MyStyle().darkColor),
                prefixIcon: Icon(
                  Icons.face,
                  color: MyStyle().darkColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget userForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Username : ',
                labelStyle: TextStyle(color: MyStyle().darkColor),
                prefixIcon: Icon(
                  Icons.account_circle,
                  color: MyStyle().darkColor,
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().darkColor)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: MyStyle().primaryColor)),
              ),
            ),
          ),
        ],
      );

  Widget passwordForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          ),
        ],
      );
}
