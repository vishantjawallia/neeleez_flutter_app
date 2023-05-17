import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

import '../../../config/my_icon.dart';
import '../../../config/palettes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../department_view_model.dart';
import '../widgets/input_text_rtl.dart';

class AddItem extends StatelessWidget {
  const AddItem({
    super.key,
    required this.viewModel,
  });

  final DepartmentViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Department Name (En)',
          style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
          textAlign: TextAlign.right,
        ),
        CustomTextField(
          widgetMargin: const EdgeInsets.only(top: 4),
          controller: viewModel.department,
          name: 'Department Name (En)',
          prefixIconPath: MyIcon.telephone,
          prefixIconColor: Palettes.primary,
          outlineBorder: true,
        ),
        const InputTextRtl(
          text: '',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Active Status',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            Switch(
              activeColor: Palettes.primary,
              value: viewModel.status,
              onChanged: viewModel.statusChanged,
            )
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomButton(
              width: 42.w,
              height: 22,
              backgroundColor: Palettes.white,
              text: 'Back',
              rippleColor: Palettes.grey1.withOpacity(0.1),
              borderColor: Palettes.primary,
              textColor: Palettes.primary,
              onTap: viewModel.backOnTap,
            ),
            CustomButton(
              width: 42.w,
              height: 22,
              backgroundColor: Palettes.primary,
              textColor: Palettes.white,
              borderColor: Palettes.primary,
              onTap: viewModel.saveOnTap,
              text: 'Save',
            ),
          ],
        ),
      ],
    );
  }
}
