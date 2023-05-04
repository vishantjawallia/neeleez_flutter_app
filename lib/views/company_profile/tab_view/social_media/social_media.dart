import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/social_media/social_media_provider.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';

class SocialMedia extends StatelessWidget {
  final TextEditingController? facebookController;
  final TextEditingController? twitterController;
  final TextEditingController? instagramController;
  final TextEditingController? linkedInController;
  final void Function()? onSocialSave;
  const SocialMedia({
    Key? key,
    required this.facebookController,
    required this.twitterController,
    required this.instagramController,
    required this.linkedInController,
    required this.onSocialSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final social = Provider.of<SocialMediaProvider>(context);
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
            CustomTextField(
              controller: facebookController,
              name: 'Facebook',
              prefixIconPath: MyIcon.socialFacebook,
              prefixIconColor: const Color.fromRGBO(10, 28, 83, 1),
              suffixIconPath: facebookController!.text.isEmpty ? '' : MyIcon.checked1,
            ),
            facebookController!.text.isEmpty
                ? const SizedBox()
                : Text(
                    'https://www.facebook.com/${facebookController!.text}',
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
            CustomTextField(
              controller: twitterController,
              name: 'Twitter',
              prefixIconPath: MyIcon.socialTwitter,
              prefixIconColor: Palettes.primary,
              suffixIconPath: facebookController!.text.isEmpty ? '' : MyIcon.checked1,
            ),
            twitterController!.text.isEmpty
                ? const SizedBox()
                : Text(
                    'https://www.twitter.com/${twitterController!.text}',
                    style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                    textAlign: TextAlign.right,
                  ),
            const SizedBox(height: 14),
            Text(
              'Instagram',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: instagramController,
              name: 'Instagram',
              prefixIconPath: MyIcon.socialInstagram,
              suffixIconPath: instagramController!.text.isEmpty ? '' : MyIcon.checked1,
              prefixIconColor: Palettes.primary,
            ),
            instagramController!.text.isEmpty
                ? const SizedBox()
                : Text(
                    'https://www.instagram.com/${instagramController!.text}',
                    style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                    textAlign: TextAlign.right,
                  ),
            const SizedBox(height: 20),
            Text(
              'Linked In',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: linkedInController,
              name: 'Linked In',
              prefixIconPath: MyIcon.socialLinkedin,
              prefixIconColor: Palettes.primary,
              suffixIconPath: linkedInController!.text.isEmpty ? '' : MyIcon.checked1,
            ),
            linkedInController!.text.isEmpty
                ? const SizedBox()
                : Text(
                    'https://www.instagram.com/${linkedInController!.text}',
                    style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                    textAlign: TextAlign.right,
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
                onTap: onSocialSave,
              ),
            ),
            const SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
