import 'package:admin/Drawer/View/drawer.dart';
import 'package:admin/Screens/Academic/StudentsList/View/studentsList.dart';
import 'package:admin/Screens/Academic/View/academic.dart';
import 'package:admin/Screens/Account/View/Account.dart';
import 'package:admin/Screens/Complaint/View/complaint.dart';
import 'package:admin/Screens/CrudStudent/View/createStudentScreen.dart';
import 'package:admin/Screens/Event/View/event.dart';
import 'package:admin/Screens/ExamDepartment/View/Exam.dart';
import 'package:admin/Screens/Home/View/home.dart';
import 'package:admin/Screens/OnlineClass/View/OnlineClass.dart';
import 'package:admin/Screens/Schedule/View/schedule.dart';
import 'package:admin/Screens/Settings/View/settings.dart';
import 'package:admin/Screens/Staff/View/Staff.dart';
import 'package:admin/Screens/Transport/View/transport.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final Global_Router = Provider((ref) {
  return GoRouter( 
  initialLocation: '/home',
   
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: Text("Admin Panel"),
            centerTitle: true,
          ),
          body: child,
        );
      },
      routes: [
        GoRoute(path: '/home', builder: (context, state) => Home(),),
        GoRoute(path: '/schedule', builder: (context, state) => Schedule(),),
        GoRoute(path: '/staff', builder: (context, state) => Staff(),),
        GoRoute(path: '/academic', builder: (context, state) => Academic(),),
        GoRoute(path: '/event', builder: (context, state) => Event(),),
        GoRoute(path: '/account', builder: (context, state) => Account(),),
        GoRoute(path: '/transport', builder: (context, state) => Transport(),),
        GoRoute(path: '/exam', builder: (context, state) => Exam(),),
        GoRoute(path: '/onlineClass', builder: (context, state) => Onlineclass(),),
        GoRoute(path: '/complaint', builder: (context, state) => Complaint(),),
        GoRoute(path: '/settings', builder: (context, state) => Settings(),),
        ]
    ), 
        GoRoute(path: '/studentList', builder: (context, state) => Studentslist(),),
        GoRoute(path: '/createStudent', builder: (context, state) => Createstudent()),
    ]);
},);