import 'package:admin/Schedule/Provider/scheduleListTileOnClickProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

Widget teacherListTile(WidgetRef ref, index) {
  int? selectedIndex = ref.watch(onClickNotifierProvider);
  bool onClick = selectedIndex == index;

  return AnimatedContainer(
    curve: Curves.easeOut,
    duration: const Duration(seconds: 1),
    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: const EdgeInsets.all(16),
    height: onClick ? 240 : 170,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.08),
          blurRadius: 12,
          spreadRadius: 1,
          offset: const Offset(0, 6),
        ),
      ],
      border: Border.all(color: Colors.deepOrange.withOpacity(0.5), width: 1),
    ),
    child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top Row
              Column(
                children: [
                  // Teacher image
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blueGrey.shade200,
                    child: const Icon(
                      Icons.person,
                      size: 18,
                      color: Colors.white,
                    ),
                  ),
                  Gap(10),
                  // teacher name
                  SizedBox(
                    width: 150,
                    child: Text(
                      "Teacher Kumar Name",
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),

              //
              //
              const Gap(20),

              // Assigned Periods
              _periodBox("Assigned", "6", Colors.green.shade50, Colors.green),

              const Gap(10),

              // Left Periods
              _periodBox("Left", "2", Colors.red.shade50, Colors.red),

              //
              //
            ],
          ),
          Gap(20),
          // incrasae height
          onClick
              ? AnimatedSize(
                duration: Duration(seconds: 2),
                curve: Curves.easeOut,
                child: Column(
                  children: [
                    Divider(color: Colors.black, thickness: 0.2),
                    Gap(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _cutomElevaedButton(
                          Icon(Icons.edit, color: Colors.white),
                          "Edit",
                          () {
                            null;
                          },
                        ),
                        _cutomElevaedButton(
                          Icon(Icons.delete, color: Colors.white),
                          "Delete",
                          () {
                            null;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              )
              : SizedBox.shrink(),
        ],
      ),
    ),
  );
}

Widget _periodBox(String label, String value, Color bgColor, Color textColor) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: textColor.withOpacity(0.4)),
    ),
    child: Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),
        const Gap(4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  );
}

//
//
Widget _cutomElevaedButton(Icon icon, String text, Function function) {
  return ElevatedButton.icon(
    onPressed: () {
      function;
    },
    icon: icon,
    label: const Text("Edit", style: TextStyle(color: Colors.white)),
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrange,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
  );
}
