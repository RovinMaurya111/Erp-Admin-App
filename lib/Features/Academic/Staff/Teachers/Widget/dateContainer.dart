import 'package:admin/Features/Academic/Staff/Teachers/Functions/datePicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DateContainer {
  BuildContext context;
  WidgetRef ref;
  DateContainer(this.context, this.ref);
  // 
  // 
birthDateContainer(text){

  return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(text),
            IconButton(onPressed: ()async {
              await DatePicker(context, ref).birthDatePicker();
            }, icon: Icon(Icons.cake_rounded)),
            
          ],
        )
      ),
    );
}
// 
// 
joinDateContainer(text){

  return  Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           Text(text),
            IconButton(onPressed: ()async {
              await DatePicker(context, ref).joinDatePicker();
            }, icon: Icon(Icons.calendar_month_outlined)),
            
          ],
        )
      ),
    );
}
}