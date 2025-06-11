import 'package:admin/Features/Academic/Staff/Teachers/Provider/dropDownValueProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Provider/radioButton.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/DropDownButton/dropDownList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomDropDownButton {
  //
  //
  subjectButton(WidgetRef ref, BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).height * 0.3,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: Dropdownlist().subjectList(),
            onChanged: (value) {
              ref.read(subjectProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(subjectProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  //
  genderButton(WidgetRef ref, BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: Dropdownlist().genderList(),
            onChanged: (value) {
              ref.read(genderProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(genderProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  qualificationButton(WidgetRef ref, BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: Dropdownlist().qualificationList(),
            onChanged: (value) {
              ref.read(qualificationProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(qualificationProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  classButton(WidgetRef ref, BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: Dropdownlist().classList(ref),
            onChanged: (value) {
              
                ref.read(classProvider.notifier).state = value.toString(); 

            },
            hint: ref.read(radioButtonProvider)? Text(ref.watch(classProvider)) : Text('Select Class'), 
          ),
        ),
      ),
    );
  }

  //
  //
  experienceButton(WidgetRef ref, BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.sizeOf(context).height * 0.3,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: Dropdownlist().experienceList(),
            onChanged: (value) {
              ref.read(experienceProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(experienceProvider)),
          ),
        ),
      ),
    );
  }

  //
}
