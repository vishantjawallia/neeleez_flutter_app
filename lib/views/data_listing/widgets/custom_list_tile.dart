import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
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
              contentPadding: EdgeInsets.zero,
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  ),
                  color: Palettes.black.withOpacity(0.2),
                ),
                width: 60,
                child: Image.asset(
                  MyIcon.staffDesignation,
                ),
              ),
              minLeadingWidth: 152.5,
              title: Text(
                'Department'.tr,
                style: Get.textTheme.titleLarge!.copyWith(
                  color: Palettes.black,
                ),
                // textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
