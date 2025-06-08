import 'dart:convert';

class TeachersModel{
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

  TeachersModel(
    this.name,
    this.subject,
    this.qualification,
    this.email,
    this.classteacher,
    this.wichclass,
    this.gender,
    this.contact,
    this.parents,
    this.dob,
    this.dateOfJoining,
    this.experience,
    this.address,
    this.password,
  );

// 
// 
  toMap(){
    return {
      'name' : name,
      'subject': subject,
      'qualification' : qualification,
      'email': email,
      'classteacher': classteacher,
      'wich_class': wichclass,
      'gender': gender,
      'contact': contact,
      'parent':parents,
      'DOB': dob,
      'joining_date': dateOfJoining,
      'experience' : experience,
      'address': address,
      'password': password,

    };
  }
// 
// 
  String toJson(){
    return jsonEncode(
      toMap(),
    );
  } 
}