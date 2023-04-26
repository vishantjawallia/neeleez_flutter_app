import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class CustomListTile extends StatelessWidget {
  final String? text;
  final String? imagePath;
  final Color? imagePathBackground;
  const CustomListTile({
    super.key,
    this.text,
    this.imagePath,
    this.imagePathBackground,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(8),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                width: 0.4,
                color: Palettes.grey1.withOpacity(0.5),
              ),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.only(right: 30),
              leading: Container(
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                  color: (imagePathBackground ?? Palettes.black).withOpacity(0.1),
                ),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Image.asset(
                    imagePath ?? MyIcon.staffDesignation,
                  ),
                ),
              ),
              title: Align(
                child: Text(
                  text ?? 'Department'.tr,
                  style: Get.textTheme.titleLarge!.copyWith(
                    color: Palettes.black,
                  ),
                  textAlign: TextAlign.center,
                  // textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
