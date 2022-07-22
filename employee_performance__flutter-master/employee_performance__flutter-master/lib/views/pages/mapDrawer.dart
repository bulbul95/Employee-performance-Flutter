import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/constant.dart';
import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/addEmployee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'dashbord.dart';

class LocationDrawer extends StatefulWidget {
  const LocationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationDrawer> createState() => _LocationDrawerState();
}

class _LocationDrawerState extends State<LocationDrawer> {
  var emp = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                "Employee list",
                style: TextStyle(fontSize: 18),
              ),
            ),
            ListTile(
              leading: Icon(Icons.arrow_back),
             title: Text('Back', style: TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
