// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  final void Function()? onTap;
  const CustomButton({
    Key? key,
    required this.onTap,
    this.text,
    this.padding,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? Palettes.white),
        padding: MaterialStateProperty.all(
          padding ?? const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Palettes.white,
            ),
          ),
        ),
      ),
      child: Text(
        style: textStyle ?? Get.textTheme.headline5!.copyWith(color: textColor ?? Palettes.red, fontWeight: FontWeight.w600),
        text!,
        // 'Log in Now',
      ),
    );
  }
}
