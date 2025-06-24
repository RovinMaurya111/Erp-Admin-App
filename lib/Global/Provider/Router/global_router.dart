import 'package:admin/Drawer/View/drawer.dart';
import 'package:admin/Features/Academic/Staff/Teachers/View/createTeacher.dart';
import 'package:admin/Features/Academic/Staff/Teachers/View/teacherList.dart';
import 'package:admin/Features/Academic/Student/View/studentsList.dart';
import 'package:admin/Features/Academic/View/academic.dart';
import 'package:admin/Features/Account/View/Account.dart';
import 'package:admin/Features/Complaint/View/complaint.dart';
import 'package:admin/Features/Academic/Student/CrudStudent/View/createStudentScreen.dart';
import 'package:admin/Features/Event/View/event.dart';
import 'package:admin/Features/ExamDepartment/View/Exam.dart';
import 'package:admin/Home/View/home.dart';
import 'package:admin/Features/OnlineClass/View/OnlineClass.dart';
import 'package:admin/Schedule/View/schedule.dart';
import 'package:admin/Features/Settings/View/settings.dart';
import 'package:admin/Features/Transport/View/transport.dart';

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
        GoRoute(path: '/createTeacher', builder: (context, state) => CreateTeacher()),
        GoRoute(path: '/manageTeachers', builder: (context, state) => Manageteachers(),), 
    ]);
},);