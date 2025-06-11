import 'package:admin/Features/Academic/Staff/Teachers/Provider/datePickerProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatePicker {
WidgetRef ref;
BuildContext context;
DatePicker(this.context, this.ref);
// 
// 
Future birthDatePicker() async{
  final pickedDate = await showDatePicker(
    context: context, 
    initialDate: DateTime(2000),
    firstDate: DateTime(1960), 
    lastDate: DateTime(2010)
  );
  String date = pickedDate.toString();
  ref.read(birthDateProvider.notifier).state = date.substring(0,10);
}
// 
// 
Future joinDatePicker() async{
  final pickedDate = await showDatePicker(
    initialDate: DateTime.now(),
    context: context, 
    firstDate: DateTime(2000), 
    lastDate: DateTime(2030)
  );
  String date = pickedDate.toString();
  ref.read(joiningDateProvider.notifier).state = date.substring(0,10);
}
}