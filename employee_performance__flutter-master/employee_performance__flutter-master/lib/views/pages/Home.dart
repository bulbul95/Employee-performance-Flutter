import 'dart:math';

import 'package:emp_performance_tracker_flut/ui/style.dart';
import 'package:emp_performance_tracker_flut/utils/time_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home(this.time, {Key? key}) : super(key: key);
  TimeModel time;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              //   BoxShadow(
              //       color: AppStyle.primaryColor.withAlpha(80),
              //       blurRadius: 50.0),
              // ]),
              // height: 300.0,
              // width: 300.0,
              // child: CustomPaint(
              //   painter: ClockPainter(widget.time),
              // ),

               height: 180,
               width: double.infinity,
               //color: Colors.black12,
               alignment: Alignment.center,
               margin: EdgeInsets.only(top: 20),
               padding: EdgeInsets.only(right:12,left: 12),
              // transform: Matrix4.rotationZ(0.1),
               child:   Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     new Image.asset("assets/images/offic.jpg")
                   ]
               ),
            ),
            Container(
              height: 270,
              width: double.infinity,
              //color: Colors.black12,
              alignment: Alignment.center,
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(right: 12, left: 12),
              //transform: Matrix4.rotationZ(0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [new Image.asset("assets/images/employee.jpg")]),
            ),
            Container(
              height: 300,
              width: double.infinity,
              //color: Colors.black12,
              alignment: Alignment.center,
              //margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.only(right: 12, left: 12),
              //transform: Matrix4.rotationZ(0.1),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [new Image.asset("assets/images/o.jpg")]),
            ),
          ],
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  TimeModel? time;

  ClockPainter(this.time);

  @override
  void paint(Canvas canvas, Size size) {
    double secRad = ((pi / 2) - (pi / 30) * this.time!.sec!) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * this.time!.min!) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * this.time!.hour!) % (2 * pi);

    // TODO: implement paint
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var secHight = radius / 2;
    var minHight = radius / 2 - 10;
    var hourHight = radius / 2 - 25;

    var seconds = Offset(
        centerX + secHight * cos(secRad), centerY - secHight * sin(secRad));

    var mintues = Offset(
        centerX + minHight * cos(minRad), centerY - minHight * sin(minRad));

    var hours = Offset(
        centerX + hourHight * cos(hourRad), centerY - hourHight * sin(hourRad));

    var fillBrush = Paint()
      ..color = Colors.indigo.shade400
      ..strokeCap = StrokeCap.round;

    var centerDotBrush = Paint()..color = Color(0xFFEAECFF);
    canvas.drawCircle(center, radius - 40, fillBrush);

    var secBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3
      ..strokeJoin = StrokeJoin.round;
    var hourBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..strokeJoin = StrokeJoin.round;
    //
    canvas.drawCircle(center, 16, centerDotBrush);
    canvas.drawLine(center, seconds, secBrush);
    canvas.drawLine(center, mintues, minBrush);
    canvas.drawLine(center, hours, hourBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
