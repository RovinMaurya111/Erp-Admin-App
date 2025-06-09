
import 'package:admin/Features/CrudStudent/Model/studentModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:http_parser/http_parser.dart';

class CrudStudent{
  // 
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
  Map<String, dynamic> imagedata,
) async {

  final url = Uri.parse("http://localhost:3000/students/class2/create");

  try {
    final studentModel = StudentModel( 
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
    // 
    // 

    final request = http.MultipartRequest('POST', url);


    request.fields['studentData'] = studentModel.toJson();


    request.files.add(http.MultipartFile.fromBytes(
      'Profile_image', 
      imagedata['bytes'], 
      filename: imagedata['originalname'], 
      contentType: MediaType('image', 'jpeg')
    ));
    
    final result = await request.send();
    final response = await result.stream.bytesToString();

    switch (result.statusCode) {
      case 200:
        MotionToast.success(description: Text(response)).show(context);
      case 400:
        MotionToast.success(description: Text(response)).show(context);
      case 409:
        MotionToast.success(description: Text(response)).show(context);
      case 500:
        MotionToast.success(description: Text(response)).show(context);
      default:
        MotionToast.success(description: Text(response)).show(context);
    }
  } catch (e) {
    print("Error: $e");
  }

}

  // 
}