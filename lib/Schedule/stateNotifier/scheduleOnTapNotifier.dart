import 'package:flutter_riverpod/flutter_riverpod.dart';

class scheduleListTileOnOnTapNotifier extends StateNotifier<int?>{
  scheduleListTileOnOnTapNotifier() : super(null);

  void expose(int index) {
    state = index;
  }
}