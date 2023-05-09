import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/social_media/social_media_provider.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';

class SocialMedia extends StatefulWidget {
  // final void Function()? onSocialSave;
  final CompanyProfileViewModel viewModel;
  const SocialMedia({
    Key? key,
    // required this.onSocialSave,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final general = Provider.of<SocialMediaProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 100), () {
      general.loadItem(widget.viewModel.genInfo);
    });
  }

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
              controller: social.facebook,
              name: 'Facebook',
              prefixIconPath: MyIcon.socialFacebook,
              prefixIconColor: const Color.fromRGBO(10, 28, 83, 1),
              suffixIconPath: social.facebook.text.isEmpty ? '' : MyIcon.checked1,
              outlineBorder: true,
            ),
            social.facebook.text.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'https://www.facebook.com/${social.facebook.text}',
                      style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
            const SizedBox(height: 14),
            //
            Text(
              'Twitter',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: social.twitter,
              name: 'Twitter',
              prefixIconPath: MyIcon.socialTwitter,
              prefixIconColor: Palettes.primary,
              suffixIconPath: social.twitter.text.isEmpty ? '' : MyIcon.checked1,
              outlineBorder: true,
            ),
            social.twitter.text.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'https://www.twitter.com/${social.twitter.text}',
                      style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
            const SizedBox(height: 14),
            Text(
              'Instagram',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: social.instagram,
              name: 'Instagram',
              prefixIconPath: MyIcon.socialInstagram,
              suffixIconPath: social.instagram.text.isEmpty ? '' : MyIcon.checked1,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            social.instagram.text.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'https://www.instagram.com/${social.instagram.text}',
                      style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                      textAlign: TextAlign.right,
                    ),
                  ),
            const SizedBox(height: 20),
            Text(
              'Linked In',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: social.linkedIn,
              name: 'Linked In',
              prefixIconPath: MyIcon.socialLinkedin,
              prefixIconColor: Palettes.primary,
              suffixIconPath: social.linkedIn.text.isEmpty ? '' : MyIcon.checked1,
              outlineBorder: true,
            ),
            social.linkedIn.text.isEmpty
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      'https://www.instagram.com/${social.linkedIn.text}',
                      style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                      textAlign: TextAlign.right,
                    ),
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
                borderColor: Palettes.primary, onTap: () {},
                // onTap: onSocialSave,
              ),
            ),
            const SizedBox(height: 34),
          ],
        ),
      ),
    );
  }
}
