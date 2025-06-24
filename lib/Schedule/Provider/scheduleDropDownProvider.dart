
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleDayProvider = StateProvider<String>((ref) {
  return 'Select Day';
},);
// 
// 
final scheduleClassProvider = StateProvider<String>((ref) {
  return 'Select Class';
},);
// 

// 
final schedulePeriodProvider = StateProvider<String>((ref) {
  return 'Period';
},);
// 
// 
final scheduleTeacherProvider = StateProvider<String>((ref) {
  return 'Select Teacher';
},);
// 
// 
final scheduleSectionProvider = StateProvider<String>((ref) {
  return 'Sec';
},);
// 
// 
final scheduleSubjectProvider = StateProvider<String>((ref) {
  return 'Subject';
},);