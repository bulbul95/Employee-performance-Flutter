import 'dart:convert';
import 'dart:math';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/emoployee_rating.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';

class ChartApp extends StatefulWidget {
  const ChartApp({Key? key}) : super(key: key);

  @override
  State<ChartApp> createState() => _ChartAppState();
}

class _ChartAppState extends State<ChartApp> {
  List<EmployeeRating> employeeRatings = [];
  List<_SalesData> data = [];
  @override
  void initState() {
    getEmployeeInfo().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);
      // print("asdfasdfadsf");
      //print(map);

      var list = map['Data'] as List<dynamic>;

      employeeRatings = list.map((e) => EmployeeRating.fromMap(e)).toList();

      for (int i = 0; i <= employeeRatings.length - 1; i++) {
        EmployeeRating empr = employeeRatings[i];
        int scors = empr.requirUnderstandingScore +
            empr.regardingTrainingScore +
            empr.equiSoftHandleScore +
            empr.rulsPolicyFolloScore +
            empr.knoledgeShareWithCoworkersScore +
            empr.coworkersTreatedRespectScore +
            empr.acceptsCriticismScore +
            empr.teamPlayerScore +
            empr.teameResourcesShareScore +
            empr.executesTaskScore +
            empr.acceptsMistakeScore +
            empr.canWorkWithoutSuperviseScore +
            empr.capableTakingAnyDecisionScore +
            empr.highPressureSiruationManageScore +
            empr.motivateCoworkersToFinishScore;
        data.add(_SalesData(empr.firstname, double.parse(scors.toString())));
        print(empr.requirUnderstandingScore);
      }
      setState(() {});
      // print(scors);
      // print(employeeRatings);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chart"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: 600,
            child: SfCartesianChart(

                primaryXAxis: CategoryAxis(),
                // Chart title
                title: ChartTitle(
                    text: 'Employee Performance Ratings   ',
                    textStyle: TextStyle(fontSize: 20)),
                // Enable legend

                legend: Legend(isVisible: true),
                // Enable tooltip
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<_SalesData, String>>[
                  LineSeries<_SalesData, String>(
                      dataSource: data,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'Scores',
                      // Enable data label
                      dataLabelSettings: DataLabelSettings(isVisible: true))
                ]),
          ),
        ));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);
  final String year;
  final double sales;
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}
