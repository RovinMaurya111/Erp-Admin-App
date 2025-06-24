import 'package:admin/Schedule/stateNotifier/scheduleOnTapNotifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scheduleListTileOnClickProvider = StateProvider.family<bool, int>((ref, itemId) {
  return false;
});
// 
// 
final onClickNotifierProvider = StateNotifierProvider<scheduleListTileOnOnTapNotifier, int?>(
  (ref) {
    return scheduleListTileOnOnTapNotifier();
  },
);
