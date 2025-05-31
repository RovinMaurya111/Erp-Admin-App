import 'dart:ui';

import 'package:admin/Screens/CrudStudent/Provider/isLoadingProvider.dart';
import 'package:admin/Screens/CrudStudent/Service/createStudentData.dart';
import 'package:admin/Screens/CrudStudent/Widget/pickImg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:motion_toast/motion_toast.dart';

class Createstudent extends ConsumerStatefulWidget {
  const Createstudent({super.key});

  @override
  ConsumerState<Createstudent> createState() => _CreatestudentState();
}

class _CreatestudentState extends ConsumerState<Createstudent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _admController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fatherController = TextEditingController();
  final TextEditingController _motherController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _rollController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              child: Container(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 900,
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
                  )
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                      ),
                      Expanded(child: const Center(
                        child: Text(
                          "Create Student",
                          style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          ),
                        ),
                      )),
                    ],
                  ),
                  const Gap(20),
                  CircleAvatar(
                    radius: 62,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.deepPurple,
                      child: IconButton(
                        onPressed: () async{
                          // 
                          await pickImg();
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
                      buildTextField("Student Name", _nameController),
                      buildTextField("Mobile Number", _mobileController),
                      buildTextField("Email", _emailController),
                      buildTextField("Roll Number", _rollController),
                      buildTextField("Father's Name", _fatherController),
                      buildTextField("Mother's Name", _motherController),
                      buildTextField("Address", _addressController),
                      buildTextField("Date of Birth", _dobController),
                      buildTextField("Admission Number", _admController),
                      buildTextField("Password", _passwordController),
                      buildTextField("Confirm Password", _repasswordController),
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
                      child: ref.watch(isLoadingProvider)
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
          ),
        ],
      ),
    );
  }

  Widget buildTextField(String hint, TextEditingController controller) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          // labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
      ),
    );
  }

  void clearTextFields() {
    _nameController.clear();
    _mobileController.clear();
    _dobController.clear();
    _admController.clear();
    _fatherController.clear();
    _motherController.clear();
    _addressController.clear();
    _emailController.clear();
    _passwordController.clear();
    _repasswordController.clear();
    _rollController.clear();
  }

  bool _validator() {
    return _nameController.text.isNotEmpty &&
        _mobileController.text.isNotEmpty &&
        _dobController.text.isNotEmpty &&
        _admController.text.isNotEmpty &&
        _fatherController.text.isNotEmpty &&
        _motherController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _repasswordController.text.isNotEmpty &&
        _rollController.text.isNotEmpty;
  }

  bool _isPasswordValid() {
    return _passwordController.text == _repasswordController.text;
  }

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
      createStudentData(
        context,
        _nameController.text.trim(),
        _mobileController.text.trim(),
        _dobController.text.trim(),
        _admController.text.trim(),
        _fatherController.text.trim(),
        _motherController.text.trim(),
        _addressController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _rollController.text.trim(),
      );
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
