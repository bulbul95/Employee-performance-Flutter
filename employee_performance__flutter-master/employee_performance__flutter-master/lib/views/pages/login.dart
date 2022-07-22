import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/http_helper.dart';
import 'package:emp_performance_tracker_flut/main.dart';
import 'package:emp_performance_tracker_flut/views/model/employee_payload.dart';
import 'package:emp_performance_tracker_flut/views/pages/dashbord.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  login() async {
    String email = _emailController.value.text;
    String password = _passwordController.value.text;
    var employee = EmployeePayload(email: email, password: password);
    print(employee);

    signIn(employee).then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);

      print(map['status']);
      if (map['status'] == 'Success') {
        Fluttertoast.showToast(
            msg: "Login Sucsess",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        Fluttertoast.showToast(
            msg: "Login Failed",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  @override
  void initState() {
    getTotalInfo().then((res) {
      Map<String, dynamic> map = jsonDecode(res.body);

      setState(() {
        // Dashboard();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        // backgroundColor: const Color(0xffC4DFCB),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     color: Colors.white,
        //     onPressed: (){
        //       Navigator.of(context).push(MaterialPageRoute(
        //           builder: (context) => MyApp()));
        //     },
        //   ),
        //   title: Text("Employee Performance Tracker"),
        // ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [new Image.asset("assets/images/login.jpg")]),
                const Padding(
                  padding: EdgeInsets.only(bottom: 3),
                  child: Text(
                    "Login Here",
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.mark_email_read,
                          size: 20.0,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: "Enter your Email"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, right: 60),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.password_outlined,
                          size: 20.0,
                        ),
                        border: UnderlineInputBorder(),
                        labelText: "Enter your Password"),
                  ),
                ),

                // TextButton(
                //   onPressed: () {
                //     //forgot password screen
                //   },
                //   child: const Text('Forgot Password'),
                // ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      login();
                      print(_emailController.value.text);
                    },
                    child: Text("Login")),
                Padding(
                  padding: const EdgeInsets.only(left: 60.0,),
                  child: Row(
                    children: [
                      Text('Does not have account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegistrationPage()));
                          },
                          child: Text("registration here")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
