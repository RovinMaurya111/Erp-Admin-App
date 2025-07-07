import 'package:admin/Schedule/Widget/customButton.dart';
import 'package:admin/Schedule/Widget/scheduleDropDownButton.dart';
import 'package:admin/Schedule/Widget/scheduleDropDownList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CustomScheduleHeader extends StatelessWidget {
  WidgetRef ref;
  BuildContext context;

  CustomScheduleHeader(this.ref, this.context, {super.key});

  @override
  Widget build(BuildContext context) {
    //
    // 2nd Section
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 20, 30, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Icon
          IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.arrow_back, size: 26, color: Colors.black87),
            splashRadius: 24,
          ),
          Gap(30),
          //
          ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().dayList(),
          ).dropDownDayButton(),
          Gap(30),
          ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().scheduleClassList(),
          ).classDropDownButton(),
          ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().sectionList(),
          ).scheduleSectionDropDownButton(),
          Gap(30),
          ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().periodList(),
          ).periodDropDownButton(),
          Gap(30),
          ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().teacherList(),
          ).teacherDropDownButton(),
          Gap(30),
            ScheduleDropDownButton(
            context,
            ref,
            Scheduledropdownlist().scheduleSubjectList(),
          ).scheduleSubjectDropDownButton(),
          Gap(30),
          ScheduleCustomButton(),
        ],
      ),
    );
  }
}
