import 'package:admin/Schedule/Provider/scheduleDropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';

class ScheduleCustomButton extends ConsumerStatefulWidget {
  const ScheduleCustomButton({super.key});

  @override
  ConsumerState<ScheduleCustomButton> createState() =>
      _ScheduleCustomButtonState();
}

class _ScheduleCustomButtonState extends ConsumerState<ScheduleCustomButton> {
  //
  Map selectedClasses = {};

  List<String> classes = [
    'Nursery',
    'LKG',
    'UKG',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  @override
  void initState() {
    super.initState();
    //
    for (String className in classes) {
      selectedClasses[className] = [
        {"A": []},
        {"B": []},
        {"C": []},
        {"D": []},
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
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
      onPressed: () {
        //
        if (isScheduleInvalid(ref)) {
          MotionToast.error(
            description: const Text("Select Drop Down Button"),
          ).show(context);
          return;
        }

        Map<String, List<Map<String, String>>> period = {
          ref.read(schedulePeriodProvider): [
            {
              "Teacher": ref.read(scheduleTeacherProvider),
              "Subject": ref.read(scheduleSubjectProvider),
            },
          ],
        };

        final classProvider = ref.read(scheduleClassProvider);
        final section = ref.read(scheduleSectionProvider);

        int sectiontoIndex(String section) {
          switch (section) {
            case 'A':
              return 0;
            case 'B':
              return 1;
            case 'C':
              return 2;
            case 'D':
              return 3;
            default:
              return -1; // Invalid section
          }
        }

        if(checkDuplicateData(
            selectedClasses[classProvider][sectiontoIndex(section)][section],
            section,
          )){
            MotionToast.error(
              description: const Text("Duplicate Period Detected"),
            ).show(context);
            return;
        }
        //
        print("adding in a map");
        selectedClasses[classProvider][sectiontoIndex(section)][section].add(
          period,
        );
        print(selectedClasses);
      },
    );
  }

  bool isScheduleInvalid(WidgetRef ref) {
    return (ref.read(scheduleDayProvider) == 'Select Day' ||
        ref.read(scheduleClassProvider) == 'Select Class' ||
        ref.read(schedulePeriodProvider) == 'Period' ||
        ref.read(scheduleTeacherProvider) == 'Select Teacher' ||
        ref.read(scheduleSectionProvider) == 'Sec' ||
        ref.read(scheduleSubjectProvider) == 'Subject');
  }

  //
  bool checkDuplicateData(List sectionData, String section) {
    for (var data in sectionData) {
      var key = data.keys.first;
      if (ref.read(schedulePeriodProvider) == key) {
        return true;
      } 
    }
    return false;
  }
}
