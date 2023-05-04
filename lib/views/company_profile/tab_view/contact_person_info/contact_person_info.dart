import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class ContactPersonInfo extends StatefulWidget {
  final TextEditingController? fullNameController;
  final TextEditingController? mobileNoController;
  final TextEditingController? countryCodeController;
  final TextEditingController? emailController;
  final bool? isDepartment;
  final bool? isDesignation;
  final void Function()? onContactSave;
  const ContactPersonInfo({
    Key? key,
    required this.fullNameController,
    required this.mobileNoController,
    required this.countryCodeController,
    required this.emailController,
    required this.isDepartment,
    required this.isDesignation,
    this.onContactSave,
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
              controller: widget.fullNameController,
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
              controller: widget.mobileNoController,
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
              controller: widget.emailController,
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
            // CustomDropDown(
            //   value: '',
            //   list: const [],
            //   // list: ['Hello', 'Go'],
            //   name: 'Department',
            //   prefixIconPath: MyIcon.staffDepartment,
            //   prefixIconColor: Palettes.primary,
            //   onChanged: (value) {},
            // ),
            const SizedBox(height: 14),
            Text(
              'Designation',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            // CustomDropDown(
            //   value: '',
            //   list: const ['Hello', 'Go'],
            //   name: 'Designation',
            //   prefixIconPath: MyIcon.staffDesignation,
            //   prefixIconColor: Palettes.primary,
            //   onChanged: (value) {},
            // ),
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