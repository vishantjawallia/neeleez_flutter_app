import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({Key? key}) : super(key: key);

  @override
  _SocialMediaState createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
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
                    'Social Media'.tr,
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
              'Facebook',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Facebook',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            Text(
              'https://www.facebook.com/kkvbkv',
              style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 14),
            //
            Text(
              'Twitter',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Twitter',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            Text(
              'https://www.twitter.com/@jvjviv',
              style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 14),
            Text(
              'Instagram',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Instagram',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            Text(
              'https://www.instagram.com/kayyenwecare',
              style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 14),
            Text(
              'Linked In',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            const CustomTextField(
              name: 'Linked In',
              prefixIconPath: MyIcon.officeBuilding,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Only Enter Username/Userld of your social media account',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14),

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
