import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/custom_drop_down.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';

class Location extends StatelessWidget {
  final List<String>? countryList;
  final List<String>? stateList;
  final List<String>? cityList;
  final String? countrySelected;
  final String? stateSelected;
  final String? citySelected;
  final TextEditingController? googleAddressController;
  final TextEditingController? additionalAddressController;
  const Location({
    Key? key,
    required this.countryList,
    required this.stateList,
    required this.cityList,
    required this.countrySelected,
    required this.stateSelected,
    required this.citySelected,
    required this.googleAddressController,
    required this.additionalAddressController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location'.tr,
                    style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 3,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Palettes.red,
                    ),
                    // child: ,
                  )
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Country',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              value: '',
              list: countryList,
              name: 'Country',
              prefixIconPath: MyIcon.place,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'State/Province',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              value: '',
              list: stateList,
              name: 'State/Province',
              prefixIconPath: MyIcon.imgLocationState,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'City',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              list: cityList,
              name: 'City',
              prefixIconPath: MyIcon.imgLocationCity,
              prefixIconColor: Palettes.primary,
              value: '',
            ),
            const SizedBox(height: 14),
            Text(
              'Google Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: googleAddressController,
              name: 'Google Address',
              prefixIconPath: MyIcon.place,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Additional Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: additionalAddressController,
              name: 'Additional Address',
              prefixIconPath: MyIcon.place,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'To update the location, please contact our Support team',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
