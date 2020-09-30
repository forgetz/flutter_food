import 'package:flutter/material.dart';
import 'package:flutterapp/utility/account_process.dart';
import 'package:flutterapp/utility/my_style.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  String username;

  @override
  void initState() {
    super.initState();
    getUser();
  }
  Future<void> getUser() async {
    String user = await getLoginUser();
    setState(() {
      username = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username == null ? 'Main Shop' : 'Welcome ' + username),
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app), onPressed: () => signOut(context))
        ],
      ),
      drawer: showDrawer(),
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[showHeadDrawer(), signUpMenu()],
        ),
      );

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Logout'),
      onTap: () {
        signOut(context);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('$username', style: TextStyle(color: MyStyle().darkColor),),
      accountEmail: Text('Welcome $username'),
    );
  }
}
