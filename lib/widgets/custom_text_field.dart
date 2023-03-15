import 'package:flutter/material.dart';
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: const BoxDecoration(
              color: Palettes.greyPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: const Icon(
              Icons.person,
              color: Palettes.white,
              size: 20,
            ),
          ),
          Flexible(
            child: Padding(
              padding: inputFieldPadding ?? const EdgeInsets.only(left: 21),
              child: TextField(
                obscureText: obscureText ?? false,
                controller: controller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: name ?? 'Username / Email:',
                  hintStyle: Theme.of(context).textTheme.bodyText2!.copyWith(color: Palettes.primary),
                  isDense: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
