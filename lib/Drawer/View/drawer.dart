import 'package:admin/Drawer/Widgets/drawerSafeRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

// 
 Widget _text(String text) {
  return Text(text, style: TextStyle(fontSize: 18));
}

// custom List tile
  Widget _customListTile(String path, String text, VoidCallback onTap) {
    return ListTile(
      leading: SvgPicture.asset(
        "assets/svg/$path.svg",
        width: 25, height: 25,
        fit: BoxFit.cover,
        allowDrawingOutsideViewBox: true,
      ),
      title: Text(text),
      onTap: () {
        onTap();
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: 250,

      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
           CircleAvatar(
              radius: 67,
              backgroundColor: Colors.black,
              child:  CircleAvatar(
              backgroundColor: Colors.white,
              radius: 65,
              child: 
                 SvgPicture.asset(
                  "assets/svg/person.svg",
                  width: 70, height: 70,
                  // fit: BoxFit.cover,
                  allowDrawingOutsideViewBox: true,
                ),
              
            ),
            ),
            SizedBox(height: 15),
            _text("Rovin Maurya"),
            // 
            SizedBox(height: 25),
            // 
            Divider(
              height: 0.3,
              indent: 15,
              endIndent: 20,
              color: Colors.black,
            ),
            // 
            SizedBox(height: 20),
            _customListTile("home", "Home", (){
              // 
              drawerSafeRoute(ref, '/home');
            }),
            Gap(8),
            _customListTile("schedule", "classes Schedule", (){
              //
              drawerSafeRoute(ref, '/schedule');
            }),
            Gap(8),
            _customListTile("staff", "Staff", (){
              //
              drawerSafeRoute(ref, '/staff');
            }),
            Gap(8),
            _customListTile("academic", "Academic", (){
              //
              drawerSafeRoute(ref, '/academic');
            }),
            Gap(8),
            _customListTile("celebration", "Event & Holiday", (){
              //
              drawerSafeRoute(ref, '/event');
            }),
            Gap(8),
            _customListTile("fees", "Accounts", (){
              //
              drawerSafeRoute(ref, '/account');
            }),
            Gap(8),
            _customListTile("staff", "Transport", (){
              //
              drawerSafeRoute(ref, '/transport');
            }),
            Gap(8),
            _customListTile("exam", "Exam Department", (){
              //
              drawerSafeRoute(ref, '/exam');
            }),
            Gap(8),
            _customListTile("online_class", "Live Classes", (){
              //
              drawerSafeRoute(ref, '/onlineClass');
            }),
            Gap(8),
            _customListTile("student_complaint", "Complaint", (){
              //
              drawerSafeRoute(ref, '/complaint');
            }),
              // 
            SizedBox(height: 20),
              //  
            Divider(
              height: 0.3,
              indent: 15,
              endIndent: 20,
              color: Colors.black,
            ),
            // 
            SizedBox(height: 20),
            // 
            _customListTile("setting", "Settings", (){
              // 
              drawerSafeRoute(ref, '/settings');
            }),
             // 
            Gap(8),
                
          ],
        ),
      ),
    );
  }
}