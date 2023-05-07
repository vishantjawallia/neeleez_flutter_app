import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import 'widgets/department_input_field.dart';

class ContactPersonInfo extends StatefulWidget {
  final void Function()? onContactSave;
  final CompanyProfileViewModel viewModel;
  const ContactPersonInfo({
    Key? key,
    this.onContactSave,
    required this.viewModel,
  }) : super(key: key);

  @override
  _ContactPersonInfoState createState() => _ContactPersonInfoState();
}

class _ContactPersonInfoState extends State<ContactPersonInfo> {
  @override
  Widget build(BuildContext context) {
    final social = Provider.of<ContactPersonInfoProvider>(context);
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
              controller: social.fullName,
              prefixIconPath: MyIcon.user,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            //
            Text(
              'Mobile No',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: social.mobileNo,
              name: 'Mobile No',
              prefixIconPath: MyIcon.mobileAnalytics,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Email',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: social.email,
              name: 'Email',
              prefixIconPath: MyIcon.mail,
              prefixIconColor: Palettes.primary,
            ),
            const SizedBox(height: 14),
            Text(
              'Department',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            DepartmentInputField(
              value: '',
              list: const [],
              // list: ['Hello', 'Go'],
              name: 'Department',
              prefixIconPath: MyIcon.staffDepartment,
              prefixIconColor: Palettes.primary,
              onChanged: (value) {},
            ),
            const SizedBox(height: 14),
            Text(
              'Designation',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            DepartmentInputField(
              value: '',
              list: const ['Hello', 'Go'],
              name: 'Designation',
              prefixIconPath: MyIcon.staffDesignation,
              prefixIconColor: Palettes.primary,
              onChanged: (value) {},
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
