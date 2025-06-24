import 'dart:convert';

import 'package:http/http.dart' as http;

 readTeacherService() async {
  final uri = Uri.parse("http://localhost:3000/admin/teacher/teachersList");
  //
  final response = await http.get(
    uri,
    headers: {'Content-Type': 'application/json'},
  );

  final list = (jsonDecode(response.body));
  // print(list);
  return list;
  
  
}
