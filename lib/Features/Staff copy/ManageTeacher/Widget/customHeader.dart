import 'package:admin/Global/Provider/Router/global_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CustomHeader extends StatelessWidget {
  final String totalClassTeachers;
  final String totalSubjectTeachers;
  final String totalTeachers;
  final BuildContext mcontex;

  const CustomHeader({
    super.key,
    required this.totalClassTeachers,
    required this.totalSubjectTeachers,
    required this.totalTeachers,
    required this.mcontex,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 20, 80, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Icon
          IconButton(
            onPressed: () {
              // null
            },
            icon: const Icon(Icons.arrow_back, size: 26, color: Colors.black87),
            splashRadius: 24,
          ),

          // Stats
          _statText('Total Teachers', totalTeachers),
          _statText('Class Teachers', totalClassTeachers),
          _statText('Subject Teachers', totalSubjectTeachers),

          // Add Button
          Consumer(
            builder: (context, ref, child) {
              final router = ref.read(Global_Router);
              return ElevatedButton.icon(
                onPressed: () {
                  router.push('/createTeacher');
                },
                icon: const Icon(Icons.add, size: 20, color: Colors.white),
                label: const Text(
                  'Add Teacher',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 14,
                  ),
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Stat Text Widget
  Widget _statText(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey.shade600,
            fontFamily: 'Poppins',
          ),
        ),
        const Gap(4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
