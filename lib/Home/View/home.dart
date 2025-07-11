import 'package:admin/Home/Provider/onHoverProvider.dart';
import 'package:admin/Home/Widgets/customContainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
// 
// 
List dashboardFunctionsList = [
  {
    'path' : "assets/svg/teacher.svg",
    'text': "Manage Teachers",
  },
  // 
  {
    'path' : "assets/svg/schedule_logo.svg",
    'text': "Today Class",
  }
];
// 
// 
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(80,20,80,20),
        child: GridView.builder(
          itemCount: 2,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 90,
            mainAxisSpacing: 40,
            childAspectRatio: 2,
          ),
          itemBuilder: (context, index) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) {
                ref.read(onHoverProvider(index).notifier).state = true;
              },
              onExit: (_) {
                ref.read(onHoverProvider(index).notifier).state = false;
              },
              child: CustomContainer(
                index,
                ref,
                dashboardFunctionsList[index]['path'],
                dashboardFunctionsList[index]['text'],
              ).getContainer(),
            );
          },
        ),
      ),
    );
  }

}
