import 'package:admin/Drawer/Widgets/drawerSafeRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';


// Custom GridView.builder
Widget CustomGridView (BuildContext context, WidgetRef ref){
  // 
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  // 
  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
  (crossAxisCount: 4,crossAxisSpacing: 100, mainAxisSpacing: 40, childAspectRatio: 1.5),
      itemCount: 13,
      
      itemBuilder: (context, index) {
      
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            switch(index){
              case 0:
              //
              drawerSafeRoute(ref, '/studentList');
              break;
              case 1:
              //
              break;
              case 2:
              //
              break;
              case 3:
              //
              break;
              case 4:
              //
              break;
              case 5:
            }
          },
          child: Container(
            color: Colors.blue,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(children: [
                CircleAvatar(backgroundColor: Colors.white, radius: 47,
                child: CircleAvatar(backgroundColor: Colors.black, radius: 45, )),
                Gap(5), 
                Column(children: [Text("Class", style: TextStyle(fontSize: 20),), 
                Gap(5),
                Text("Class Teacher name")],)]),
            ),
          ),
        ),
      );  
      },
    );
}
