import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

Widget CustomListTile(
  String name,
  String mobile,
  String admNo,
  String fatherName,
  String motherName,
  String dob,
) {
  return Column(
    children: [
      Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(horizontal: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(30),
              CircleAvatar(
                radius: 62,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.blueGrey,
                  child: Text(
                    name[0].toUpperCase(),
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
              ),
              Gap(30),

              // Info Column with fixed width
              SizedBox(
                width: 300,  // adjust this width as needed for PC
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Gap(6),
                    Text("Mobile: $mobile",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Gap(6),
                    Text("Adm No: $admNo",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Gap(6),
                    Text("DOB: $dob",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Gap(6),
                    Text("Father: $fatherName",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                    Gap(6),
                    Text("Mother: $motherName",
                        style: TextStyle(fontSize: 14, color: Colors.grey[600])),
                  ],
                ),
              ),

              Spacer(),
              // 
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.chat, color: Colors.blue),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.green),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                ],
              ),
              Gap(30),
            ],
          ),
        ),
      ),
      Gap(20),
    ],
  );
}
