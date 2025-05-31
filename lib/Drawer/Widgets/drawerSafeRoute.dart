import 'package:admin/Global/Provider/Router/global_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 drawerSafeRoute(
    WidgetRef ref,
    String routeName,
  ) {
    final route = ref.read(Global_Router);
    route.go(routeName);
  }