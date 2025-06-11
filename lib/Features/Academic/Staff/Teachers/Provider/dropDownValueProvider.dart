import 'package:flutter_riverpod/flutter_riverpod.dart';

// classteacher Provider

// subject provider
final subjectProvider = StateProvider<String>((ref) {
  return 'Select Subject';
},);
// 

// Qualification Provider
final qualificationProvider = StateProvider((ref) {
  return 'Select Qualification';


  
},);
// 
// Class Provier
final classProvider = StateProvider<String>((ref){
  return 'Select Class';
});
// 
// Experience Provider
final experienceProvider = StateProvider<String>((ref) {
  return 'Select Experience';
},);
// 
// Gender Provider
final genderProvider = StateProvider((ref) {
  return 'Select Gender';
},);
