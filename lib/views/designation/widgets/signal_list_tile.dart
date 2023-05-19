import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class SingleListTile extends StatelessWidget {
  final void Function()? onCrossTap;
  final void Function()? onTap;
  final String? name;
  const SingleListTile({
    super.key,
    required this.onCrossTap,
    required this.name,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 0.4,
              color: Palettes.grey1.withOpacity(0.5),
            ),
          ),
          child: ListTile(
            onTap: onTap,
            contentPadding: const EdgeInsets.only(right: 16),
            leading: Container(
              width: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                color: Colors.red.withOpacity(0.1),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Image.asset(
                  MyImage.contolDesignation,
                ),
              ),
            ),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name!,
                  // 'Designation'.tr,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: Palettes.grey3,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Active'.tr,
                  style: Get.textTheme.bodyLarge!.copyWith(
                    color: Palettes.green700,
                  ),
                ),
              ],
            ),
            horizontalTitleGap: 10,
            trailing: GestureDetector(
              onTap: onCrossTap,
              child: Image.asset(
                MyIcon.iconIncorrect,
                fit: BoxFit.fill,
                height: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
