import 'package:flutter/material.dart';
import 'package:flutterapp/screens/signIn.dart';
import 'package:flutterapp/screens/signup.dart';
import 'package:flutterapp/utility/my_style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'main_rider.dart';
import 'main_shop.dart';
import 'main_user.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    checkPreferences();
  }

  Future<Null> checkPreferences() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      String type = preferences.getString('type');
      if (type == 'U') {
        routeToServices(MainUser());
      } else if (type == 'S') {
        routeToServices(MainShop());
      } else if (type == 'R') {
        routeToServices(MainRider());
      }
    } catch (e) {}
  }

  void routeToServices(Widget widget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => widget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHeadDrawer(), signInMenu(), signUpMenu()],
        ),
      );

  ListTile signInMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign In'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.android),
      title: Text('Sign Up'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
        decoration: MyStyle().myBoxDecoration('guest.jpg'),
        currentAccountPicture: MyStyle().showLogo(),
        accountName: Text('Guest'),
        accountEmail: Text('Please Login'));
  }
}
