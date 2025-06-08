import 'package:admin/Global/Provider/Router/global_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

CustomeAppBar(WidgetRef ref){
  return AppBar(
    actions: [
      Align(
        alignment: Alignment.centerRight,
        child: Row(children: [
          ElevatedButton(onPressed: (){
            // add student
            ref.read(Global_Router).push("/createStudent");            
          }, child: Text("Add Student")),
          Gap(20),
          IconButton(onPressed: (){
            // Announcement
          }, icon: Icon(Icons.announcement_outlined),),
          Gap(50),
        ],),
      )
    ],
  );
}