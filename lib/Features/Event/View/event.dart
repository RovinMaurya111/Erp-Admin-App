import 'package:flutter/material.dart';

class Event extends StatelessWidget {
  const Event({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Event Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}