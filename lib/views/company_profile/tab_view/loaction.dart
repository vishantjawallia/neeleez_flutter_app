// ignore_for_file: unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/custom_drop_down.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';

import '../components/country_drop_down.dart';

class Location extends StatefulWidget {
  final List<Countries>? countryList;
  final void Function(Countries value) countryOnChange;
  final List<String>? stateList;
  final void Function(String? value) stateOnChange;
  final List<String>? cityList;
  final void Function(String? value) cityOnChange;
  final Countries? countrySelected;
  final String? stateSelected;
  final String? citySelected;
  final TextEditingController? googleAddressController;
  final TextEditingController? additionalAddressController;
  const Location({
    Key? key,
    required this.countryList,
    required this.stateList,
    required this.cityList,
    required this.countrySelected,
    required this.stateSelected,
    required this.citySelected,
    required this.googleAddressController,
    required this.additionalAddressController,
    required this.countryOnChange,
    required this.stateOnChange,
    required this.cityOnChange,
  }) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
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
                    // child: ,
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
            CountryDropDown(
              list: widget.countryList,
              value: null,
              name: 'Country',
              prefixIconPath: MyIcon.place,
            ),
            // CustomDropDown(
            //   value: '',
            //   list: widget.countryList,
            //   name: 'Country',
            //   prefixIconPath: MyIcon.place,
            //   prefixIconColor: Palettes.primary,
            // ),
            // const CountryDropDown(
            //   list: coun,
            //   value: '',
            // ),
            const SizedBox(height: 14),
            Text(
              'State/Province',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              value: '',
              list: const [],
              name: 'State/Province',
              prefixIconPath: MyIcon.imgLocationState,
              onChanged: widget.stateOnChange,
            ),
            const SizedBox(height: 14),
            Text(
              'City',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              list: const [],
              value: '',
              name: 'City',
              prefixIconPath: MyIcon.imgLocationCity,
              onChanged: widget.cityOnChange,
            ),
            const SizedBox(height: 14),
            Text(
              'Google Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: widget.googleAddressController,
              name: 'Google Address',
              prefixIconPath: MyIcon.place,
            ),
            const SizedBox(height: 14),
            Text(
              'Additional Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              controller: widget.additionalAddressController,
              name: 'Additional Address',
              prefixIconPath: MyIcon.place,
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
