import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/my_Image.dart';
import '../../../config/my_icon.dart';
import '../../../config/palettes.dart';

class SingleListTile extends StatelessWidget {
  final void Function(BuildContext context)? onCrossTap;
  final void Function()? onTap;
  const SingleListTile({
    super.key,
    required this.onCrossTap,
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
                color: Colors.blue.withOpacity(0.1),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Image.asset(
                  MyImage.contolFormat,
                ),
              ),
            ),
            title: Text(
              'Designation'.tr,
              style: Get.textTheme.titleLarge!.copyWith(
                color: Palettes.grey3,
                fontWeight: FontWeight.w600,
              ),
            ),
            horizontalTitleGap: 10,
            trailing: GestureDetector(
              onTap: () => onCrossTap!(context),
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
