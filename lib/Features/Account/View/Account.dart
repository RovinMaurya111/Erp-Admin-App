import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Account Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}