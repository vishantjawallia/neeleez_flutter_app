// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';

import '../../../../../config/my_icon.dart';

class CustomInputDropDown extends StatelessWidget {
  final TextEditingController? controller;
  final List<DropdownMenuItem<String>>? items;
  final String? value;
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
  final bool? outlineBorder;
  final String? prefixUrlImage;
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  final void Function()? onAddTap;
  final bool? isCustomRtl;
  const CustomInputDropDown({
    Key? key,
    this.controller,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    this.onChanged,
    this.prefixIconColor = Palettes.primary,
    this.prefixIconSize,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.maxLengthEnforcement,
    this.autofocus,
    this.height,
    this.prefixPadding,
    this.onTap,
    this.onAddTap,
    this.enabled = true,
    this.outlineBorder = true,
    this.suffixIconWidget,
    this.checkedSuffixIcon = false,
    this.isCustomRtl = false,
    this.prefixUrlImage,
    this.items,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: Key('$name'),
      height: height ?? 50,
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: height ?? 50,
              margin: widgetMargin ?? EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Palettes.white,
                borderRadius: BorderRadius.circular(10),
                border: outlineBorder!
                    ? Border.all(
                        color: Palettes.black,
                        width: 0.75,
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
                        padding: prefixPadding ?? EdgeInsets.symmetric(horizontal: 14, vertical: outlineBorder! ? 11.1 : 10.5),
                        decoration: isCustomRtl!
                            ? const BoxDecoration(
                                color: Palettes.greyPrimary,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              )
                            : BoxDecoration(
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
                        child: SizedBox(
                          height: 26,
                          width: 26,
                          child: prefixUrlImage == null
                              ? Image.asset(
                                  prefixIconPath!,
                                  filterQuality: FilterQuality.high,
                                  isAntiAlias: true,
                                  color: prefixIconColor,
                                  // height: 26,
                                  // width: 26,
                                )
                              : UrlImage(
                                  url: prefixUrlImage,
                                  border: Border.all(width: 0),
                                ),
                        ),
                      ),
                      Flexible(
                        child: !enabled!
                            ? _dropDown()
                            : TextField(
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  color: Palettes.primary,
                                  fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                                ),
                                controller: controller,
                                maxLength: maxLength,
                                maxLines: maxLines ?? 1,
                                minLines: minLines,
                                maxLengthEnforcement: maxLengthEnforcement ?? MaxLengthEnforcement.none,
                                enabled: enabled,
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
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: !enabled!
                ? GestureDetector(
                    onTap: onAddTap,
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset(
                        MyIcon.iconAdd,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: SizedBox(
                          height: 21,
                          width: 21,
                          child: Image.asset(
                            MyIcon.checked,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      RotatedBox(
                        quarterTurns: 1,
                        child: GestureDetector(
                          onTap: onAddTap,
                          child: SizedBox(
                            height: 21,
                            width: 21,
                            child: Image.asset(
                              MyIcon.iconIncorrect,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  _dropDown() {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: DropdownButton<String>(
        // focusNode: focusNode,
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
        items: items,
        icon: const Icon(Icons.arrow_drop_down_sharp),
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(),
        onChanged: onChanged,
      ),
    );
  }
}
