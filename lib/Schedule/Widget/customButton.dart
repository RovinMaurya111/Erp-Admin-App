
import 'package:admin/Schedule/Provider/scheduleDropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';

//
List nursery = [];
List lkg = [];
List ukg = [];
List class1 = [];
List class2 = [];
List class3 = [];
List class4 = [];
List class5 = [];
List class6 = [];
List class7 = [];
List class8 = [];
List class9 = [];
List class10 = [];
//
scheduleCustomButton(WidgetRef ref, BuildContext context) {
  return ElevatedButton.icon(
    onPressed: () {
      // Validate dropdown selections
      if (isScheduleValid(ref)) {
        MotionToast.error(
          description: const Text("Select Drop Down Button"),
        ).show(context);
        return;
      }

      // Build map data
      final section = ref.read(scheduleSectionProvider);
      final period = ref.read(schedulePeriodProvider);
      final teacher = ref.read(scheduleTeacherProvider);
      final subject = ref.read(scheduleSubjectProvider);

      Map map = {
        "Sections": [
          // 
          {
            ref.read(scheduleSectionProvider): [
              {
                "Periods": [
                  {
                    ref.read(schedulePeriodProvider): [
                      {
                        "Teacher": ref.read(scheduleTeacherProvider),
                        "Subject": ref.read(scheduleSubjectProvider),
                      },
                    ],
                  },
                ],
              },
            ],
          },
        ],
      };
      //
      final selectedClass = ref.read(scheduleClassProvider);
      // 
      if (selectedClass == 'Nursery') {
        nursery.add({map});
        print(nursery);
      } else if (selectedClass == 'L.K.G') {
        lkg.add({map});
        print(lkg);
      } else if (selectedClass == 'U.K.G') {
        ukg.add({map});
        print(ukg);
      } else if (selectedClass == '1') {
        class1.add({map});
        print(class1);
      } else if (selectedClass == '2') {
        class2.add({map});
        print(class2);
      } else if (selectedClass == '3') {
        class3.add({map});
        print(class3);
      } else if (selectedClass == '4') {
        class4.add({map});
        print(class4);
      } else if (selectedClass == '5') {
        class5.add({map});
        print(class5);
      } else if (selectedClass == '6') {
        class6.add({map});
        print(class6);
      } else if (selectedClass == '7') {
        class7.add({map});
        print(class7);
      } else if (selectedClass == '8') {
        class8.add({map});
        print(class8);
      } else if (selectedClass == '9') {
        class9.add({map});
        print(class9);
      } else if (selectedClass == '10') {
        class10.add({map});
        print(class10);
      } else {
        MotionToast.error(
          description: const Text("Unknown Class"),
        ).show(context);
      }
    },
    icon: const Icon(Icons.add, size: 20, color: Colors.white),
    label: const Text(
      'Add',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'Poppins',
      ),
    ),
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      backgroundColor: Colors.deepOrange,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}

bool isScheduleValid(WidgetRef ref) {
  return (ref.read(scheduleDayProvider) == 'Select Day' ||
      ref.read(scheduleClassProvider) == 'Select Class' ||
      ref.read(schedulePeriodProvider) == 'Period' ||
      ref.read(scheduleTeacherProvider) == 'Select Teacher' ||
      ref.read(scheduleSectionProvider) == 'Sec' ||
      ref.read(scheduleSubjectProvider) == 'Subject');
}
