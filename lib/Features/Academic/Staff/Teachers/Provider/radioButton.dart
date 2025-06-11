import 'package:flutter_riverpod/flutter_riverpod.dart';

final radioButtonProvider = StateProvider<bool>(
  (ref) {
    return false;
  },
);