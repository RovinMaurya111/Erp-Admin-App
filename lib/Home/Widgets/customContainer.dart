import 'package:admin/Home/Provider/onHoverProvider.dart';
import 'package:admin/Home/Widgets/customText.dart';
import 'package:admin/Global/Provider/Router/global_router.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomContainer {
  final int index;
  final WidgetRef ref;
  final String path;
  final String text;

  CustomContainer(this.index, this.ref, this.path, this.text);

  Widget getContainer() {
    final route = ref.read(Global_Router);
    final isHovering = ref.watch(onHoverProvider(index));

    Widget container = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: isHovering ? Colors.orange.withOpacity(0.7) : Colors.black.withOpacity(0.3),
            blurRadius: isHovering ? 30 : 15,
            spreadRadius: isHovering ? 1.5 : 0.5,
            offset: const Offset(0, 9),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () {
          switch (index) {
            case 0:
              route.go('/manageTeachers');
              break;
            case 1:
              route.go('/manageTeachers');
              break;
            default:
              break;
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovering ? Colors.deepOrange : Colors.black,
              width: isHovering ? 2 : 1,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SvgPicture.asset(
                    path,
                    width: 150,
                    height: 80,
                    fit: BoxFit.cover,
                    allowDrawingOutsideViewBox: true,
                  ),
                  const Gap(15),
                  customText(text),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // switch returns different container (for now all same — you can modify)
    switch (index) {
      case 0:
        return container;
        break;
      case 1:
        return container;
        break;
      case 2:
        return container;
      case 3:
        return container;
      default:
        return container;
    }
  }
}
