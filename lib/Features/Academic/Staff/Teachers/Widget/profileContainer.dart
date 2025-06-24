import 'package:admin/Features/Academic/Staff/Teachers/Service/Read/readTeacher.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Profilecontainer extends StatelessWidget {
  final index;
  final String name;
  final String subject;
  final String qualification;
  final String email;
  final String phone;
  final String parents;
  final String gender;
  final String dob;
  final String joining_date;
  final String experience;
  final String wich_class;
  final String address;
  final String password;
  final bool classteacher;

  const Profilecontainer({
    super.key,
    required this.index,
    required this.name,
    required this.subject,
    required this.qualification,
    required this.email,
    required this.phone,
    required this.parents,
    required this.gender,
    required this.dob,
    required this.joining_date,
    required this.experience,
    required this.wich_class,
    required this.address,
    required this.password,
    required this.classteacher,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.black.withOpacity(0.6),
              child: CircleAvatar(
                radius: 88,
                backgroundColor: Colors.blueGrey.shade100,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            Gap(30),

            //  main Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                // Profile Information
                _customGrayText("Profile Information", 20),
                Gap(20),
                // row of two containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //
                    // 1st column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Name", 15),
                          ],
                        ),
                        _customText(name),
                        Gap(20),

                        // Gender
                        Row(
                          children: [
                            Icon(
                              Icons.male_outlined,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Gender", 15),
                          ],
                        ),
                        _customText(gender),
                        Gap(20),

                        // Contact
                        Row(
                          children: [
                            Icon(
                              Icons.phone_android_outlined,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Contact", 15),
                          ],
                        ),
                        _customText(phone),
                      ],
                    ),

                    // 2nd column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Father's/Spouse Name
                        Row(
                          children: [
                            Icon(
                              Icons.person_3,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Spuse/Father", 15),
                          ],
                        ),
                        _customText(parents),
                        Gap(20),

                        // DOB
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("DOB", 15),
                          ],
                        ),
                        _customText(dob),
                        Gap(20),
                        //
                        // Age
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Age", 15),
                          ],
                        ),
                        // the age will be calculated auto with any function
                        _customText("23"),
                      ],
                    ),
                  ],
                ),
                Gap(40),
                //
                //
                // Academic info
                _customGrayText("Academic Information", 20),
                Gap(20),
                // row of two containers
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 1st column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Qualification
                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Qualification", 15),
                          ],
                        ),
                        _customText(qualification),
                        Gap(20),

                        // Subject
                        Row(
                          children: [
                            Icon(Icons.book, size: 20, color: Colors.blueGrey),
                            Gap(5),
                            _customGrayText("Subject", 15),
                          ],
                        ),
                        _customText(subject),
                        Gap(20),
                      ],
                    ),

                    // 2nd column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Date of Joining
                        Row(
                          children: [
                            Icon(
                              Icons.date_range,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Date of Joining", 15),
                          ],
                        ),
                        _customText(joining_date),
                        Gap(20),

                        // Experience
                        Row(
                          children: [
                            Icon(Icons.work, size: 20, color: Colors.blueGrey),
                            Gap(5),
                            _customGrayText("Experience", 15),
                          ],
                        ),
                        _customText('$experience Years'),
                      ],
                    ),
                  ],
                ),
                Gap(20),
                // Work Status
                _customGrayText("Work Status", 20),
                Gap(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 1st column
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Class Teacher bool
                        Row(
                          children: [
                            Icon(
                              Icons.assignment_ind,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText("Class Teacher", 15),
                          ],
                        ),
                        Text(
                          classteacher ? "Yes" : "No",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(20),
                      ],
                    ),
                    // 2nd column
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // which Class
                        Row(
                          children: [
                            Icon(
                              Icons.class_,
                              size: 20,
                              color: Colors.blueGrey,
                            ),
                            Gap(5),
                            _customGrayText('Class', 15),
                          ],
                        ),
                        _customText(wich_class??'Subject Teacher'),
                      ],
                    ),
                  ],
                ),
                Gap(20),
                _customGrayText("Others", 20),
                Gap(20),
                //
                Row(
                  children: [
                    Icon(Icons.email, size: 20, color: Colors.blueGrey),
                    Gap(5),
                    _customGrayText("Email", 15),
                  ],
                ),
                _customText(email),
                Gap(20),
                // Email
                Row(
                  children: [
                    Icon(Icons.home, size: 20, color: Colors.blueGrey),
                    Gap(5),
                    _customGrayText("Address", 15),
                  ],
                ),
                _customText(address),
                Gap(40),
                // Security
                _customGrayText("Security", 20),
                Gap(20),
                Row(
                  children: [
                    Icon(Icons.badge, size: 20, color: Colors.blueGrey),
                    Gap(5),
                    _customGrayText("ID", 15),
                  ],
                ),
                _customText(phone),
                Gap(20),
                Row(
                  children: [
                    Icon(Icons.password, size: 20, color: Colors.blueGrey),
                    Gap(5),
                    _customGrayText("Password", 15),
                  ],
                ),
                _customText(password),

                //
                //
                Gap(40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.maxFinite, 45),
                    backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final list = await readTeacherService();
                    print(list);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.edit, color: Colors.white, size: 25),
                      Gap(10),
                      Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //
  //
  //
  Text _customText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 15,
        color: Colors.black,
      ),
      textAlign: TextAlign.center,
    );
  }

  Text _customGrayText(String text, int size) {
    return Text(
      text,
      style: TextStyle(fontSize: size.toDouble(), color: Colors.grey.shade700),
    );
  }
}
