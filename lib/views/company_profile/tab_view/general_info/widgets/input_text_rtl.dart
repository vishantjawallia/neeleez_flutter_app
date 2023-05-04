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
          const SizedBox(height: 14),
          Text(
            'Company Name',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: controller,
            name: 'Company Name',
            prefixIconPath: MyIcon.officeBuilding,
            isCustomRtl: true,
          ),
          const SizedBox(height: 14),
        ],
      ),
    );
  }
}
