import 'package:admin/Schedule/Provider/scheduleDropDownProvider.dart';
import 'package:admin/Schedule/stateNotifier/schduledataNotifier.dart';
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


  @override
  Widget build(BuildContext context) {
    final day = ref.read(scheduleDayProvider);
    final scheduleClass = ref.read(scheduleClassProvider);
    final section = ref.read(scheduleSectionProvider);
    final period = ref.read(schedulePeriodProvider);
    final subject = ref.read(scheduleSubjectProvider);
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
        if (isScheduleInvalid(ref)) {
          MotionToast.error(
            description: const Text('Please Select the List'),
          ).show(context);
          return;
        }

        // 
        Map<String, List<Map<String, String>>> periods = {
          ref.read(schedulePeriodProvider): [
            {
              "Teacher": ref.read(scheduleTeacherProvider),
              "Subject": ref.read(scheduleSubjectProvider),
            },
          ],
        };
// 
        (ref.read(
          schduledatanotifierProvider.notifier,
        )).addPeriod(
          day,
          scheduleClass,
          section,
          periods,
          context,
          ref,
        );
        print(ref.read(schduledatanotifierProvider.notifier).state);
      },
    );
  }
// 
  bool isScheduleInvalid(WidgetRef ref) {
    return (ref.read(scheduleDayProvider) == 'Select Day' ||
        ref.read(scheduleClassProvider) == 'Select Class' ||
        ref.read(schedulePeriodProvider) == 'Period' ||
        ref.read(scheduleTeacherProvider) == 'Select Teacher' ||
        ref.read(scheduleSectionProvider) == 'Sec' ||
        ref.read(scheduleSubjectProvider) == 'Subject');
  }


}
