
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
  return 'Select Period';
},);
// 
// 
final scheduleTeacherProvider = StateProvider<String>((ref) {
  return 'Select Teacher';
},);