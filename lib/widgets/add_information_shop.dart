import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterapp/utility/my_style.dart';
import 'package:flutterapp/utility/normal_dialog.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class AddInformationShop extends StatefulWidget {
  @override
  _AddInformationShopState createState() => _AddInformationShopState();
}

class _AddInformationShopState extends State<AddInformationShop> {
  // field
  double lat, lng;
  File file;
  String shopName, shopAddress, shopPhone;

  @override
  void initState() {
    super.initState();
    findLatLng();
  }

  Future<Null> findLatLng() async {
    LocationData locationData = await findLocationData();
    setState(() {
      lat = locationData.latitude;
      lng = locationData.longitude;
    });
    print('lat: $lat lng: $lng');
  }

  Future<LocationData> findLocationData() async {
    Location location = Location();
    try {
      return location.getLocation();
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Information Shop'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyStyle().mySizedBox(),
            nameForm(),
            MyStyle().mySizedBox(),
            addressForm(),
            MyStyle().mySizedBox(),
            phoneForm(),
            MyStyle().mySizedBox(),
            groupImage(),
            MyStyle().mySizedBox(),
            lat == null ? MyStyle().showProgress() : showMap(),
            MyStyle().mySizedBox(),
            saveButton(),
          ],
        ),
      ),
    );
  }

  void saveInformation() {
    print('name = $shopName, address = $shopAddress, phone = $shopPhone');
    print('lat = $lat, lng = $lng');
    print('image = $file');

    if ((shopName?.isEmpty ?? true) ||
        (shopAddress?.isEmpty ?? true) ||
        (shopPhone?.isEmpty ?? true)) {
      normalDialog(context, 'please fill all text');
    } else if (file == null) {
      normalDialog(context, 'please select image');
    } else {
      alertDialog(context, 'Save', 'do you want to save this data?');
    }
  }

  Widget saveButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80.0,
      child: RaisedButton.icon(
        color: MyStyle().primaryColor,
        onPressed: () {
          saveInformation();
        },
        icon: Icon(
          Icons.save,
          color: Colors.white,
        ),
        label: Text(
          'Save Information',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Set<Marker> myMarker() {
    return <Marker>[
      Marker(
        markerId: MarkerId('MyMarker'),
        position: LatLng(lat, lng),
        infoWindow: InfoWindow(
            title: 'MyMarker', snippet: 'ละติจูด = $lat, ลองติจูด = $lng'),
      )
    ].toSet();
  }

  Container showMap() {
    LatLng latLng = LatLng(lat, lng);
    CameraPosition cameraPosition = CameraPosition(
      target: latLng,
      zoom: 16.0,
    );

    return Container(
      height: 300.0,
      child: GoogleMap(
        initialCameraPosition: cameraPosition,
        mapType: MapType.normal,
        onMapCreated: (controller) {},
        markers: myMarker(),
      ),
    );
  }

  Widget groupImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: Icon(
              Icons.add_a_photo,
              size: 36.0,
            ),
            onPressed: () {
              chooseImage(ImageSource.camera);
            },
          ),
          Container(
            width: 250.0,
            child: file == null
                ? Image.asset('images/image_default.png')
                : Image.file(file),
          ),
          IconButton(
            icon: Icon(
              Icons.add_photo_alternate,
              size: 36.0,
            ),
            onPressed: () {
              chooseImage(ImageSource.gallery);
            },
          ),
        ],
      );

  Future<Null> chooseImage(ImageSource imageSource) async {
    try {
      var object = await ImagePicker.pickImage(
          source: imageSource, maxHeight: 800.0, maxWidth: 800.0);

      setState(() {
        file = object;
      });
    } catch (e) {}
  }

  Widget nameForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => shopName = value,
              decoration: InputDecoration(
                labelText: 'ชื่อร้านค้า',
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget addressForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => shopAddress = value,
              decoration: InputDecoration(
                labelText: 'ที่อยู่ร้านค้า',
                prefixIcon: Icon(Icons.home),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );

  Widget phoneForm() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 250.0,
            child: TextField(
              onChanged: (value) => shopPhone = value,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'เบอร์โทรศัพท์',
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      );
}
