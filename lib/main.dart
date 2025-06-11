import 'package:admin/Global/Provider/Router/global_router.dart';
import 'package:flutter/material.dart';
import 'package:admin/Global/Theme/darkAndLight.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}
// 
class _MyAppState extends ConsumerState<MyApp> {
@override
  Widget build(BuildContext context) {
  final router = ref.watch(Global_Router);
  // 
  return MaterialApp.router(
  // 
  routerConfig: router,
  
  // 
  themeMode: ThemeMode.system,
  theme: DarkAndLight.lightTheme,
  darkTheme: DarkAndLight.darkThem,


  );
  }
}