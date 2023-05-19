import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/widgets/whats_app_input_field.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';
import 'widgets/department_input_field.dart';

class ContactPersonInfo extends StatelessWidget {
  final void Function()? onContactSave;
  final CompanyProfileViewModel viewModel;
  const ContactPersonInfo(
    this.viewModel, {
    Key? key,
    this.onContactSave,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contact = Provider.of<ContactPersonInfoProvider>(context);
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
                    'Contact Person Info'.tr,
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
              'Full Name',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              name: 'Full Name',
              controller: contact.fullName,
              prefixIconPath: MyIcon.user,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            //
            Text(
              'Mobile No',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            WhatsAppInputField(
              controller: contact.mobileNo,
              focusNode: contact.mobileNoFocusNode,
              countryCode: contact.code,
              name: 'Mobile No',
              prefixIconPath: MyIcon.mobileAnalytics,
              prefixIconColor: Palettes.primary,
              suffixIconPath: "",
              outlineBorder: true,
              onCountryCodeTap: () => contact.onCountryCodeTapHandler(context, viewModel.countryList),
            ),
            const SizedBox(height: 14),
            Text(
              'Email',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: contact.email,
              name: 'Email',
              prefixIconPath: MyIcon.mail,
              prefixIconColor: Palettes.primary,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'Department',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),

            CustomInputDropDown(
              name: 'Department',
              //
              controller: contact.departmentController,
              value: contact.selectedDepartment,
              onChanged: contact.departmentOnChange,
              onAddTap: () => contact.departmentOnTap(viewModel),
              onRightTap: () => contact.onNewDepartmentSave(context, viewModel),

              prefixIconPath: MyIcon.portfolio,
              items: viewModel.departmentList?.map((e) => e.name!).map((String e) {
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
              enabled: contact.departmentEnabled,
            ),
            const SizedBox(height: 14),
            Text(
              'Designation',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomInputDropDown(
              controller: contact.designationController,
              name: 'Designation',
              prefixIconPath: MyIcon.portfolio,
              items: viewModel.designationList?.map((e) => e.designationEn!).map((String e) {
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
              enabled: contact.designationEnabled,
              onRightTap: () => contact.onNewDesignationSave(context, viewModel),
              onChanged: contact.designationOnChange,
              value: contact.selectedDesignation,
              onAddTap: () => contact.designationOnTap(viewModel),
              outlineBorder: true,
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () => contact.onSaveHandler(context, viewModel),
              ),
            ),
            const SizedBox(height: 14),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
