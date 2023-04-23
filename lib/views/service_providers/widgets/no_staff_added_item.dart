import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';

import '../../../config/palettes.dart';

class NoStaffItem extends StatelessWidget {
  const NoStaffItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 30),
            child: Image.asset(
              MyImage.imgEmptyData3x,
              height: 140,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'No Staff Added Yet',
            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
          ),
          const SizedBox(height: 8),
          Text(
            'There are no staff to display, add staff',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
          ),
        ],
      ),
    );
  }
}
