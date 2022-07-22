import 'dart:developer';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/employee.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _designationController = TextEditingController();
  final _joiningdateController = TextEditingController();

  save() async {
    String name = _nameController.value.text;
    String username = _usernameController.value.text;
    String email = _emailController.value.text;
    String password = _passwordController.value.text;
    String designation = _designationController.value.text;
    var employee = EmployeeModel(
        name: name,
        username: username,
        email: email,
        password: password,
        designation: designation,
        joiningdate: selectedDate.toIso8601String());

    print(employee);

    signUp(employee).then((res) {
      print(res.body);
    });

    try {} catch (e) {
      log(e.toString());
      Fluttertoast.showToast(
          msg: "$e",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _joiningdateController.text = "${selectedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // backgroundColor: const Color(0xffC4DFCB),
        appBar: AppBar(
          title: Text("Employee Performance Tracker"),
        ),
        body: Form(
          child: ListView(
            children: [
              // Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     children: [
              //       new Image.asset("assets/images/sign_up.png")
              //     ]
              // ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Text(
                    "Registration Form",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.person_add,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Name",),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.supervisor_account_sharp,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Username"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.mark_email_read,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.password,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _designationController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.list_alt,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Designation"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _joiningdateController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Select Date"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),

                child: ElevatedButton(
                    onPressed: () {
                      save();
                    },
                    child: Text("submit")),
              ),
            ],
          ),
        ));
  }
}
