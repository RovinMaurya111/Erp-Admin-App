import 'package:admin/Features/Academic/Staff/Teachers/Provider/radioButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Dropdownlist {
  //
  //
  List<DropdownMenuItem> subjectList() {
    return [
      DropdownMenuItem(value: 'Hindi', child: Text('Hindi')),
      DropdownMenuItem(value: 'English', child: Text('English')),
      DropdownMenuItem(value: 'Mathematics', child: Text('Mathematics')),
      DropdownMenuItem(value: 'Science', child: Text('Science')),
      DropdownMenuItem(value: 'Social Science', child: Text('Social Science')),
      DropdownMenuItem(value: 'EVS', child: Text('EVS')),
      DropdownMenuItem(
        value: 'Computer Science',
        child: Text('Computer Science'),
      ),
      DropdownMenuItem(value: 'Physics', child: Text('Physics')),
      DropdownMenuItem(value: 'Chemistry', child: Text('Chemistry')),
      DropdownMenuItem(value: 'Biology', child: Text('Biology')),
      DropdownMenuItem(value: 'History', child: Text('History')),
      DropdownMenuItem(value: 'Geography', child: Text('Geography')),
      DropdownMenuItem(value: 'Civics', child: Text('Civics')),
      DropdownMenuItem(value: 'Economics', child: Text('Economics')),
      DropdownMenuItem(
        value: 'gA Education',
        child: Text('Physical Education'),
      ),
      DropdownMenuItem(value: 'Music', child: Text('Music')),
      DropdownMenuItem(value: 'Dance', child: Text('Dance')),
      DropdownMenuItem(value: 'Art Education', child: Text('Art Education')),
      DropdownMenuItem(value: 'Sanskrit', child: Text('Sanskrit')),
      DropdownMenuItem(value: 'Urdu', child: Text('Urdu')),
      DropdownMenuItem(value: 'Moral Science', child: Text('Moral Science')),
      DropdownMenuItem(
        value: 'General Knowledge',
        child: Text('General Knowledge'),
      ),
      DropdownMenuItem(value: 'Wellness', child: Text('Wellness')),
    ];
  }

  //
  //
    List<DropdownMenuItem> genderList() {
    return [
      DropdownMenuItem(value: 'Male', child: Text("Male")),
      DropdownMenuItem(value: 'Female', child: Text("Female")),
    ];
  }

  //
  //
    List<DropdownMenuItem> qualificationList() {
    return [
      // Master Degrees
      DropdownMenuItem(value: 'M.Ed', child: Text("M.Ed")),
      DropdownMenuItem(value: 'M.A', child: Text("M.A")),
      DropdownMenuItem(value: 'M.Sc', child: Text("M.Sc")),
      DropdownMenuItem(value: 'M.Com', child: Text("M.Com")),
      DropdownMenuItem(value: 'MBA', child: Text("MBA")),
      DropdownMenuItem(value: 'MCA', child: Text("MCA")),
      DropdownMenuItem(value: 'M.Tech', child: Text("M.Tech")),
      DropdownMenuItem(value: 'M.P.Ed', child: Text("M.P.Ed")),
      DropdownMenuItem(value: 'M.Phil', child: Text("M.Phil")),
      DropdownMenuItem(value: 'Ph.D', child: Text("Ph.D")),

      // Bachelor Degrees
      DropdownMenuItem(value: 'B.Ed', child: Text("B.Ed")),
      DropdownMenuItem(value: 'B.A', child: Text("B.A")),
      DropdownMenuItem(value: 'B.Sc', child: Text("B.Sc")),
      DropdownMenuItem(value: 'B.Com', child: Text("B.Com")),
      DropdownMenuItem(value: 'BCA', child: Text("BCA")),
      DropdownMenuItem(value: 'BBA', child: Text("BBA")),
      DropdownMenuItem(value: 'B.Tech', child: Text("B.Tech")),
      DropdownMenuItem(value: 'B.P.Ed', child: Text("B.P.Ed")),

      // Diploma, Training, Certifications
      DropdownMenuItem(value: 'Diploma', child: Text("Diploma")),
      DropdownMenuItem(value: 'D.El.Ed', child: Text("D.El.Ed")),
      DropdownMenuItem(value: 'NTT', child: Text("NTT")),
      DropdownMenuItem(value: 'PTT', child: Text("PTT")),

      // CTET, TET, Other
      DropdownMenuItem(value: 'CTET', child: Text("CTET Qualified")),
      DropdownMenuItem(value: 'STET', child: Text("STET Qualified")),
      DropdownMenuItem(value: 'TET', child: Text("TET Qualified")),
      DropdownMenuItem(value: 'Other', child: Text("Other")),
      DropdownMenuItem(value: 'Appearing', child: Text("Appearing")),
    ];
  }

  //
  //
    List<DropdownMenuItem> classList(WidgetRef ref) {
    return ref.watch(radioButtonProvider) ? [
      DropdownMenuItem(value: 'Nursery', child: Text("Nursery")),
      DropdownMenuItem(value: 'L.K.G', child: Text("L.K.G")),
      DropdownMenuItem(value: 'U.K.G', child: Text("U.K.G")),
      DropdownMenuItem(value: '1', child: Text("1")),
      DropdownMenuItem(value: '2', child: Text("2")),
      DropdownMenuItem(value: '3', child: Text("3")),
      DropdownMenuItem(value: '4', child: Text("4")),
      DropdownMenuItem(value: '5', child: Text("5")),
      DropdownMenuItem(value: '6', child: Text("6")),
      DropdownMenuItem(value: '7', child: Text("7")),
      DropdownMenuItem(value: '8', child: Text("8")),
      DropdownMenuItem(value: '9', child: Text("9")),
      DropdownMenuItem(value: '10', child: Text("10")),
      DropdownMenuItem(value: '11', child: Text("11")),
      DropdownMenuItem(value: '12', child: Text("12")),
    ] : [];
  }

  //
  //
    List<DropdownMenuItem> experienceList() {
    
      final list  = List.generate(51, (index) {
        return DropdownMenuItem(
          value: index.toString(),
          child: Text(index.toString()),
        );
      });
    return list;
  }

  //
  //
    List<DropdownMenuItem> classTeacherList() {
    return [
      DropdownMenuItem(value: 'Yes', child: Text('Yes')),
      DropdownMenuItem(value: 'No', child: Text('No')),
    ];
  }
}
