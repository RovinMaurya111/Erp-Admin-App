
import 'package:admin/Schedule/Provider/scheduleListTileOnClickProvider.dart';
import 'package:admin/Schedule/Widget/ListTile/scheduleTeacherListTile.dart';
import 'package:admin/Schedule/Widget/customHeader.dart';
import 'package:admin/Schedule/Widget/ListTile/scheduleClassListTile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class Schedule extends ConsumerWidget {
  const Schedule({super.key});
// 
//
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        child: Column(
          children: [
            CustomScheduleHeader(ref, context),
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    //
                    // 1st container
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                      ),
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
                  Gap(20),
                  //
                  // 2nd container
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                    ),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                            onTap: () {
                              ref.read(onClickNotifierProvider.notifier).expose(index);
                            },
                            child: teacherListTile(ref, index)),
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
