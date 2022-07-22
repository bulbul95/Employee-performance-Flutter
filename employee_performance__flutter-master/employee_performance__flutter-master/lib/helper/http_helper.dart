import 'dart:convert';

import 'package:emp_performance_tracker_flut/helper/constant.dart';
import 'package:emp_performance_tracker_flut/views/model/addEmployee.dart';
import 'package:emp_performance_tracker_flut/views/model/employee.dart';
import 'package:emp_performance_tracker_flut/views/model/employee_payload.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
};

Future<http.Response> signUp(EmployeeModel employee) async {
  final response = await http.post(Uri.parse(registerApi),
      headers: requestHeaders, body: jsonEncode(employee.toMap()));

  return response;
}

Future<http.Response> add(EmployeeAdd employee) async {
  final response = await http.post(Uri.parse(addEmployeeApi),
      headers: requestHeaders, body: jsonEncode(employee.toMap()));

  return response;
}

Future<http.Response> signIn(EmployeePayload employee) async {
  final response = await http.post(Uri.parse(loginApi),
      headers: requestHeaders, body: jsonEncode(employee.toMap()));
  return response;
}

Future<http.Response> getTotalInfo() async {
  final response =
      await http.get(Uri.parse(totalInfoApi), headers: requestHeaders);
  return response;
}

Future<http.Response> getEmployeeInfo() async {
  final response = await http.get(Uri.parse(employeeInformationApi),
      headers: requestHeaders);
  return response;
}

Future<http.Response> getEmployee() async {
  final response = await http.get(Uri.parse(getEmployeeApi), headers: requestHeaders);
  return response;
}

Future<http.Response> getLocation(int id) async {
  final response = await http.get(Uri.parse(getLocationApi+id.toString()), headers: requestHeaders);
  return response;
}