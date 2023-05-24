import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class FreelancerSwitch extends StatelessWidget {
  final bool? initialValue;
  final Color? color;

  final void Function()? onChange;

  const FreelancerSwitch({
    super.key,
    required this.onChange,
    required this.initialValue,
    this.color,
    // required this.value,
  });

  // bool? value = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: color ?? Palettes.primary,
          width: 0.7,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Are You a Freelancer?'.tr,
            style: Get.textTheme.bodyLarge!.copyWith(color: color ?? Palettes.black),
          ),
          Container(
            decoration: BoxDecoration(
              color: Palettes.grey1,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => onChange!(),
                  child: Align(
                    widthFactor: 0.85,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      decoration: BoxDecoration(
                        color: !initialValue! ? (color ?? Palettes.primary) : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'No'.tr,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          // color: Palettes.white,
                          color: color == null ? Palettes.white : Palettes.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => onChange!(),
                  child: Align(
                    widthFactor: 0.85,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
                      decoration: BoxDecoration(
                        color: initialValue! ? (color ?? Palettes.primary) : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Yes'.tr,
                        style: Get.textTheme.bodyLarge!.copyWith(
                          color: color == null ? Palettes.white : Palettes.primary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
