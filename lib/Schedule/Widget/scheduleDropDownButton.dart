import 'package:admin/Schedule/Provider/scheduleDropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScheduleDropDownButton {
  BuildContext context;
  WidgetRef ref;
  List<DropdownMenuItem> items;
  ScheduleDropDownButton(this.context, this.ref, this.items);
  dropDownDayButton() {
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
            items: items,
            onChanged: (value) {
              ref.read(scheduleDayProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(scheduleDayProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  classDropDownButton() {
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
            items: items,
            onChanged: (value) {
              ref.read(scheduleClassProvider.notifier).state = value.toString();
            },
            hint: Text(ref.watch(scheduleClassProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  periodDropDownButton() {
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
            items: items,
            onChanged: (value) {
              ref.read(schedulePeriodProvider.notifier).state =
                  value.toString();
            },
            hint: Text(ref.watch(schedulePeriodProvider)),
          ),
        ),
      ),
    );
  }

  //
  //
  teacherDropDownButton() {
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
            items: items,
            onChanged: (value) {
              ref.read(scheduleTeacherProvider.notifier).state =
                  value.toString();
            },
            hint: Text(ref.watch(scheduleTeacherProvider)),
          ),
        ),
      ),
    );
  }
}
