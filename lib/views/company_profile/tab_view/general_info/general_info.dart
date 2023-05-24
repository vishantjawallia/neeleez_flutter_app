// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';
import 'package:provider/provider.dart';

import '../../company_profile_view_model.dart';
import '../../components/freelancer_switch.dart';
import 'general_info_provider.dart';
import 'widgets/additionl_info_text_field.dart';
import 'widgets/custom_drop_down1.dart';
import 'widgets/custom_multi_drop_down.dart';
import 'widgets/input_text_rtl.dart';
import 'widgets/whats_app_input_field.dart';

class GeneralInfo extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  const GeneralInfo(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralInfoProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      // controller: general.scrollController,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            _generalInfoBox(context, general),
            _contactInfoBox(context, general),
            _aboutBusinessBox(general),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () async {
                  int? bC = int.tryParse(viewModel.businessCategoryId ?? "");
                  log("======>${general.companyName.text}");
                  log("======>${general.email.text}");
                  viewModel.onGeneralSave(
                    context,
                    aboutUs: general.additionalInfo.text,
                    email: general.email.text,
                    tel1: general.telephone.text,
                    nameEn: general.companyName.text,
                    nameAr: general.companyName2.text,
                    isFreeLancer: general.isFreelancer,
                    tagLine: general.tagline.text,
                    whatsapp: general.whatsAppNo.text,
                    url: general.website.text,
                    genderId: int.tryParse(viewModel.serviceForId!),
                    businessServiceId: bC,
                  );
                },
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  _aboutBusinessBox(general) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'About Business'.tr,
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
        const SizedBox(height: 14),
        Text(
          'Amenities',
          style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
          textAlign: TextAlign.right,
        ),
        CustomMultiDropDown(
          // scrollController: viewModel.amenitiesScrollController,
          focusNode: viewModel.amenitiesFocusNode,
          list: viewModel.amentiasStringList,
          selectedList: viewModel.amentiasSelectedList,
          name: 'Amenities',
          prefixIconPath: MyIcon.imgAmenities,
          prefixIconColor: Palettes.primary,
          onChanged: viewModel.amenitiesOnChanged,
          onRemove: viewModel.amenitiesOnRemove,
          outlineBorder: true,
        ),
        const SizedBox(height: 14),
        Text(
          'Additional Information',
          style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
          textAlign: TextAlign.right,
        ),
        AdditionalInfoTextField(
          controller: general.additionalInfo,
          name: 'Additional Information',
          prefixIconPath: MyIcon.information,
          prefixIconColor: Palettes.primary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          widgetMargin: const EdgeInsets.symmetric(vertical: 5),
          prefixPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          height: 90,
          outlineBorder: true,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _contactInfoBox(context, GeneralInfoProvider general) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Information'.tr,
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
          const SizedBox(height: 14),
          Text(
            'Whatsapp No',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          WhatsAppInputField(
            controller: general.whatsAppNo,
            countryCode: general.code,
            name: 'Whatsapp No',
            prefixIconPath: MyIcon.whatsapp,
            prefixIconColor: Palettes.primary,
            suffixIconPath: !(general.data?.webMobileVerified ?? false) ? MyIcon.crossed : "",
            outlineBorder: true,
            onCountryCodeTap: () => general.onCountryCodeTap(context, viewModel.countryList),

            
            // () {
            //   log(viewModel.countryList.toString());
            //   countrySelectDialog(
            //     context,
            //     list: viewModel.countryList,
            //     onSubmit: (value) {
            //       Get.back();
            //       log(value.toString());
            //     },
            //   );
            // },
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => viewModel.verifyMobileHandler(context, general.whatsAppNo.text),
              child: Text(
                'Verify Mobile',
                style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black, decoration: TextDecoration.underline, fontWeight: FontWeight.w500),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Telephone',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: general.telephone,
            name: 'Telephone',
            prefixIconPath: MyIcon.telephone,
            prefixIconColor: Palettes.primary,
            outlineBorder: true,
          ),
          const SizedBox(height: 14),
          Text(
            'Email',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: general.email,
            name: 'Email',
            prefixIconPath: MyIcon.mail,
            prefixIconColor: Palettes.primary,
            outlineBorder: true,
            suffixIconPath: !(general.data?.isEmailVerified ?? false) ? MyIcon.crossed : "",
          ),
          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () => viewModel.verifyEmailHandler(context, general.email.text),
              child: Text(
                'Verify Email',
                style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black, decoration: TextDecoration.underline, fontWeight: FontWeight.w500),
                textAlign: TextAlign.end,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Website',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: general.website,
            name: 'Website',
            prefixIconPath: MyIcon.imgWebsite,
            prefixIconColor: Palettes.primary,
            suffixIconPath: general.website.text.isNotEmpty ? MyIcon.checked1 : "",
            outlineBorder: true,
          ),
        ],
      ),
    );
  }

  Widget _generalInfoBox(context, general) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General Info'.tr,
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
                  width: 100,
                  height: 100,
                  url: '',
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
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
          FreelancerSwitch(
            initialValue: general.isFreelancer,
            onChange: general.setFreelancer,
          ),
          const SizedBox(height: 14),
          Text(
            'Company Name',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: general.companyName,
            name: 'Company Name',
            prefixIconPath: MyIcon.officeBuilding,
            outlineBorder: true,
          ),
          InputTextRtl(
            controller: general.companyName2,
          ),
          Text(
            'Tagline',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: general.tagline,
            name: 'Tagline',
            prefixIconPath: MyIcon.imgTag,
            outlineBorder: true,
          ),
          const SizedBox(height: 14),
          Text(
            'Company Establishment Year',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            enabled: false,
            controller: general.companyEsb,
            name: 'Company Establishment Year',
            prefixIconPath: MyIcon.serviceStart3x,
            onTap: () => general.copEstabYearOnTap(context),
            outlineBorder: true,
          ),
          const SizedBox(height: 14),
          Text(
            'Business Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown1(
            focusNode: viewModel.businessCategoryFocusNode,
            name: 'Business Category',
            prefixIconPath: MyIcon.portfolio,
            onChanged: viewModel.businessCategoryOnChanged,
            value: viewModel.businessCategoryValue,
            items: viewModel.businessCategoryList!.map((e) => e.service!).map((String e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Palettes.black,
                    fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                  ),
                ),
              );
            }).toList(),
            outlineBorder: true,
          ),
          const SizedBox(height: 14),
          Text(
            'Business Sub-Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomMultiDropDown(
            // scrollController: viewModel.businessSubCategoryScrollController,
            focusNode: viewModel.businessSubCategoryFocusNode,
            name: 'Business Sub-Category',
            prefixIconPath: MyIcon.portfolio,
            list: viewModel.businessSubCategoryList?.map((e) => e.businessTypeNameEn!).toList() ?? [],
            selectedList: viewModel.businessSubCategorySelectedList,
            onChanged: viewModel.businessSubCategoryChanged,
            onRemove: viewModel.businessSubCategoryRemove,
            outlineBorder: true,
          ),
          const SizedBox(height: 14),
          Text(
            'Services For',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown1(
            focusNode: viewModel.servicesForFocusNode,
            value: viewModel.serviceForValue,
            name: 'Services For',
            prefixIconPath: MyIcon.sex,
            onChanged: viewModel.servicesForOnChanged,
            items: viewModel.serviceList.map((String e) {
              return DropdownMenuItem<String>(
                value: e,
                child: Text(
                  e,
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Palettes.black,
                    fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                  ),
                ),
              );
            }).toList(),
            outlineBorder: true,
          ),
        ],
      ),
    );
  }
}
