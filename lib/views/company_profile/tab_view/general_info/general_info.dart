// ignore_for_file: library_private_types_in_public_api

// import 'dart:devloper';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
// import 'package:neeleez_flutter_app/views/company_profile/components/custom_drop_down.dart';
// import 'package:neeleez_flutter_app/views/company_profile/components/custom_multi_drop_down.dart';

import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';
import 'package:provider/provider.dart';

import '../../company_profile_view_model.dart';
import '../../components/freelancer_switch.dart';
import 'general_info_provider.dart';
import 'widgets/custom_drop_down1.dart';
import 'widgets/custom_multi_drop_down.dart';
import 'widgets/input_text_rtl.dart';

class GeneralInfo extends StatefulWidget {
  final CompanyProfileViewModel viewModel;

  const GeneralInfo({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  @override
  State<GeneralInfo> createState() => _GeneralInfoState();
}

class _GeneralInfoState extends State<GeneralInfo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final general = Provider.of<GeneralInfoProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 100), () {
      general.loadItem(widget.viewModel.genInfo);
    });
  }

  @override
  Widget build(BuildContext context) {
    final general = Provider.of<GeneralInfoProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      controller: general.scrollController,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          children: [
            _generalInfoBox(context, general),
            _contactInfoBox(general),
            _aboutBusinessBox(general),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () {
                  int? bC = int.tryParse(widget.viewModel.businessCategoryId ?? "");
                  widget.viewModel.onGeneralSave(
                    aboutUs: general.additionalInfo.text,
                    email: general.email.text,
                    tel1: general.telephone.text,
                    nameEn: general.companyName.text,
                    nameAr: general.companyName2.text,
                    isFreeLancer: general.isFreelancer,
                    tagLine: general.tagline.text,
                    whatsapp: general.whatsAppNo.text,
                    url: general.website.text,
                    genderId: int.tryParse(widget.viewModel.serviceForId!),
                    businessServiceId: bC,
                  );
                },
                // onTap: widget.onSave,
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }

  _aboutBusinessBox(GeneralInfoProvider general) {
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
          focusNode: widget.viewModel.amenitiesFocusNode,
          list: widget.viewModel.amentiasStringList,
          selectedList: widget.viewModel.amentiasSelectedList,
          name: 'Amenities',
          prefixIconPath: MyIcon.imgAmenities,
          prefixIconColor: Palettes.primary,
          onChanged: widget.viewModel.amenitiesOnChanged,
          onRemove: widget.viewModel.amenitiesOnRemove,
        ),
        const SizedBox(height: 14),
        Text(
          'Additional Information',
          style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
          textAlign: TextAlign.right,
        ),
        CustomTextField(
          controller: general.additionalInfo,
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

  _contactInfoBox(GeneralInfoProvider general) {
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
            controller: general.whatsAppNo,
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
            controller: general.telephone,
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
            controller: general.email,
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
            controller: general.website,
            name: 'Website',
            prefixIconPath: MyIcon.imgWebsite,
            prefixIconColor: Palettes.primary,
          ),
        ],
      ),
    );
  }

  _generalInfoBox(_, GeneralInfoProvider general) {
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
            onTap: () => general.copEstabYearOnTap(_),
          ),
          const SizedBox(height: 14),
          Text(
            'Business Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown1(
            focusNode: widget.viewModel.businessCategoryFocusNode,
            name: 'Business Category',
            prefixIconPath: MyIcon.portfolio,
            onChanged: widget.viewModel.businessCategoryOnChanged,
            value: widget.viewModel.businessCategoryValue,
            items: widget.viewModel.businessCategoryList!.map((e) => e.service!).map((String e) {
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
          ),
          const SizedBox(height: 14),
          Text(
            'Business Sub-Category',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomMultiDropDown(
            focusNode: widget.viewModel.businessSubCategoryFocusNode,
            name: 'Business Sub-Category',
            prefixIconPath: MyIcon.portfolio,
            list: widget.viewModel.businessSubCategoryList?.map((e) => e.businessTypeNameEn!).toList() ?? [],
            selectedList: widget.viewModel.businessSubCategorySelectedList,
            onChanged: widget.viewModel.businessSubCategoryChanged,
            onRemove: widget.viewModel.businessSubCategoryRemove,
          ),
          const SizedBox(height: 14),
          Text(
            'Services For',
            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
            textAlign: TextAlign.right,
          ),
          CustomDropDown1(
            focusNode: widget.viewModel.servicesForFocusNode,
            value: widget.viewModel.serviceForValue,
            name: 'Services For',
            prefixIconPath: MyIcon.sex,
            onChanged: widget.viewModel.servicesForOnChanged,
            items: widget.viewModel.serviceList.map((String e) {
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
          ),
        ],
      ),
    );
  }
}
