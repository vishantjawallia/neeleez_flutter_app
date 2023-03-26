import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class ModalProgressHUD extends StatelessWidget {
  final bool? load;
  final double? opacity;
  final Color? color;
  final Widget? progressIndicator;
  final Offset? offset;
  final bool? dismissible;
  final Widget? child;

  const ModalProgressHUD({
    Key? key,
    required this.load,
    this.opacity = 0.3,
    // this.opacity = 0.3,
    this.color = Colors.grey,
    // this.color = Palettes.grey1,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!load!) return child!;

    Widget layOutProgressIndicator;
    if (offset == null) {
      layOutProgressIndicator = Center(
        child: loader(),
      );
    } else {
      layOutProgressIndicator = Positioned(
        left: offset!.dx,
        top: offset!.dy,
        child: loader(),
      );
    }

    return Stack(
      children: [
        child!,
        Opacity(
          opacity: opacity!,
          child: ModalBarrier(
            dismissible: dismissible!,
            color: color,
          ),
        ),
        layOutProgressIndicator,
      ],
    );
  }
}

Widget loader() {
  return Container(
    padding: const EdgeInsets.all(36),
    decoration: BoxDecoration(
      color: Palettes.white,
      borderRadius: BorderRadius.circular(12),
    ),
    child: const CircularProgressIndicator(
      strokeWidth: 3,
      color: Palettes.primary,
    ),
  );
}
