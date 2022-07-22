import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'GoogleMapPage.dart';
import 'addEmployee.dart';
import 'chart.dart';

import 'login.dart';

class enddrawer extends StatelessWidget {
  const enddrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[

          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/r.jpg',
                  ),
                  radius: 50.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Bulbul Akter',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25.0
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text('bulbulakter@gmail.com',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14.0
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage()));

            },
          ),

          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.add_chart_sharp),
            title: Text('Charts', style: TextStyle(fontSize: 18)),
            onTap: () {
              // Here you can give your route to navigate
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ChartApp()));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('location', style: TextStyle(fontSize: 18)),
            onTap: () {
              // Here you can give your route to navigate
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GoogleMapPage()));
            },
          ),


          ListTile(
            leading: Icon(Icons.add_task_outlined),
            title: Text('Add Employee', style: TextStyle(fontSize: 18)),
            onTap: () {
              // Here you can give your route to navigate
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddEmployeePage()));
            },
          ),

          Divider(height: 3.0),
          ListTile(
            leading: Icon(Icons.fact_check_outlined),
            title: Text('All Employees', style: TextStyle(fontSize: 18)),
            onTap: () {
              // Here you can give your route to navigate

            },
          ),


          ListTile(
            leading: Icon(Icons.close),
            title: Text('Close Drawer', style: TextStyle(fontSize: 18)),
            onTap: () {
              // Here you can give your route to navigate
              Navigator.of(context).pop();
            },
          ),

          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout', style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage()));

            },
          ),


        ],
      ),
    );
  }
}