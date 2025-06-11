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
  // this list will be taken from database and then implement here
  List<DropdownMenuItem> teacherList() {
    return [
      DropdownMenuItem(value: 'Meenu Kumari', child: Text('Meenu Kumari')),
      DropdownMenuItem(value: 'Kajal Kumari', child: Text('Kajal Kumari')),
      DropdownMenuItem(value: 'Sudesh Kumar', child: Text('Sudesh Kumar')),
      DropdownMenuItem(value: 'Ram Kumar', child: Text('Ram Kumar')),
      DropdownMenuItem(value: 'Sumant Bharti', child: Text('Sumant Bharti')),
      DropdownMenuItem(value: 'Santosh Pandey', child: Text('Santosh Pandey')),
    ];
  }
}
