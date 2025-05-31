import 'dart:convert';

import 'package:http/http.dart' as http;

class Authservice {
   final String _loginUrl = "https://feb-chen-kenneth-induced.trycloudflare.com/students/login";

    Future <void> login(String mobileNumber, String password) async{

        try{
        var response =  await http.post( Uri.parse(_loginUrl), 
        body: jsonEncode({
        "mobile_number": mobileNumber,
        "password": password
        }), 
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',});
        switch(response.statusCode){
            case 200:
                print(response.body);
                print("Login Success");
                break;
            case 400:
                print("Login Failed");
                break;
            default:
                print(response.statusCode);
                print(response.body);
                break;
        }
        }catch(e){
            print("Error $e");
        }
    
        
}
}