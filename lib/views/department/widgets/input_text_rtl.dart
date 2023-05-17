import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/my_icon.dart';
import '../../../../../config/palettes.dart';
import '../../../../../widgets/custom_text_field.dart';

class InputTextRtl extends StatelessWidget {
  final TextEditingController? controller;
  final String? text;
  const InputTextRtl({
    Key? key,
    this.controller,
    this.text,
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
            // text!,
            'اسم الشركة',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black, fontSize: Get.textTheme.bodyLarge!.fontSize! + 2),
            textAlign: TextAlign.right,
          ),
          // منتال
          CustomTextField(
            controller: controller,
            name: 'اسم الشرك',
            // name: text,
            prefixIconPath: MyIcon.officeBuilding,
            isCustomRtl: true,
            outlineBorder: true,
          ),

          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
