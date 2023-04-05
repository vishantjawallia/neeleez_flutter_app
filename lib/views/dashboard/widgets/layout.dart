import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';

class DashboardLayout extends StatelessWidget {
  final Widget? child;
  const DashboardLayout({
    Key? key,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned(
          child: Container(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              child: Image.asset(
                MyImage.dashBack,
                fit: BoxFit.fill,
                scale: 2,
                height: 350,
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 40),
          child: child!,
        ),
      ],
    );
  }
}
