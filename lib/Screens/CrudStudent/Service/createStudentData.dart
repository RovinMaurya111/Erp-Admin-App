// import 'dart:convert';
import 'package:admin/Screens/CrudStudent/Model/studentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';

Future<void> createStudentData(
  BuildContext context,
  String name,
  String phone,
  String dob,
  String adm,
  String father,
  String mother,
  String address,
  String email,
  String password,
  String roll,
) async {

  final url = Uri.parse("http://localhost:3000/students/class2/create");

  try {
    final studentdata = StudentModel( 
    name, 
    phone, 
    dob, 
    adm, 
    father, 
    mother, 
    address, 
    email, 
    password, 
    roll
    );
    http.Response response = await http.post(
      url,
      body: studentdata.toJson(),
      headers: {"Content-Type": "application/json"},
    );

    switch (response.statusCode) {
      case 200:
        MotionToast.success(description: Text(response.body)).show(context);
      case 400:
        MotionToast.success(description: Text(response.body)).show(context);
      case 409:
        MotionToast.success(description: Text(response.body)).show(context);
      case 500:
        MotionToast.success(description: Text(response.body)).show(context);
      default:
        MotionToast.success(description: Text(response.body)).show(context);
    }
  } catch (e) {
    print("Error: $e");
  }

}
