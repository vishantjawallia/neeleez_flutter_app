// ignore_for_file: unused_field, prefer_final_fields, null_check_always_fails, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/custom_drop_down.dart';

import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

// import '../../components/country_drop_down.dart';
import '../../../../models/company/companies.dart';
import 'loaction_provider.dart';
import 'widgets/country_drop_down.dart';

class Location extends StatelessWidget {
  final List<Countries>? countryList;
  final RegionInformation? regionInfo;
  final TextEditingController? googleAddressController;
  final TextEditingController? additionalAddressController;
  const Location({
    super.key,
    required this.countryList,
    this.regionInfo,
    this.googleAddressController,
    this.additionalAddressController,
  });

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
              value: loaction.country?.nameEn,
              urlImage: loaction.country?.iconImage2 ?? "",
              list: countryList ?? [],
              name: 'Country',
              prefixIconPath: MyIcon.place,
              onChanged: loaction.onCountryChange,
            ),
            const SizedBox(height: 14),
            Text(
              'State/Province',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              loading: loaction.loadingC,
              value: loaction.province?.provinceNameEn ?? null,
              list: (loaction.provinces ?? []).map((e) => e.provinceNameEn!).toList(),
              name: 'State/Province',
              prefixIconPath: MyIcon.imgLocationState,
              onChanged: loaction.onStateChanged,
            ),
            const SizedBox(height: 14),
            Text(
              'City',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomDropDown(
              loading: loaction.loadingP,
              value: loaction.city?.cityNameEn ?? null,
              list: (loaction.cities ?? []).map((e) => e.cityNameEn!).toList(),
              name: 'City',
              prefixIconPath: MyIcon.imgLocationCity,
              onChanged: loaction.onCityChanged,
            ),
            const SizedBox(height: 14),
            Text(
              'Google Address',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
              textAlign: TextAlign.right,
            ),
            CustomTextField(
              enabled: false,
              controller: googleAddressController,
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
              controller: additionalAddressController,
              enabled: false,
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
            // onChanged: (val) {},
            // ),