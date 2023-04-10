// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? name;
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
  final bool? obscureText;
  final bool? autofocus;
  final bool? enabled;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  const CustomTextField({
    Key? key,
    this.controller,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    this.onChanged,
    this.prefixIconColor,
    this.prefixIconSize,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.maxLengthEnforcement,
    this.autofocus,
    this.height,
    this.prefixPadding,
    this.onTap,
    this.enabled = true,
    this.suffixIconWidget,
    this.checkedSuffixIcon = false,
  }) : super(key: key);

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
                child: Container(
                  child: TextField(
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: Palettes.primary,
                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                    ),
                    // autofocus: autofocus ?? false,
                    controller: controller,
                    maxLength: maxLength,
                    maxLines: maxLines ?? 1,
                    minLines: minLines,
                    maxLengthEnforcement: maxLengthEnforcement ?? MaxLengthEnforcement.none,
                    // onTap: onTap,
                    enabled: enabled,
                    // onChanged: (value) => onChanged!(value),
                    obscureText: obscureText ?? false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                      border: InputBorder.none,
                      hintText: name ?? 'Username / Email :',
                      hintStyle: Get.textTheme.bodyMedium!.copyWith(
                        color: Palettes.primary.withOpacity(0.8),
                        fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
                      ),
                      isDense: true,
                    ),
                  ),
                ),
              ),
              // obscureText ?? false
              //     ? Container(
              //         padding: const EdgeInsets.only(bottom: 7),
              //         child: Padding(
              //           padding: Helper.isRtl() ? const EdgeInsets.only(right: 10, top: 6) : const EdgeInsets.only(left: 10, top: 6),
              //           child: Image.asset(
              //             '',
              //             height: 26,
              //             width: 26,
              //             filterQuality: FilterQuality.high,
              //             isAntiAlias: true,
              //           ),
              //         ),
              //       )
              //     : const SizedBox(),
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
}
