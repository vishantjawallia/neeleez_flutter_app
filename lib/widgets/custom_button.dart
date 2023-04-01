// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? rippleColor;
  final EdgeInsets? padding;
  final TextStyle? textStyle;
  final double? width;

  final void Function()? onTap;
  const CustomButton({
    Key? key,
    required this.onTap,
    this.text,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.width,
    this.borderColor,
    this.rippleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? Palettes.white),
        padding: MaterialStateProperty.all(
          padding ?? const EdgeInsets.symmetric(vertical: 12),
        ),
        overlayColor: MaterialStateProperty.resolveWith(
          (states) {
            return states.contains(MaterialState.pressed) ? (rippleColor ?? Palettes.red.withOpacity(0.045)) : null;
          },
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: borderColor ?? Palettes.white,
            ),
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: width ?? 100.w,
        child: Text(
          style: textStyle ?? Get.textTheme.headline5!.copyWith(color: textColor ?? Palettes.red, fontWeight: FontWeight.w600),
          text!,
          // 'Log in Now',
        ),
      ),
    );
  }
}
