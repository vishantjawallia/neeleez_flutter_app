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
    super.key,
    required this.load,
    this.opacity = 0.3,
    this.color = Colors.grey,
    this.progressIndicator = const CircularProgressIndicator(),
    this.offset,
    this.dismissible = false,
    required this.child,
  });
  @override
  Widget build(BuildContext context) {
    // if (!load!) return child!;

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
        load!
            ? Visibility(
                visible: load!,
                child: Stack(
                  children: [
                    Opacity(
                      opacity: opacity!,
                      child: ModalBarrier(
                        dismissible: dismissible!,
                        color: color,
                      ),
                    ),
                    layOutProgressIndicator,
                  ],
                ),
              )
            : const SizedBox(),
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

Future<Future<Object?>> loadingBar(
  _,
) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: loader(),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}
