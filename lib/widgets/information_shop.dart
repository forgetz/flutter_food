import 'package:flutter/material.dart';
import 'package:flutterapp/utility/my_style.dart';
import 'package:flutterapp/widgets/add_information_shop.dart';

class InformationShop extends StatefulWidget {
  @override
  _InformationShopState createState() => _InformationShopState();
}

class _InformationShopState extends State<InformationShop> {
  void routeToAddInfo() {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => AddInformationShop(),
    );
    Navigator.push(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MyStyle().titleCenter(context, 'ยังไม่มีข้อมูล กรุณาเพิ่มข้อมูล'),
        addEditButton(),
      ],
    );
  }

  Widget addEditButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: FloatingActionButton(
                child: Icon(Icons.edit),
                onPressed: () => routeToAddInfo(),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
