import 'package:flutter/material.dart';
import 'package:flutterapp/utility/account_process.dart';
import 'package:flutterapp/utility/my_style.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
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
    print('username = $username');

    return Scaffold(
      appBar: AppBar(
        title: Text(username == null ? 'Main R' : 'Welcome  $username'),
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
      decoration: MyStyle().myBoxDecoration('rider.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text('$username'),
      accountEmail: Text('Welcome $username'),
    );
  }
  
}
