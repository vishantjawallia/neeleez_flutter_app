// ignore_for_file: library_private_types_in_public_api

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
import 'package:provider/provider.dart';

import '../../components/freelancer_switch.dart';
import 'general_info_provider.dart';

class GeneralInfo extends StatelessWidget {
  final bool? isFreelancer;
  final VoidCallback? onFreelancerChange;
  //
  final TextEditingController? companyNameController;
  final TextEditingController? taglineController;
  final TextEditingController? companyEstablishmentYearController;
  final TextEditingController? whatsAppNoController;
  final TextEditingController? telephoneController;
  final TextEditingController? emailController;
  final TextEditingController? websiteController;
  //
  final DateTime? companyEstablishmentYearDate;
  //
  final String? busCatValue;
  final List<String>? businessCategoryList;
  final void Function(String? value)? busCatOnChange;
  final FocusNode? busCatOnFocus;
  //
  final String? serviceForValue;
  final List<String>? serviceForList;
  final void Function(String? value)? serviceForOnChange;
  //
  final List<String>? businessSubCategoryList;
  final List<String>? businessSubCategorySelectedList;
  final void Function(List? value)? busSubCatSelectedOnChange;
  //
  final List<String>? amentiasList;
  final List<String>? amentiasSelectedList;
  final void Function(List<String>? value)? amentiasOnChange;
  //
  final TextEditingController? additionalInfoController;
  final void Function(BuildContext? context)? copEstabYearOnTap;
  final VoidCallback? onSave;

  const GeneralInfo({
    Key? key,
    required this.isFreelancer,
    required this.companyNameController,
    required this.taglineController,
    required this.companyEstablishmentYearController,
    required this.businessCategoryList,
    required this.businessSubCategorySelectedList,
    required this.businessSubCategoryList,
    required this.serviceForList,
    required this.whatsAppNoController,
    required this.telephoneController,
    required this.emailController,
    required this.websiteController,
    required this.amentiasList,
    required this.amentiasSelectedList,
    required this.onSave,
    required this.copEstabYearOnTap,
    required this.additionalInfoController,
    required this.onFreelancerChange,
    required this.companyEstablishmentYearDate,
    required this.serviceForOnChange,
    required this.busCatOnChange,
    required this.busCatOnFocus,
    required this.busSubCatSelectedOnChange,
    required this.busCatValue,
    required this.serviceForValue,
    required this.amentiasOnChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralInfoProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            _generalInfoBox(context),
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

  _aboutBusinessBox() {
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
          selectedList: amentiasSelectedList,
          name: 'Amenities',
          prefixIconPath: MyIcon.imgAmenities,
          prefixIconColor: Palettes.primary,
          onChanged: amentiasOnChange,
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

  _generalInfoBox(_) {
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
          ),
          const SizedBox(height: 14),
          Text(
            'Company Establishment Year',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomTextField(
            enabled: false,
            controller: companyEstablishmentYearController,
            name: 'Company Establishment Year',
            prefixIconPath: MyIcon.serviceStart3x,
            onTap: () => copEstabYearOnTap!(_),
          ),
          const SizedBox(height: 14),
          Text(
            'Business Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown(
            focusNode: busCatOnFocus,
            name: 'Business Category',
            value: busCatValue,
            prefixIconPath: MyIcon.portfolio,
            list: businessCategoryList,
            onChanged: busCatOnChange,
          ),
          const SizedBox(height: 14),
          Text(
            'Business Sub-Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomMultiDropDown(
            name: 'Business Sub-Category',
            prefixIconPath: MyIcon.portfolio,
            list: businessSubCategoryList,
            selectedList: businessSubCategorySelectedList,
            onChanged: busSubCatSelectedOnChange,
          ),
          const SizedBox(height: 14),
          Text(
            'Services For',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown(
            name: 'Services For',
            prefixIconPath: MyIcon.sex,
            value: serviceForValue,
            list: serviceForList,
            onChanged: serviceForOnChange,
          ),
        ],
      ),
    );
  }
}




 // DropDownTextField(
          //   textFieldDecoration: const InputDecoration(
          //     border: InputBorder.none,
          //   ),
          //   validator: (value) {
          //     if (value == null) {
          //       return "Required field";
          //     } else {
          //       return null;
          //     }
          //   },
          //   dropDownItemCount: 6,
          //   dropdownRadius: 0,
          //   dropDownList: const [
          //     DropDownValueModel(name: 'name1', value: "value1"),
          //     DropDownValueModel(name: 'name2', value: "value2", toolTipMsg: "DropDownButton is a widget that we can use to select one unique value from a set of values"),
          //     DropDownValueModel(name: 'name3', value: "value3"),
          //     DropDownValueModel(name: 'name4', value: "value4", toolTipMsg: "DropDownButton is a widget that we can use to select one unique value from a set of values"),
          //     DropDownValueModel(name: 'name5', value: "value5"),
          //     DropDownValueModel(name: 'name6', value: "value6"),
          //     DropDownValueModel(name: 'name7', value: "value7"),
          //     DropDownValueModel(name: 'name8', value: "value8"),
          //   ],
          //   onChanged: (val) {},
          // ),
