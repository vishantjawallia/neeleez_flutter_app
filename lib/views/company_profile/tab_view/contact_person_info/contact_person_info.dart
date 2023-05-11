import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/custom_button.dart';
import 'widgets/department_input_field.dart';

class ContactPersonInfo extends StatefulWidget {
  final void Function()? onContactSave;
  final CompanyProfileViewModel viewModel;
  const ContactPersonInfo(this.viewModel,{
    Key? key,
    this.onContactSave,

  }) : super(key: key);

  @override
  _ContactPersonInfoState createState() => _ContactPersonInfoState();
}

class _ContactPersonInfoState extends State<ContactPersonInfo> {
  @override
  void initState() {
    super.initState();
    final loaction = Provider.of<ContactPersonInfoProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 100), () {
      loaction.loadItems();
    });
  }

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
            CustomTextField(
              controller: contact.mobileNo,
              name: 'Mobile No',
              prefixIconPath: MyIcon.mobileAnalytics,
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
            DepartmentInputField(
              controller: contact.departmentController,
              name: 'Department',
              prefixIconPath: MyIcon.staffDepartment,
              prefixIconColor: Palettes.primary,
              enabled: contact.departmentEnabled,
              onAddTap: contact.departmentOnTap,
              onChanged: (value) {},
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'Designation',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            DepartmentInputField(
              controller: contact.designationController,
              enabled: contact.designationEnabled,
              name: 'Designation',
              prefixIconPath: MyIcon.staffDesignation,
              prefixIconColor: Palettes.primary,
              onAddTap: contact.designationOnTap,
              onChanged: (value) {},
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
                onTap: () {
                  // widget.viewModel.onContactSave(
                  //   department: "",
                  //   departmentId: 0,
                  //   designation: "",
                  //   email: contact.email.text,
                  //   designationId: 0,
                  //   id: 0,
                  //   mobile: contact.mobileNo.text,
                  //   nameAr: "",
                  //   nameEn: contact.fullName.text,
                  //   whatsApp: "",
                  //   tel: contact.mobileNo.text,
                  // );
                },
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
