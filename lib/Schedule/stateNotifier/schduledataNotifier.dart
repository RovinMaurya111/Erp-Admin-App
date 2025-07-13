import 'package:admin/Schedule/Provider/scheduleDropDownProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:motion_toast/motion_toast.dart';

class Schduledatanotifier extends StateNotifier {
  Schduledatanotifier(super.state);

  //
  List days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  //
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
  //
  //
  initMap() {
    for (String day in days) {
      state[day] = {};
      for (String className in classes) {
        state[day][className] = [
          {"A": []},
          {"B": []},
          {"C": []},
          {"D": []},
        ];
      }
    }
  }

  //
  //
  addPeriod(
    String day,
    String scheduleClass,
    String section,
    Map periods,
    BuildContext context,
    WidgetRef ref,
  ) {
    int index = sectionIndex(section);
    if (checkDuplicateData(
      state[day][scheduleClass][index][section],
      ref.read(schedulePeriodProvider),
    )) {
      MotionToast.error(description: Text("Dublicate Data")).show(context);
      return;
    }

    //
    state[day][scheduleClass][index][section].add(periods);
    print("section data is:");
    print(state[day][scheduleClass][index],);
  }

  //
  //
  sectionIndex(String section) {
    switch (section) {
      case 'A':
        return 0;
      case 'B':
        return 1;
      case 'C':
        return 2;
      case 'D':
        return 3;
    }
  }

  //
  //
  bool checkDuplicateData(List sectionData, String period) {
    for (var data in sectionData) {
      var key = data.keys.first;
      if (period == key) {
        return true;
      }
    }
    return false;
  }
}

final schduledatanotifierProvider = StateNotifierProvider((ref) {
  return Schduledatanotifier({});
});
