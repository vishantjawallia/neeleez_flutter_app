// ignore_for_file: unused_field, prefer_final_fields, null_check_always_fails, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../company_profile_view_model.dart';
import 'loaction_provider.dart';

class Location extends StatefulWidget {
  final CompanyProfileViewModel viewModel;
  const Location({
    super.key,
    required this.viewModel,
  });

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    super.initState();
    final loaction = Provider.of<LocationProvider>(context, listen: false);
    Future.delayed(const Duration(milliseconds: 100), () {
      loaction.loadItems(widget.viewModel.regionInfo, widget.viewModel.countryList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loaction = Provider.of<LocationProvider>(context);
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
                    'Location'.tr,
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
                  )
                ],
              ),
            ),
            const SizedBox(height: 14),
            Text(
              'Country',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              prefixUrlImage: loaction.countryImage,
              controller: loaction.country,
              name: 'Country',
              // prefixIconPath: MyIcon.place,
              enabled: false,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'State/Province',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: loaction.state,
              name: 'State/Province',
              prefixIconPath: MyIcon.imgLocationState,
              enabled: false,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'City',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: loaction.city,
              name: 'State/Province',
              prefixIconPath: MyIcon.imgLocationCity,
              enabled: false,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'Google Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: loaction.address,
              enabled: false,
              name: 'Google Address',
              prefixIconPath: MyIcon.place,
              outlineBorder: true,
            ),
            const SizedBox(height: 14),
            Text(
              'Additional Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: loaction.additionalAddress,
              enabled: false,
              name: 'Additional Address',
              prefixIconPath: MyIcon.place,
              outlineBorder: true,
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
