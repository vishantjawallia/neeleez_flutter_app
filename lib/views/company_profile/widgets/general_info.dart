// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class GeneralInfo extends StatelessWidget {
  final bool? isFreelancer;
  final void Function(bool? isFreelancer)? onFreelancerChange;
  final TextEditingController? companyNameController;
  final TextEditingController? taglineController;
  final TextEditingController? companyEstablishmentYearController;
  final DateTime? companyEstablishmentYearDate;
  final String? businessCategory;
  final List<String>? businessCategoryList;
  final List<String>? businessSubCategorySelectedList;
  final List<String>? businessSubCategoryList;
  final String? serviceFor;
  final List<String>? serviceForList;
  final TextEditingController? whatsAppNoController;
  final TextEditingController? telephoneController;
  final TextEditingController? emailController;
  final TextEditingController? websiteController;
  final List<String>? amentiasList;
  final List<String>? amentiasSelectedList;
  final TextEditingController? additionalInfoController;
  final void Function()? onSave;

  const GeneralInfo({
    Key? key,
    required this.isFreelancer,
    required this.companyNameController,
    required this.taglineController,
    required this.companyEstablishmentYearController,
    required this.businessCategory,
    required this.businessCategoryList,
    required this.businessSubCategorySelectedList,
    required this.businessSubCategoryList,
    required this.serviceFor,
    required this.serviceForList,
    required this.whatsAppNoController,
    required this.telephoneController,
    required this.emailController,
    required this.websiteController,
    required this.amentiasList,
    required this.amentiasSelectedList,
    required this.onSave,
    required this.additionalInfoController,
    required this.onFreelancerChange,
    required this.companyEstablishmentYearDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            _generalInfoBox(),
            _contactInfoBox(),
            _aboutBusinessBox(),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: onSave,
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  Column _aboutBusinessBox() {
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
          list: amentiasList,
          name: 'Amenities',
          prefixIconPath: MyIcon.imgAmenities,
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
        CustomTextField(
          controller: additionalInfoController,
          name: 'Additional Information',
          prefixIconPath: MyIcon.information,
          prefixIconColor: Palettes.primary,
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          widgetMargin: const EdgeInsets.symmetric(vertical: 5),
          prefixPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
          height: 90,
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _contactInfoBox() {
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
          CustomTextField(
            controller: whatsAppNoController,
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
          CustomTextField(
            controller: telephoneController,
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
          CustomTextField(
            controller: emailController,
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
          CustomTextField(
            controller: websiteController,
            name: 'Website',
            prefixIconPath: MyIcon.imgWebsite,
            prefixIconColor: Palettes.primary,
          ),
        ],
      ),
    );
  }

  _generalInfoBox() {
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
            initialValue: isFreelancer,
            onChange: onFreelancerChange,
          ),
          const SizedBox(height: 14),
          Text(
            'Company Name',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: companyNameController,
            name: 'Company Name',
            prefixIconPath: MyIcon.officeBuilding,
            prefixIconColor: Palettes.primary,
          ),
          const SizedBox(height: 14),
          Text(
            'Tagline',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: taglineController,
            name: 'Tagline',
            prefixIconPath: MyIcon.officeBuilding,
            prefixIconColor: Palettes.primary,
          ),
          const SizedBox(height: 14),
          Text(
            'Tagline',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: taglineController,
            name: 'Tagline',
            prefixIconPath: MyIcon.imgTag,
            prefixIconColor: Palettes.primary,
          ),
          const SizedBox(height: 14),
          Text(
            'Company Establishment Year',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            controller: companyEstablishmentYearController,
            name: 'Company Establishment Year',
            prefixIconPath: MyIcon.serviceStart3x,
            prefixIconColor: Palettes.primary,
          ),
          const SizedBox(height: 14),
          Text(
            'Business Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown(
            list: businessCategoryList,
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
          CustomMultiDropDown(
            list: businessSubCategorySelectedList,
            name: 'Business Sub-Category',
            prefixIconPath: MyIcon.portfolio,
            prefixIconColor: Palettes.primary,
            onChanged: (List<String>? value) {
              log(value!.toString());
            },
          ),
          const SizedBox(height: 14),
          Text(
            'Services For',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown(
            list: serviceForList,
            name: 'Services For',
            prefixIconPath: MyIcon.sex,
            prefixIconColor: Palettes.primary,
          ),
        ],
      ),
    );
  }
}
