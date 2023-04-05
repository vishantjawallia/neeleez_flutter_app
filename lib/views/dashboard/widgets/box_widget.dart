import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class BoxWidget extends StatelessWidget {
  final Color? color;
  final String? head1;
  final String? icon;
  final String? head2;
  final String? dsc;
  const BoxWidget({
    Key? key,
    required this.color,
    required this.icon,
    required this.dsc,
    required this.head1,
    required this.head2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Text(
              head1 ?? 'Clicks'.tr,
              style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Material(
              elevation: 5,
              shadowColor: color ?? Palettes.primary,
              borderRadius: BorderRadius.circular(14),
              color: color ?? Palettes.primary,
              surfaceTintColor: color ?? Palettes.primary,
              child: Container(
                height: 68,
                width: 44.w,
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.expand,
                  children: <Widget>[
                    const Positioned(
                      top: 6,
                      left: 1,
                      child: Icon(
                        Icons.arrow_back,
                        color: Palettes.white,
                        size: 20,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          heightFactor: 0.8,
                          child: Text(
                            dsc ?? '0'.tr,
                            style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        Text(
                          head2 ?? 'Total Clicks'.tr,
                          style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
