import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/custom_drop_down.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/custom_multi_drop_down.dart';

import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';

import '../components/freelancer_switch.dart';

class GeneralInfo extends StatefulWidget {
  const GeneralInfo({Key? key}) : super(key: key);

  @override
  _GeneralInfoState createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
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
                    'General Info'.tr,
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
            // SizedBox(
            //   height: 88,
            //   width: 99,
            //   child: CustomDropdown(
            //     // leadingIcon: ,
            //     items: [
            //       DropdownItem(
            //         value: 'Hello',
            //         child: Container(
            //           child: const Text('Hello'),
            //         ),
            //       ),
            //     ],
            //     onChange: (int) {},

            //     dropdownButtonStyle: const DropdownButtonStyle(height: 44, width: 33),
            //     child: Container(
            //       child: const Text(
            //         'Hllo',
            //         style: TextStyle(color: Palettes.black),
            //       ),
            //     ),
            //   ),
            // ),
            // const DropdownButtonExample(
            //   list: ['HEllo', 'Go', 'N'],
            // ),
            Align(
              alignment: Alignment.centerRight,
              child: Stack(
                children: [
                  const UrlImage(
                    width: 100,
                    height: 100,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      decoration: const BoxDecoration(color: Palettes.orange, shape: BoxShape.circle),
                      height: 20,
                      width: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            FreelancerSwitch(
              onChange: (value) {
                log(value.toString());
              },
            ),
            const SizedBox(height: 14),
            Text(
              'Company Name',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Company Name',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            //
            Text(
              'Tagline',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Tagline',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            // const SizedBox(height: 34),
            // const CustomDropDown(
            //   list: ['Hel'],
            //   name: 'Tagline',
            //   prefixIconPath: MyIcon.officeBuilding,
            //   prefixIconColor: Palettes.primary,
            // ),
            // const SizedBox(height: 74),
            const SizedBox(height: 14),
            Text(
              'Company Establishment Year',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Company Establishment Year',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Business Category',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomDropDown(
              list: ['Hello', 'Go'],
              name: 'Business Category',
              prefixIconPath: MyIcon.portfolio,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Business Sub-Category',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomDropDown(
              list: ['Hello', 'Go'],
              name: 'Business Sub-Category',
              prefixIconPath: MyIcon.portfolio,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Services For',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomDropDown(
              list: ['Hello', 'Go'],
              name: 'Services For',
              prefixIconPath: MyIcon.sex,
              prefixIconColor: Palettes.primary,
            ),

            const SizedBox(height: 20),
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information'.tr,
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
              'Whatsapp No',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Whatsapp No',
              prefixIconPath: MyIcon.whatsapp,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Telephone',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Telephone',
              prefixIconPath: MyIcon.telephone,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Email',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Email',
              prefixIconPath: MyIcon.mail,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Website',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Website',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),

            const SizedBox(height: 20),
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Business'.tr,
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
              'Amenities',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomMultiDropDown(
              list: const ['Hello', 'Go', 'How are', 'You'],
              name: 'Amenities',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
              onChanged: (List<String>? value) {
                log(value!.toString());
              },
            ),
            const SizedBox(height: 14),
            Text(
              'Additional Information',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              // maxLines: 10,
              // maxLength: 200,
              // height: 80,
              // prefixPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
              // maxLengthEnforcement: MaxLengthEnforcement.none,
              name: 'Additional Information',
              prefixIconPath: MyIcon.information,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 20),

            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () {},
              ),
            ),
            const SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
