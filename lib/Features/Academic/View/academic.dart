import 'package:admin/Screens/Academic/Widget/customGridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Academic extends ConsumerWidget {
  const Academic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.fromLTRB(
        70, 0,70,50
        ),
        child: CustomGridView(context, ref)),
    );
  }
}