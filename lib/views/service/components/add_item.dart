

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

import '../../../config/my_icon.dart';
import '../../../config/palettes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/url_image.dart';
import '../service_view_model.dart';
import '../widgets/input_text_rtl.dart';

class AddItem extends StatelessWidget {
  const AddItem(this.viewModel, {super.key});

  final ServiceViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add New Service'.tr,
                    style: Get.textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Palettes.black,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 3,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Palettes.red,
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  const UrlImage(
                    width: 80,
                    height: 80,
                    url: '',
                  ),
                  Positioned(
                    bottom: 2.5,
                    right: 2.5,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Palettes.orange,
                        shape: BoxShape.circle,
                      ),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            Text(
              'Title (En)',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Title (En)',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const InputTextRtl(
              text: '',
            ),
            // const SizedBox(height: 8),
            Text(
              'Title (App)',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Title (App)',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 8),
            Text(
              'Price',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Price',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 8),
            Text(
              'Duration In Minutes',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Duration In Minutes',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 8),
            Text(
              'Select Group',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Select Group',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Service',
                  style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
                  textAlign: TextAlign.right,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.help,
                      color: Palettes.primary,
                    ),
                    Switch(
                      activeColor: Palettes.primary,
                      value: viewModel.status,
                      onChanged: viewModel.statusChanged,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Format Service',
                  style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
                  textAlign: TextAlign.right,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.help,
                      color: Palettes.primary,
                    ),
                    Switch(
                      activeColor: Palettes.primary,
                      value: viewModel.status,
                      onChanged: viewModel.statusChanged,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Composed Service',
                  style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
                  textAlign: TextAlign.right,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.help,
                      color: Palettes.primary,
                    ),
                    Switch(
                      activeColor: Palettes.primary,
                      value: viewModel.status,
                      onChanged: viewModel.statusChanged,
                    ),
                  ],
                )
              ],
            ),
            // const SizedBox(height: 8),
            Text(
              'Description',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              widgetMargin: const EdgeInsets.only(top: 4),
              controller: viewModel.name,
              name: 'Description',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 40),
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
        ),
      ),
    );
  }
}
