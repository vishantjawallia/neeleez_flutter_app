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
          child: Image.asset(
            MyImage.dashBack,
            fit: BoxFit.contain,
            // scale: 2,
            // height: 320,
            // height: ,
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
