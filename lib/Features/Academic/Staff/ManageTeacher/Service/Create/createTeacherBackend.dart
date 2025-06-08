
import 'package:admin/Screens/Academic/ManageTeacher/Model/TeachersModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:motion_toast/motion_toast.dart';
import 'package:http_parser/http_parser.dart';

class CreateteachersBackend {
  //   
  BuildContext context;
  String name;
  String subject;
  String qualification;
  String email;
  String classteacher;
  String wichclass;
  String gender;
  String contact;
  String parents;
  String dob;
  String dateOfJoining;
  String experience;
  String address;
  String password;
  Map<String, dynamic> imagedata;
  // 
  CreateteachersBackend({
    required this.context,
    required this.name,
    required this.subject,
    required this.qualification,
    required this.email,
    required this.classteacher,
    required this.wichclass,
    required this.gender,
    required this.contact,
    required this.parents,
    required this.dob,
    required this.dateOfJoining,
    required this.experience,
    required this.address,
    required this.password,
    required this.imagedata,
  });
  // 
  // 
  Future<void> createTeachersData() async {

  final url = Uri.parse("http://localhost:3000/admin/teacher/create");

  try {
    final teachersModel = TeachersModel( 
    name,
    subject,
    qualification,
    email,
    classteacher,
    wichclass,
    gender,
    contact,
    parents,
    dob,
    dateOfJoining,
    experience,
    address,
    password,
    );

    final request = http.MultipartRequest('POST', url);


    request.fields['teacherData'] = teachersModel.toJson();

    // an image data only
    request.files.add(http.MultipartFile.fromBytes(
      'Profile_Image',
      imagedata['bytes'], 
      filename: imagedata['originalname'], 
      contentType: MediaType('image', 'jpeg')
    ));
    
    // 
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