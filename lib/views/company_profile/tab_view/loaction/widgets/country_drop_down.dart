import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';

import '../../../components/drop_down.dart';

class CountryDropDown extends StatelessWidget {
  final List<Countries>? list;
  final String? name;
  final String? value;
  final String? prefixIconPath;
  final String? urlImage;

  final void Function(int value, List<Countries>? values)? onChanged;
  const CountryDropDown({
    Key? key,
    this.name,
    this.prefixIconPath = "",
    this.onChanged,
    required this.list,
    this.urlImage,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final loaction = Provider.of<LocationProvider>(context);
    return Container(
      key: Key('$name'),
      height: 50,
      decoration: BoxDecoration(
        color: Palettes.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Palettes.white,
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(blurRadius: 0.4, color: Palettes.greyPrimary, spreadRadius: 0.2),
        ],
      ),
      child: _dropDown(),
    );
  }

  DropDownTextField _dropDown() {
    return DropDownTextField(
      textFieldDecoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 14.5),
        isDense: true,
        border: InputBorder.none,
        prefixIcon: Container(
          padding: const EdgeInsets.symmetric(horizontal: 11.4, vertical: 10.5),
          margin: const EdgeInsets.only(right: 12),
          decoration: BoxDecoration(
            color: Palettes.greyPrimary,
            borderRadius: Helper.isRtl()
                ? const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
          ),
          child: UrlImage(
            url: '$urlImage',
            width: 31.2,
            border: Border.all(width: 0),
          ),
        ),
        // suffixIcon: Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 11.4, vertical: 10.5),
        //   margin: const EdgeInsets.only(right: 12),
        //   decoration: BoxDecoration(
        //     color: Palettes.greyPrimary,
        //     borderRadius: Helper.isRtl()
        //         ? const BorderRadius.only(
        //             topLeft: Radius.circular(8),
        //             bottomLeft: Radius.circular(8),
        //           )
        //         : const BorderRadius.only(
        //             topRight: Radius.circular(8),
        //             bottomRight: Radius.circular(8),
        //           ),
        //   ),
        //   child: UrlImage(
        //     url: '$urlImage',
        //     height: 32,
        //     width: 32,
        //   ),
        // ),
        // suffixIcon: const Icon(Icons.arrow_drop_down_sharp, color: Palettes.black),
        hintText: 'Select Country',
        hintStyle: Get.textTheme.bodyMedium!.copyWith(
          color: Palettes.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return "Required field";
        } else {
          return null;
        }
      },
      dropDownIconProperty: IconProperty(size: 0),
      dropDownItemCount: 6,
      dropdownRadius: 0,
      textStyle: Get.textTheme.bodyMedium!.copyWith(
        color: Palettes.primary,
        fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
      ),
      clearIconProperty: IconProperty(size: 0),
      dropDownList: [
        ...list!
            .asMap()
            .map(
              (k, Countries value) => MapEntry(
                k,
                DropDownValueModel(
                  // toolTipMsg: '',
                  name: value.nameEn!,
                  value: value.id,
                ),
              ),
            )
            .values
            .toList()
      ],
      controller: SingleValueDropDownController(
        data: DropDownValueModel(
          name: value ?? '',
          value: value ?? '',
        ),
      ),
      onChanged: (value) {
        if (list!.isNotEmpty) {
          DropDownValueModel jj = value;
          return onChanged!(jj.value, list);
        }
      },
    );
  }
}
