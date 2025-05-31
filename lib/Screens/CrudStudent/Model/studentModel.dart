import 'dart:convert';

class StudentModel {
  String name;
  String phone;
  String dob;
  String adm;
  String father;
  String mother;
  String address;
  String email;
  String password;
  String roll;

  StudentModel(
    this.name,
    this.phone,
    this.dob,
    this.adm,
    this.father,
    this.mother,
    this.address,
    this.email,
    this.password,
    this.roll,
  );

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      'dob': dob,
      'adm': adm,
      'father': father,
      'mother': mother,
      'address': address,
      'email': email,
      'password': password,
      'roll': roll,
    };
  }

  String toJson() => jsonEncode(toMap());
}
