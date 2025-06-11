
import 'package:admin/Features/Academic/Student/Widgets/customListTile.dart';
import 'package:admin/Features/Academic/Student/Widgets/customeAppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Studentslist extends ConsumerWidget {
   const Studentslist({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomeAppBar(ref),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30,0,30,40),
        child: ListView.builder(itemCount: 5,itemBuilder: (context, index) {
          
          return CustomListTile("name", "7070231973", "0041", "kumar", "ramlal devi", "26/2/3");
        },),
      )
    );
  }
}