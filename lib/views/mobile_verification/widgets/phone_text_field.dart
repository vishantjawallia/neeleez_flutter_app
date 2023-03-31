import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? name;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final String? suffixIconPath;
  final EdgeInsetsDirectional? inputFieldPadding;
  final EdgeInsetsGeometry? widgetMargin;
  final bool? obscureText;
  final void Function(String? value)? onChanged;
  const PhoneTextField(
      {Key? key,
      this.controller,
      this.name,
      this.prefixIconPath,
      this.prefixIconColor,
      this.prefixIconSize,
      this.suffixIconPath,
      this.inputFieldPadding,
      this.widgetMargin,
      this.obscureText,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('$name'),
      height: 50,
      margin: widgetMargin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Palettes.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Palettes.white,
          width: 1.5,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 0.4,
            color: Palettes.greyPrimary,
            spreadRadius: 0.2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
            child: Image.asset(
              prefixIconPath!,
              filterQuality: FilterQuality.high,
              isAntiAlias: true,
              color: Palettes.primary,
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            width: 65,
            // decoration: const BoxDecoration(
            //   border: Border(
            //     right: BorderSide(width: 0.5, color: Palettes.primary),
            //   ),
            // ),
            child: Text(
              '+212',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.red, fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
          ),
          // SizedBox(
          //   width: 55,
          //   child: CountryCodePicker(
          //     padding: EdgeInsets.zero,
          //     onChanged: print,
          //     initialSelection: 'IT',
          //     favorite: const ['+39', 'FR'],
          //     countryFilter: const ['IT', 'FR'],
          //     // showDropDownButton: true,
          //     textStyle: Get.textTheme.bodyLarge!.copyWith(color: Palettes.red, fontWeight: FontWeight.w700),
          //     showFlagDialog: false,
          //     showFlag: false,
          //     comparator: (a, b) => b.name!.compareTo(a.name!),
          //     onInit: (code) => debugPrint("on init ${code!.name} ${code.dialCode} ${code.name}"),

          //   ),
          // ),
          Flexible(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              // width: 65,
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(width: 1, color: Palettes.primary),
                ),
              ),
              child: TextField(
                // onChanged: (value) => onChanged!(value),
                keyboardType: TextInputType.phone,
                obscureText: obscureText ?? false,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  border: InputBorder.none,
                  hintText: name ?? 'Username / Email :',
                  hintStyle: Get.textTheme.bodySmall!.copyWith(color: Palettes.primary, fontWeight: FontWeight.w600),
                  isDense: true,
                ),
              ),
            ),
          ),
          suffixIconPath!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Padding(
                    padding: Helper.isRtl() ? const EdgeInsets.only(right: 10, top: 6) : const EdgeInsets.only(left: 10, top: 6),
                    child: Image.asset(
                      suffixIconPath!,
                      height: 20,
                      filterQuality: FilterQuality.high,
                      isAntiAlias: true,
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
