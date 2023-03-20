// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? name;
  final String? iconPath;
  final EdgeInsetsDirectional? inputFieldPadding;
  final bool? obscureText;
  const CustomTextField({
    Key? key,
    this.controller,
    this.name,
    this.iconPath,
    this.inputFieldPadding,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palettes.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Palettes.white,
          width: 1.5,
        ),
      ),
      child: TextField(
        obscureText: obscureText ?? false,
        controller: controller,
        decoration: InputDecoration(
          icon: Container(
            height: 48,
            width: 55,
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Palettes.greyPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: const Icon(
              Icons.person,
              color: Palettes.white,
              // size: 20,
            ),
          ),
          border: InputBorder.none,
          hintText: name ?? 'Username / Email :',
          hintStyle: Get.textTheme.bodyText1!.copyWith(color: Palettes.primary, fontWeight: FontWeight.w600),
          // isDense: true,
        ),
      ),
    );
  }
}
