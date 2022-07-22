import 'dart:async';
import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/addEmployee.dart';
import 'package:emp_performance_tracker_flut/views/model/location.dart';
import 'package:emp_performance_tracker_flut/views/pages/dashbord.dart';
import 'package:emp_performance_tracker_flut/views/pages/enddrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'mapDrawer.dart';

class GoogleMapPage extends StatefulWidget {
  const GoogleMapPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapPage> createState() => _GoogleMapPageState();
}

class _GoogleMapPageState extends State<GoogleMapPage> {
  List<EmployeeAdd> list = [];
  List<Location> locationList = [];
static  double latitude = 23.77464;
  static double longitude = 90.36527;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition initialPosition = CameraPosition(
    target: LatLng(latitude, longitude),
    zoom: 14.4746,
  );

  static  CameraPosition empPostion = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);


  @override
  void initState() {
    getEmployee().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      var data = map['data'] as List<dynamic>;

      list = data.map((e) => EmployeeAdd.fromMap(e)).toList();
      print(list);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SafeArea(
        child: Drawer(
          child: ListView(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 15.0),
                child: Text(
                  "Employee list",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              for (int i = 0; i < list.length; i++)
                ListTile(
                  leading: Icon(Icons.arrow_back),
                  title:
                      Text(list[i].firstname, style: TextStyle(fontSize: 18)),
                  onTap: () {
                    getLocation(list[i].id).then((res) {
                      Map<String, dynamic> map = jsonDecode(res.body);
                      var data = map['data'] as List<dynamic>;
                      locationList =
                          data.map((e) => Location.fromMap(e)).toList();
                      latitude = locationList[0].latitude;
                      longitude = locationList[0].longitude;
                      print(locationList);
                      empPostion = CameraPosition(
                          bearing: 192.8334901395799,
                          target: LatLng(latitude, longitude),
                          tilt: 59.440717697143555,
                          zoom: 19.151926040649414);
                      Navigator.pop(context);
                      gotoEmpPostion();


                    });
                  },
                ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(latitude, longitude),
          zoom: 19,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

      ),
    );
  }
  Future<void> gotoEmpPostion() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(empPostion));
  }
}
