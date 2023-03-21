// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';

class CustomTextField extends StatelessWidget {
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
  const CustomTextField({
    Key? key,
    this.controller,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    this.onChanged, this.prefixIconColor, this.prefixIconSize,
  }) : super(key: key);

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
            // offset: const Offset(1, 1),
          ),
          // BoxShadow(
          //   blurRadius: 2.4,
          //   color: Palettes.white.withOpacity(0.7),
          //   spreadRadius: 0.9,
          //   offset: const Offset(1, 1),
          // ),
          // BoxShadow(
          //   blurRadius: 2.4,
          //   color: Palettes.white.withOpacity(0.7),
          //   spreadRadius: 0.9,
          //   offset: const Offset(1, 1),
          // ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            ),
          ),
          Flexible(
            child: Container(
              // color: Palettes.,
              child: TextField(
                // onChanged: (value) => onChanged!(value),
                obscureText: obscureText ?? false,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                  border: InputBorder.none,
                  hintText: name ?? 'Username / Email :',
                  hintStyle: Get.textTheme.bodyText1!.copyWith(color: Palettes.primary, fontWeight: FontWeight.w600),
                  isDense: true,
                ),
              ),
            ),
          ),
          suffixIconPath!.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, top: 6),
                    child: Image.asset(
                      suffixIconPath!,
                      height: 16,
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
