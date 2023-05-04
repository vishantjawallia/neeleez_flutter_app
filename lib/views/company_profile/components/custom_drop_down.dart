import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomDropDown extends StatelessWidget {
  final TextEditingController? controller;
  final List<String>? list;
  final String? name;
  final String? hint;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final double? prefixIconSize;
  final double? height;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final String? suffixIconPath;
  final bool? checkedSuffixIcon;
  final EdgeInsetsGeometry? inputFieldPadding;
  final EdgeInsetsGeometry? prefixPadding;
  final EdgeInsetsGeometry? widgetMargin;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Widget? suffixIconWidget;
  final String? value;
  final FocusNode? focusNode;
  // final bool? obscureText;
  // final bool? autofocus;
  final bool? enabled;
  final bool? loading;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  const CustomDropDown({
    Key? key,
    this.controller,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    // this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    this.onChanged,
    this.prefixIconColor = Palettes.primary,
    this.prefixIconSize,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.maxLengthEnforcement,
    // this.autofocus,
    this.height,
    this.prefixPadding,
    this.onTap,
    this.enabled = true,
    this.suffixIconWidget,
    this.checkedSuffixIcon = false,
    required this.list,
    required this.value,
    this.hint,
    this.focusNode,
    this.loading = false,
  }) : super(key: key);

  // List<String>? list;
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('$name'),
      height: height ?? 50,
      margin: widgetMargin ?? EdgeInsets.zero,
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
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: prefixPadding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10.5),
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
                  color: prefixIconColor,
                  height: 26,
                  width: 26,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _dropDown(),
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
                          width: 20,
                          filterQuality: FilterQuality.high,
                          isAntiAlias: true,
                        ),
                      ),
                    )
                  : const SizedBox(),
              suffixIconWidget ?? const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  DropdownButton<String> _dropDown() {
    if (!loading!) {
      return DropdownButton<String>(
        focusNode: focusNode,
        key: Key('$name'),
        hint: Text(
          "Select ${name!}",
          style: Get.textTheme.bodyMedium!.copyWith(
            color: Palettes.primary.withOpacity(0.8),
            fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
          ),
        ),
        isExpanded: true,
        isDense: true,
        value: value,
        items: list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: Get.textTheme.bodyMedium!.copyWith(
                color: Palettes.black,
                fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
              ),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down_sharp),
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(),
        onChanged: onChanged,
      );
    } else {
      return DropdownButton<String>(
        focusNode: focusNode,
        key: Key('$name'),
        hint: Text(
          "Select ${name!}",
          style: Get.textTheme.bodyMedium!.copyWith(
            color: Palettes.primary.withOpacity(0.8),
            fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
          ),
        ),
        isExpanded: true,
        isDense: true,
        // value: null,
        items: [''].map<DropdownMenuItem<String>>((String value) {
          return const DropdownMenuItem<String>(
            // value: value,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.arrow_drop_down_sharp),
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(),
        onChanged: (value) {},
      );
    }
  }
}
