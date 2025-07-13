import 'package:admin/Schedule/Provider/scheduleListTileOnClickProvider.dart';
import 'package:admin/Schedule/Service/ScheduleReadTeachers.dart';
import 'package:admin/Schedule/Widget/ListTile/scheduleTeacherListTile.dart';
import 'package:admin/Schedule/Widget/customHeader.dart';
import 'package:admin/Schedule/Widget/ListTile/scheduleClassListTile.dart';
import 'package:admin/Schedule/stateNotifier/schduledataNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class Schedule extends ConsumerStatefulWidget {
  const Schedule({super.key});

  @override
  ConsumerState<Schedule> createState() => _ScheduleState();
}

class _ScheduleState extends ConsumerState<Schedule> {
  //
  List<String> teachersNameList = [];
  futureReadTeacherList() async {
    List getTeachersName = await scheduleReadTeachers();

    for (Map teacher in getTeachersName) {
      teachersNameList.add(teacher['name']);
    }
    print(teachersNameList);
  }

  @override
  void initState() {
    //
    super.initState();
    (ref.read(schduledatanotifierProvider.notifier).initMap());
    futureReadTeacherList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          children: [
            CustomScheduleHeader(teachersNameList, ref, context),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    //
                    //
                    // 1st container
                    child: SizedBox(
                      width: double.maxFinite,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return MouseRegion(
                            onEnter: (event) {
                              ref
                                  .read(
                                    scheduleListTileOnClickProvider(
                                      index,
                                    ).notifier,
                                  )
                                  .state = true;
                            },
                            onExit: (event) {
                              ref
                                  .read(
                                    scheduleListTileOnClickProvider(
                                      index,
                                    ).notifier,
                                  )
                                  .state = false;
                            },
                            child: scheduleListTile(ref, index),
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(20),
                  //
                  //
                  // 2nd container
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(onClickNotifierProvider.notifier)
                                  .expose(index);
                            },
                            child: teacherListTile(ref, index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
