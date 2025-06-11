import 'package:admin/Features/Academic/Staff/Teachers/Provider/radioButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

customRadioButton(WidgetRef ref){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Text("IF Class Teacher", style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16),),
       Gap(10),
      Row(
        children: [
          _customText("Yes"),
          Radio(
            value: true, 
            groupValue: ref.watch(radioButtonProvider), 
            onChanged: (value) {
              ref.read(radioButtonProvider.notifier).state = value!;
            },
          ),
          // 
          Gap(90),
          _customText("No"),
          Radio(
            value: false, 
            groupValue: ref.watch(radioButtonProvider), 
            onChanged: (value) {
              ref.read(radioButtonProvider.notifier).state = value!;
            },
          ),
        ],
      ),
      
    ],
  );
}

Text _customText(text){
  return Text(text, style: TextStyle(
    fontSize: 16,
  ),);
}