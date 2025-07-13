import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> scheduleReadTeachers()async {
  final response = await http.get(
    Uri.parse("http://localhost:3000/admin/teacher/teachersList"),
    headers: {'Content-Type': 'application/json'},
  );
  return jsonDecode(response.body);
}