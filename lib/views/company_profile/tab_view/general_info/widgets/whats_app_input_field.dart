import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

import '../../../../../helpers/helper.dart';

class WhatsAppInputField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? prefixIconPath;
  final String? name;
  final String? countryCode;
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
  final Widget? suffixIconWidget;
  final bool? obscureText;
  final bool? autofocus;
  final bool? enabled;
  final String? prefixUrlImage;
  final void Function(String? value)? onChanged;
  final void Function()? onCountryCodeTap;
  final void Function()? onTap;
  final bool? isCustomRtl;
  final bool outlineBorder;
  const WhatsAppInputField({
    Key? key,
    this.controller,
    this.name,
    this.prefixIconPath,
    this.prefixIconColor,
    this.prefixIconSize,
    this.height,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.suffixIconPath,
    this.checkedSuffixIcon,
    this.inputFieldPadding,
    this.prefixPadding,
    this.widgetMargin,
    this.suffixIconWidget,
    this.obscureText,
    this.autofocus,
    this.enabled,
    this.prefixUrlImage,
    this.onChanged,
    this.onTap,
    this.isCustomRtl = false,
    required this.outlineBorder,
    this.countryCode,
    this.onCountryCodeTap, this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('$name'),
      height: height ?? 50,
      margin: widgetMargin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Palettes.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        border: outlineBorder
            ? Border.all(
                color: Palettes.black,
                width: 0.7,
              )
            : Border.all(
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
                height: 48.5,
                padding: prefixPadding ?? EdgeInsets.symmetric(horizontal: 14, vertical: outlineBorder ? 13 : 10.5),
                decoration: isCustomRtl!
                    ? const BoxDecoration(
                        color: Palettes.greyPrimary,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(9),
                          bottomRight: Radius.circular(9),
                        ),
                      )
                    : BoxDecoration(
                        color: Palettes.greyPrimary,
                        borderRadius: Helper.isRtl()
                            ? const BorderRadius.only(
                                topLeft: Radius.circular(9),
                                bottomLeft: Radius.circular(9),
                              )
                            : const BorderRadius.only(
                                topRight: Radius.circular(9),
                                bottomRight: Radius.circular(9),
                              ),
                      ),
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.asset(
                    prefixIconPath!,
                    filterQuality: FilterQuality.high,
                    isAntiAlias: true,
                    color: prefixIconColor,
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onCountryCodeTap,
                  child: SizedBox(
                    child: Container(
                      width: 65,
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      margin: const EdgeInsets.symmetric(vertical: 14.5),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: Palettes.grey3,
                            width: 0.7,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            countryCode!,
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Palettes.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 14,
                            child: Image.asset(
                              MyIcon.upArrow,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                child: GestureDetector(
                  onTap: onTap,
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: Palettes.primary,
                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                    ),
                    enabled: enabled,
                    obscureText: obscureText ?? false,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(left: 8, right: 14),
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
