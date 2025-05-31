import 'package:flutter/material.dart';
import 'package:gap/gap.dart';


// Custom GridView.builder
Widget customClipRRect (BuildContext context){
  // 
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  // 
  return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount
  (crossAxisCount: 4,crossAxisSpacing: 100, mainAxisSpacing: 40, childAspectRatio: 2),
      itemCount: 13,
      
      itemBuilder: (context, index) {
      
      return ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: GestureDetector(
          onTap: () {
            switch(index){
              case 0:
              // nursery
              break;
              case 1:
              // LKG
              break;
              case 2:
              // UKG
              break;
              case 3:
              // class 1
              break;
              case 4:
              // class 2
              break;
              case 5:
              // class 3
              break;
              case 6:
              // class 4
              break;
              case 7:
              // class 5
              break;
              case 8:
              // class 6
              break;
              case 9:
              // class 7
              break;
              case 10:
              // class 8
              break;
              case 11:
              // class 9
              break;
              case 12:
              // class 10
              break;
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
