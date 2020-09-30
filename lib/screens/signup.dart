import 'package:flutter/material.dart';
import 'package:flutterapp/services/apiservices.dart';
import 'package:flutterapp/utility/my_style.dart';
import 'package:flutterapp/utility/normal_dialog.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String chooseType, name, user, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: <Color>[Colors.white, MyStyle().primaryColor],
            center: Alignment(0, -0.3),
            radius: 2.0,
          ),
        ),
        child: ListView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyStyle().showTitleH2('ชนิดของสมาชิก'),
              ],
            ),
            MyStyle().mySizedBox(),
            userWidgetRadio('User', chooseType, 'ผู้สั่งอาหาร'),
            userWidgetRadio('Shop', chooseType, 'เจ้าของร้านอาหาร'),
            userWidgetRadio('Rider', chooseType, 'ผู้สั่งอาหาร'),
            MyStyle().mySizedBox(),
            registerButton(),
          ],
        ),
      ),
    );
  }

  Widget registerButton() => Container(
        width: 250.0,
        child: RaisedButton(
          color: MyStyle().darkColor,
          onPressed: () {
            print(
                'name = $name, user = $user, password = $password, type = $chooseType');

            // if (name == null ||
            //     name.isEmpty ||
            //     user == null ||
            //     user.isEmpty ||
            //     password == null ||
            //     password.isEmpty)
            if ((name?.isEmpty ?? true) ||
                (user?.isEmpty ?? true) ||
                (password?.isEmpty ?? true)) {
              print('Have Space');
              normalDialog(context, 'Please Enter All Field');
            } else if (chooseType == null) {
              normalDialog(context, 'Please Select Type');
            } else {
              registerApi(context, user, password, name, chooseType);
            }
          },
          child: Text(
            'Register',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

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
                    chooseType = value;
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
              onChanged: (value) => name = value.trim(),
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
              onChanged: (value) => user = value.trim(),
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
              onChanged: (value) => password = value.trim(),
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
