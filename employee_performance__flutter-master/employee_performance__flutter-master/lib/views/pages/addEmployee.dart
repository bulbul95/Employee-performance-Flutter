import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/views/model/addEmployee.dart';
import 'package:emp_performance_tracker_flut/views/pages/dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEmployeePage extends StatefulWidget {
  const AddEmployeePage({Key? key}) : super(key: key);

  @override
  _AddEmployeePageState createState() => _AddEmployeePageState();
}

class _AddEmployeePageState extends State<AddEmployeePage> {
  bool _value = false;
  int val = -1;

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _genderController = TextEditingController();
  final _qualificationController = TextEditingController();
  final _departmentController = TextEditingController();
  final _dateOfBirthController = TextEditingController();
  final _nationalityController = TextEditingController();
  final _empHistoryController = TextEditingController();

  save() async {
    String firstname = _firstNameController.value.text;
    String lastname = _lastNameController.value.text;
    String email = _emailController.value.text;
    String gender = _genderController.value.text;
    String qualification = _qualificationController.value.text;
    String department = _departmentController.value.text;
    String date_of_birth = _dateOfBirthController.value.text;
    String nationality = _nationalityController.value.text;
    String employeementHistory = _empHistoryController.value.text;

    var employees = EmployeeAdd(
      id:0,
        firstname: firstname,
        lastname: lastname,
        email: email,
        gender: gender,
        qualification: qualification,
        department: department,
        date_of_birth: date_of_birth,
        nationality: nationality,
        employeementHistory: employeementHistory);

    print(employees);

    add(employees).then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);

      print(map['statusCode']);

      if (map['statusCode'] == 200) {
        Fluttertoast.showToast(
            msg: "Employee Added Success",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Employee add Failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });


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
        _dateOfBirthController.text = "${selectedDate.toLocal()}".split(' ')[0];
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
                padding: const EdgeInsets.only(top: 12.0, right: 40, left: 40),
                child: Center(
                  child: Text(
                    "Employee Add",
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
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person_add,
                      size: 20.0,
                    ),
                    border: UnderlineInputBorder(),
                    labelText: "Firstname",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.supervisor_account_sharp,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Lastname"),
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
              SizedBox(
                height: 20,
              ),
              Text("       Gender"),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),

                child: Column(
                  children: [
                    ListTile(
                      title: Text("Male"),
                      leading: Radio(
                        value: 1,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = int.parse(value.toString());
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                    ListTile(
                      title: Text("Female"),
                      leading: Radio(
                        value: 2,
                        groupValue: val,
                        onChanged: (value) {
                          setState(() {
                            val = int.parse(value.toString());
                          });
                        },
                        activeColor: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _qualificationController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.list_alt,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "qualification"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _departmentController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.list_alt,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Department"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _dateOfBirthController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _selectDate(context),
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Date of Birth"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _nationalityController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.list_alt,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Nationality"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30, top: 8),
                child: TextFormField(
                  controller: _empHistoryController,
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.list_alt,
                        size: 20.0,
                      ),
                      border: UnderlineInputBorder(),
                      labelText: "Employeement History"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(
                    onPressed: () {
                      save();
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Dashboard()));
                    },
                    child: Text("submit")),
              ),
            ],
          ),
        ));
  }
}
