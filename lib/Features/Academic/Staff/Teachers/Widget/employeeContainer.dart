
import 'package:admin/Home/Provider/onHoverProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class EmployeeContainer extends ConsumerWidget {
  final String name;
  final String subject;
  final String qualification;
  final String email;
  final String phone;
  final bool classteacher;
  final int index;

  const EmployeeContainer({
    super.key,
    required this.name,
    required this.subject,
    required this.qualification,
    required this.email,
    required this.phone,
    required this.classteacher,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHovered = ref.watch(onHoverProvider(index));

    return Container(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: isHovered ? Colors.deepOrange : Colors.black.withOpacity(0.5),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.deepOrange : Colors.black.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1.5,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 71,
                  backgroundColor: isHovered ? Colors.deepOrange : Colors.black.withOpacity(0.6),
                  child: CircleAvatar(
                    radius: 69,
                    backgroundColor: Colors.blueGrey.shade100,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                Gap(12),
                _boldText(name),
                Text(
                  '$subject Teacher',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                ),
                Gap(30),

                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Qualification', style: _labelStyle()),
                        Gap(4),
                        _boldText(qualification),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Class Teacher', style: _labelStyle()),
                          Gap(4),
                          Text(
                            classteacher ? "Yes" : "No",
                            style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: isHovered ? Colors.deepOrange : Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Gap(30),
                // 
                // address
                Row(
                  children: [
                    Icon(Icons.home, size: 20, color: isHovered ? Colors.deepOrange : Colors.blueGrey),
                    Gap(10),
                    Expanded(
                      child: Text(
                        email,
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                // 
                // email
                Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 20,
                      color: isHovered ? Colors.deepOrange : Colors.blueGrey,
                    ),
                    Gap(10),
                    Expanded(
                      child: Text(
                        email,
                        style: TextStyle(fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(10),
                // 
                // phone
                Row(
                  children: [
                    Icon(Icons.phone, size: 20, color: isHovered ? Colors.deepOrange : Colors.blueGrey),
                    Gap(10),
                    Text(
                      phone,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text _boldText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  TextStyle _labelStyle() {
    return TextStyle(
      fontSize: 16,
      color: Colors.grey.shade700,
    );
  }
}
