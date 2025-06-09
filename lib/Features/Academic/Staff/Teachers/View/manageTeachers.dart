import 'package:admin/Features/Academic/Staff/Teachers/Provider/indexProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/customHeader.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/employeeContainer.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/profileContainer.dart';
import 'package:admin/Features/Home/Provider/onHoverProvider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Manageteachers extends ConsumerWidget {
  const Manageteachers({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  
    return Scaffold(
      body: Column(
        children: [
          
          SizedBox(
            height: 100,
            width: double.maxFinite,
            child: CustomHeader(
              totalClassTeachers: "20", 
              totalSubjectTeachers: "30", 
              totalTeachers: "50",
              mcontex: context,
            )
          ),
          Expanded(
            child: Row(
              children: [
                // List of employees
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,30,10),
                    child: GridView.builder(
                      itemCount: 8,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 30,
                        mainAxisSpacing: 50,
                        childAspectRatio: 2 / 3,
                      ),
                      itemBuilder: (context, index) {
                        // 
                        return MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) {
                            ref.read(onHoverProvider(index).notifier).state = true;
                          },
                          onExit: (_) {
                            ref.read(onHoverProvider(index).notifier).state = false;
                          },
                          child: GestureDetector(
                            onTap: () {
                              ref.read(indexProvider.notifier).state = index;
                            },
                            child: EmployeeContainer(
                              name: "name",
                              subject: "subject",
                              qualification: "qualification",
                              email: "kumarrovin499@gmail.com",
                              phone: "1234567890",
                              classteacher: true,
                              index: index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // 
                // Profile container
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                      width: 1,
                    ),
                  ),
                  width: 400,
                  height: double.maxFinite,
                  child: Profilecontainer(
                    name: "Name Kumar Das",
                      subject: "subject",
                      qualification: "qualification",
                      email: "kumarrovin499@gmail.com",
                      phone: "1234567890",
                      classteacher: true,
                    ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
  // 
  
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
