import 'package:flutter/material.dart';

class Scheduledropdownlist {
  //
  //
  List<DropdownMenuItem> dayList() {
    return [
      DropdownMenuItem(value: 'Monday', child: Text('Monday')),
      DropdownMenuItem(value: 'Tuesday', child: Text('Tuesday')),
      DropdownMenuItem(value: 'Wednesday', child: Text('Wednesday')),
      DropdownMenuItem(value: 'Thursday', child: Text('Thursday')),
      DropdownMenuItem(value: 'Friday', child: Text('Friday')),
      DropdownMenuItem(value: 'Saturday', child: Text('Saturday')),
    ];
  }

  //
  //
  List<DropdownMenuItem> scheduleClassList() {
    return [
      DropdownMenuItem(value: 'Nursery', child: Text("Nursery")),
      DropdownMenuItem(value: 'LKG', child: Text("L.K.G")),
      DropdownMenuItem(value: 'UKG', child: Text("U.K.G")),
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
    ];
  }

  //
  //
  List<DropdownMenuItem> periodList() {
    return [
      DropdownMenuItem(value: '1', child: Text("1")),
      DropdownMenuItem(value: '2', child: Text("2")),
      DropdownMenuItem(value: '3', child: Text("3")),
      DropdownMenuItem(value: '4', child: Text("4")),
      DropdownMenuItem(value: '5', child: Text("5")),
      DropdownMenuItem(value: '6', child: Text("6")),
      DropdownMenuItem(value: '7', child: Text("7")),
      DropdownMenuItem(value: '8', child: Text("8")),
    ];
  }

  //
  //
  List<DropdownMenuItem> scheduleTeachersList(List<String> teacherListName) {
    List<DropdownMenuItem> teachersList = [];
    for (var teacherName in teacherListName) {
      teachersList.add(
        DropdownMenuItem(value: teacherName, child: Text(teacherName)),
      );
    }
    return teachersList;
  }

  //
  //
  List<DropdownMenuItem> sectionList() {
    return [
      DropdownMenuItem(value: 'A', child: Text('A')),
      DropdownMenuItem(value: 'B', child: Text('B')),
      DropdownMenuItem(value: 'C', child: Text('C')),
      DropdownMenuItem(value: 'D', child: Text('D')),
    ];
  }

  //
  //
  List<DropdownMenuItem> scheduleSubjectList() {
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
}
