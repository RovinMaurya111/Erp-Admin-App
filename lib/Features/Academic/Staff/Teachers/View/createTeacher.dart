import 'dart:typed_data';
import 'dart:ui' show ImageFilter;
import 'package:admin/Features/Academic/Staff/Teachers/Service/Create/createTeacherBackend.dart';
import 'package:admin/Features/CrudStudent/Provider/isLoadingProvider.dart';
import 'package:admin/Global/Provider/Router/global_router.dart';

import 'package:admin/Global/Widget/pickImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:motion_toast/motion_toast.dart';

class CreateTeacher extends ConsumerStatefulWidget {
  const CreateTeacher({super.key});

  @override
  ConsumerState<CreateTeacher> createState() => _CreatestudentState();
}

class _CreatestudentState extends ConsumerState<CreateTeacher> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _qualificationController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _classTeacherController = TextEditingController();
  final TextEditingController _wichClassController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _parentsController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _dateOfJoiningController =
      TextEditingController();
  final TextEditingController _experieceController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _passwrodController = TextEditingController();
  final TextEditingController _repasswrodController = TextEditingController();
  Map<String, dynamic>? _imagedata;

  @override
  Widget build(BuildContext context) {
    final router = ref.read(Global_Router);
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/school_building.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
              child: Container(color: Colors.black.withOpacity(0.3)),
            ),
          ),
          Center(
            child: Container(
              width: 970,
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 40),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.7),
                    blurRadius: 25,
                    spreadRadius: 5,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 600,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                router.pop();
                              },
                            ),
                            Expanded(
                              child: const Center(
                                child: Text(
                                  "Create Teacher Profile",
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(20),
                        //
                        // profile image
                        CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.black,
                          child: CircleAvatar(
                            radius: 68,
                            backgroundImage: MemoryImage(
                              _imagedata?['bytes'] ?? Uint8List(0),
                              scale: 1.0,
                            ),
                            child: IconButton(
                              onPressed: () async {
                                final newImage = await pickImg();
                                setState(() {
                                  if (newImage != null) {
                                    _imagedata = newImage;
                                  }
                                });
                                //
                              },
                              icon: const Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const Gap(25),
                        Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: [
                            buildTextField(
                              "Class Teacher",
                              _classTeacherController,
                            ),
                            buildTextField("Student Name", _nameController),

                            buildTextField("Email", _emailController),

                            buildTextField("Contact", _contactController),
                            buildTextField(
                              "Father/Spouse Name",
                              _parentsController,
                            ),

                            buildTextField("Address", _addressController),
                            buildTextField("Password", _passwrodController),
                            buildTextField(
                              "Re Password",
                              _repasswrodController,
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: 250,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              _formSubmission(context);
                            },
                            child:
                                ref.watch(isLoadingProvider)
                                    ? const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                    : const Text(
                                      "Create Student",
                                      style: TextStyle(fontSize: 16),
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //
                  // 2nd sized box
                  SizedBox(

                    width: 300,
                    child: Wrap(
                      runSpacing: 20,
                      children: [
                        buildTextField("DOB", _dobController),
                        buildTextField(
                          "Date Of Joining",
                          _dateOfJoiningController,
                        ),
                        buildTextField("Subject", _subjectController),
                        buildTextField(
                          "Qualification",
                          _qualificationController,
                        ),

                        buildTextField("Class", _wichClassController),
                        buildTextField("Experience", _experieceController),
                        buildTextField("Gender", _genderController),
                        SizedBox(
                          width: 20,
                          height: 90,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //
  //
  Widget buildTextField(String hint, TextEditingController controller) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          // labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  //
  //
  void clearTextFields() {
    _nameController.clear();
    _subjectController.clear();
    _qualificationController.clear();
    _emailController.clear();
    _classTeacherController.clear();
    _wichClassController.clear();
    _genderController.clear();
    _contactController.clear();
    _parentsController.clear();
    _dobController.clear();
    _dateOfJoiningController.clear();
    _experieceController.clear();
    _addressController.clear();
    _passwrodController.clear();
  }

  bool _validator() {
    return _nameController.text.isNotEmpty &&
        _subjectController.text.isNotEmpty &&
        _qualificationController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _classTeacherController.text.isNotEmpty &&
        _wichClassController.text.isNotEmpty &&
        _genderController.text.isNotEmpty &&
        _contactController.text.isNotEmpty &&
        _parentsController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _dateOfJoiningController.text.isNotEmpty &&
        _experieceController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _passwrodController.text.isNotEmpty;
  }

  //
  bool _isPasswordValid() {
    return _passwrodController.text == _repasswrodController.text;
  }

  //
  //
  //
  // submisstion form
  //
  _formSubmission(BuildContext context) async {
    if (!_validator()) {
      MotionToast.error(
        description: const Text("Please fill all fields"),
      ).show(context);
      return;
    }

    if (!_isPasswordValid()) {
      MotionToast.error(
        description: const Text("Password & Confirm Password don't match"),
      ).show(context);
      return;
    }

    ref.watch(isLoadingProvider.notifier).state = true;

    await Future.delayed(const Duration(seconds: 3));

    try {
      final createTeacher = CreateteachersBackend(
        context: context,
        name: _nameController.text.toString(),
        subject: _subjectController.text.toString(),
        qualification: _qualificationController.text.toString(),
        email: _emailController.text.toString(),
        classteacher: _classTeacherController.text.toString(),
        wichclass: _wichClassController.text.toString(),
        gender: _genderController.text.toString(),
        contact: _contactController.text.toString(),
        parents: _parentsController.text.toString(),
        dob: _dobController.text.toString(),
        dateOfJoining: _dateOfJoiningController.text.toString(),
        experience: _experieceController.text.toString(),
        address: _addressController.text.toString(),
        password: _passwrodController.text.toString(),
        imagedata: _imagedata ?? {},
      );

      await createTeacher.createTeachersData();

      clearTextFields();
    } catch (e) {
      MotionToast.error(
        description: Text("Ui Error: ${e.toString()}"),
      ).show(context);
    } finally {
      if (mounted) {
        ref.watch(isLoadingProvider.notifier).state = false;
      }
    }
  }
}
