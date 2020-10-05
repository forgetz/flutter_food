import 'package:flutter/material.dart';
import 'package:flutterapp/utility/account_process.dart';
import 'package:flutterapp/utility/my_style.dart';
import 'package:flutterapp/widgets/information_shop.dart';
import 'package:flutterapp/widgets/list_food_menu_shop.dart';
import 'package:flutterapp/widgets/order_list_shop.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  String username;

  // field
  Widget currentWidget = OrderListShop();

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
      body: currentWidget,
    );
  }

  Drawer showDrawer() => Drawer(
        child: ListView(
          children: <Widget>[
            showHeadDrawer(),
            homeMenu(),
            foodMenu(),
            infoMenu(),
            signUpMenu(),
          ],
        ),
      );

  ListTile homeMenu() => ListTile(
        leading: Icon(Icons.home),
        title: Text('Lasted Order'),
        subtitle: Text('รายการอาหารที่ยังไม่ได้ส่งลูกค้า'),
        onTap: () {
          setState(() {
            currentWidget = OrderListShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile foodMenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: Text('Menu List'),
        subtitle: Text('รายการอาหารของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = ListFoodMenu();
          });
          Navigator.pop(context);
        },
      );
  ListTile infoMenu() => ListTile(
        leading: Icon(Icons.info),
        title: Text('Shop Information'),
        subtitle: Text('รายละเอียดของร้าน'),
        onTap: () {
          setState(() {
            currentWidget = InformationShop();
          });
          Navigator.pop(context);
        },
      );

  ListTile signUpMenu() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text('Sign Out'),
      subtitle: Text('ออกจากระบบ'),
      onTap: () {
        signOut(context);
      },
    );
  }

  UserAccountsDrawerHeader showHeadDrawer() {
    return UserAccountsDrawerHeader(
      decoration: MyStyle().myBoxDecoration('shop.jpg'),
      currentAccountPicture: MyStyle().showLogo(),
      accountName: Text(
        '$username',
        style: TextStyle(color: MyStyle().darkColor),
      ),
      accountEmail: Text('Welcome $username'),
    );
  }
}
