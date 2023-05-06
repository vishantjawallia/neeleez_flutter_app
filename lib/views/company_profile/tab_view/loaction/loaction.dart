// ignore_for_file: unused_field, prefer_final_fields, null_check_always_fails, unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:neeleez_flutter_app/models/company/provinces.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';

import 'package:provider/provider.dart';

// import '../../components/country_drop_down.dart';
import '../../../../models/company/companies.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../components/custom_drop_down.dart';
import 'loaction_provider.dart';
import 'widgets/country_drop_down.dart';

class Location extends StatefulWidget {
  final RegionInformation? regionInfo;
  final List<Countries>? countryList;
  final List<Provinces>? provinces;
  final List<Cities>? cities;
  final Countries? country;
  final Provinces? province;
  final Cities? city;
  final TextEditingController? googleAddressController;
  final TextEditingController? additionalAddressController;
  const Location({
    super.key,
    this.countryList,
    required this.regionInfo,
    required this.googleAddressController,
    required this.additionalAddressController,
    this.province,
    this.provinces,
    this.cities,
    this.city,
    this.country,
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
      loaction.clearAll();
      // setState(() {
    });
    // });
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
            if (widget.country != null && loaction.country == null)
              CountryDropDown(
                value: widget.country?.nameEn,
                urlImage: widget.country!.iconImage2 ?? "",
                list: widget.countryList ?? [],
                name: 'Country',
                prefixIconPath: MyIcon.place,
                onChanged: loaction.onCountryChange,
              )
            else
              CountryDropDown(
                value: loaction.country?.nameEn,
                urlImage: loaction.country?.iconImage2 ?? "",
                list: widget.countryList ?? [],
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
            if (widget.province != null && loaction.provinces!.isEmpty && !loaction.loadingC!)
              CustomDropDown(
                value: widget.province?.provinceNameEn ?? null,
                list: const [],
                name: 'State/Province',
                prefixIconPath: MyIcon.imgLocationState,
                onChanged: loaction.onStateChanged,
              )
            else
              CustomDropDown(
                loading: loaction.loadingC,
                value: loaction.province?.provinceNameEn,
                list: loaction.provinces?.map((e) => e.provinceNameEn!).toList() ?? [],
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
            if (widget.city != null && loaction.cities!.isEmpty && !loaction.loadingP!)
              CustomDropDown(
                value: widget.city?.cityNameEn,
                list: const [],
                name: 'City',
                prefixIconPath: MyIcon.imgLocationCity,
                onChanged: loaction.onCityChanged,
              )
            else
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
