import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/my_icon.dart';
import '../../../../../config/palettes.dart';
import '../../../../../widgets/custom_text_field.dart';

class InputTextRtl extends StatelessWidget {
  final TextEditingController? controller;
  const InputTextRtl({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12.5),
          Text(
            'اسم الشركة',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black, fontSize: Get.textTheme.bodyLarge!.fontSize! + 2),
            textAlign: TextAlign.right,
          ),
          // منتال
          CustomTextField(
            controller: controller,
            name: 'اسم الشرك',
            prefixIconPath: MyIcon.officeBuilding,
            isCustomRtl: true,
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
