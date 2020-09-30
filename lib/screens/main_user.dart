import 'package:flutter/material.dart';
import 'package:flutterapp/utility/account_process.dart';
import 'package:flutterapp/utility/my_style.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String username;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    String getUser = await getLoginUser();
    setState(() {
      username = getUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(username == null ? 'Main User' : 'Welcome  $username'),
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
      decoration: MyStyle().myBoxDecoration('user.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('$username'),
      accountEmail: Text('Welcome $username'),
    );
  }
}
