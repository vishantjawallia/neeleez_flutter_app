import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';

class DefaultLayout extends StatelessWidget {
  final Widget? child;
  final double? height;
  const DefaultLayout({
    Key? key,
    this.child, this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        Positioned(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            child: Image.asset(
              MyImage.dashBack,
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: height ?? 135,
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
