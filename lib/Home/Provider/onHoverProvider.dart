  import 'package:flutter_riverpod/flutter_riverpod.dart';

final onHoverProvider = StateProvider.family<bool, int>((ref, index) => false);