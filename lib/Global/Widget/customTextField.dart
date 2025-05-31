import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String hint;
  Icon icon;
  TextEditingController controller;
  Customtextfield(this.hint, this.controller, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        label: icon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      ),
    );
  }
}