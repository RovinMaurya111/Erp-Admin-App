import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:admin/Login/Service/authService.dart';
import 'package:admin/Global/Widget/customTextField.dart';

class LoginScreen extends StatelessWidget {
TextEditingController mobile_controller = TextEditingController();
TextEditingController password_controller = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login'),
      ),
      body: SafeArea(child: Padding(padding: EdgeInsets.symmetric(horizontal: 35), child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Customtextfield("Mobile Number", mobile_controller, Icon(Icons.phone)), 
        Gap(25),
        Customtextfield("Password", password_controller, Icon(Icons.password)),
        Gap(25),
        ElevatedButton(onPressed: () async{
          await Authservice().login(mobile_controller.text.toString(), password_controller.text.toString());
        }, style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 45)), child: Text("Login"),)
      ],),))
    );
  }
}