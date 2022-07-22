import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/total_info.dart';
import 'package:emp_performance_tracker_flut/views/pages/login.dart';

import 'package:flutter/material.dart';

import '../../main.dart';
import 'Home.dart';
import 'drawer.dart';
import 'enddrawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
   TotalInfo info = TotalInfo(
       noFeedbackCount: 0,
     totalEmployeeCount: 0,
     totalFeedbackCount: 0
   );

  @override
  void initState() {
    getTotalInfo().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);

      setState(() {
        info = TotalInfo.fromMap(map['data']);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: enddrawer(),
      //backgroundColor: const Color(0xffC4DFCB),

      appBar: AppBar(

        title: const Text("Employee details"),
      ),
      body: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
           children: [
            // const Center(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: 15.0),
            //     child: Text(
            //       "Employee details ",
            //       style: TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.indigo),
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 30.0,
                semanticContainer: true,
                shadowColor: Colors.blue,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        title: Text('Total Employee',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        info.totalEmployeeCount.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 38),
                      ),
                    ),
                    Image.asset(
                      'assets/images/employees.jpg',
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
              child: Card(
                // color: Colors.blueGrey,
                elevation: 30.0,
                shadowColor: Colors.blue,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        title: Text('Total feedback submitted',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        info.totalFeedbackCount.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 38),
                      ),
                    ),
                    Image.asset(
                      'assets/images/d.png',

                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0,right: 20,bottom: 20),
              child: Card(
                //color: Colors.purple,
                elevation: 30.0,
                shadowColor: Colors.blue,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                        title: Text('Total no feedback count',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: 20))),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 3.0),
                      child: Text(
                        info.noFeedbackCount.toString(),
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.6), fontSize: 38),
                      ),
                    ),
                    Image.asset(
                      'assets/images/noFeedback.jpg',
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: Card(
            //       elevation: 20,
            //       clipBehavior: Clip.antiAlias,
            //       child: Column(children: [
            //         Image.asset(
            //           'assets/images/offic.jpg',
            //         ),
            //         // ListTile(
            //         //   leading: Icon(Icons.arrow_drop_down_circle),
            //         //   title: const Text('Card title 1'),
            //         //   subtitle: Text(
            //         //     'Secondary Text',
            //         //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         //   ),
            //         // ),
            //         // Padding(
            //         //   padding: const EdgeInsets.all(16.0),
            //         //   child: Text(
            //         //     'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
            //         //     style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //         //   ),
            //         // ),
            //       ])),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Card(
            //     semanticContainer: true,
            //     clipBehavior: Clip.antiAliasWithSaveLayer,
            //     child: Image.network(
            //       'https://placeimg.com/640/480/any',
            //       fit: BoxFit.fill,
            //     ),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     elevation: 5,
            //     margin: EdgeInsets.all(10),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

