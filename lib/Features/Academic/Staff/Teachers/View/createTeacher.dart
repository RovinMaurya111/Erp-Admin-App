import 'dart:typed_data';
import 'dart:ui' show ImageFilter;
import 'package:admin/Features/Academic/Staff/Teachers/Provider/datePickerProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Provider/dropDownValueProvider.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Provider/radioButton.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Service/Create/createTeacherBackend.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/DropDownButton/customDropDownButton.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/customRadioButton.dart';
import 'package:admin/Features/Academic/Staff/Teachers/Widget/dateContainer.dart';
import 'package:admin/Features/Academic/Student/CrudStudent/Provider/isLoadingProvider.dart';
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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _parentsController = TextEditingController();
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
                            buildTextField("Teacher Name", _nameController),

                            buildTextField("Email", _emailController),

                            buildTextField("Mobile", _contactController),
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
                        customRadioButton(ref),
                        CustomDropDownButton().classButton(ref, context),
                        CustomDropDownButton().subjectButton(ref, context),
                        CustomDropDownButton().qualificationButton(
                          ref,
                          context,
                        ),
                        CustomDropDownButton().experienceButton(ref, context),
                        DateContainer(
                          context,
                          ref,
                        ).birthDateContainer(ref.watch(birthDateProvider)),
                        DateContainer(
                          context,
                          ref,
                        ).joinDateContainer(ref.watch(joiningDateProvider)),
                        CustomDropDownButton().genderButton(ref, context),
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
    _emailController.clear();
    _contactController.clear();
    _parentsController.clear();
    _addressController.clear();
    _passwrodController.clear();
    _repasswrodController.clear();
  }

  //
  //
  void clearAllDropDownList() {
    ref.read(subjectProvider.notifier).state = 'Select Subject';
    ref.read(qualificationProvider.notifier).state = 'Select Qualification';
    ref.read(classProvider.notifier).state = 'Select Class';
    ref.read(experienceProvider.notifier).state = 'Select Experience';
    ref.read(genderProvider.notifier).state = 'Select Gender';
    ref.read(birthDateProvider.notifier).state = 'Select DOB';
    ref.read(joiningDateProvider.notifier).state = 'Select Joining';
  }
  //
  //

  bool _validator() {
    return _nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _contactController.text.isNotEmpty &&
        _parentsController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _passwrodController.text.isNotEmpty;
  }

  //
  //
  bool dropDownValueValidator() {
    return ref.read(subjectProvider) == 'Select Subject' ||
        ref.read(qualificationProvider) == 'Select Qualification' ||
        ref.read(experienceProvider) == 'Select Experience' ||
        ref.read(genderProvider) == 'Select Gender';
  }

  //
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

    if (dropDownValueValidator()) {
      MotionToast.error(
        description: const Text("Select All Drop Down List"),
      ).show(context);
      return;
    }

    if (ref.read(birthDateProvider) == 'Select DOB' ||
        ref.read(joiningDateProvider) == 'Select Joining') {
      MotionToast.error(description: const Text("Pick Date")).show(context);
      return;
    }

    if (ref.read(radioButtonProvider)) {
      if (ref.read(classProvider) == 'Select Class') {
        MotionToast.error(
          description: const Text("Please Select if (Yes) Class Teacher"),
        ).show(context);
        return;
      }
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
        subject: ref.read(subjectProvider),
        qualification: ref.read(qualificationProvider),
        email: _emailController.text.toString(),
        classteacher: ref.read(radioButtonProvider),
        wichclass: ref.read(classProvider),
        gender: ref.read(genderProvider),
        contact: _contactController.text.toString(),
        parents: _parentsController.text.toString(),
        dob: ref.read(birthDateProvider),
        dateOfJoining: ref.read(joiningDateProvider),
        experience: ref.read(experienceProvider),
        address: _addressController.text.toString(),
        password: _passwrodController.text.toString(),
        imagedata: _imagedata ?? {},
      );

      await createTeacher.createTeachersData();

      clearTextFields();
      clearAllDropDownList();
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
