import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomMultiDropDown extends StatefulWidget {
  final TextEditingController? controller;
  final List<String>? list;
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
  final Function(List<String>? value)? onChanged;
  final void Function()? onTap;
  const CustomMultiDropDown({
    Key? key,
    this.controller,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    required this.onChanged,
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
    required this.list,
  }) : super(key: key);

  @override
  State<CustomMultiDropDown> createState() => _CustomMultiDropDownState();
}

class _CustomMultiDropDownState extends State<CustomMultiDropDown> {
  List<String>? list;
  List<String>? selectItem = [];
  _CustomMultiDropDownState();
  String? dropdownValue;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _scaffoldKey,
      // key: Key('${widget.name}'),
      height: widget.height ?? 50,
      margin: widget.widgetMargin ?? EdgeInsets.zero,
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
                padding: widget.prefixPadding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10.5),
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
                  widget.prefixIconPath!,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  color: widget.prefixIconColor,
                  height: 26,
                  width: 26,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: SizedBox(
                    height: 47,
                    child: Stack(
                      fit: StackFit.passthrough,
                      children: [
                        _dropDown(),
                        Positioned(
                          child: Container(
                              width: 65.w,
                              color: Palettes.white,
                              padding: const EdgeInsets.only(left: 12),
                              child: selectItem!.isNotEmpty
                                  ? ListView.builder(
                                      itemCount: selectItem!.length,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: Palettes.greyPrimary,
                                            ),
                                            padding: const EdgeInsets.symmetric(horizontal: 14),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  selectItem![index] ?? 'Account',
                                                  style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                                                ),
                                                const SizedBox(width: 4),
                                                GestureDetector(
                                                  onTap: () async {
                                                    setState(() {
                                                      if (selectItem!.contains(selectItem![index])) {
                                                        selectItem!.remove(selectItem![index]);
                                                      }
                                                    });
                                                    return await widget.onChanged!(selectItem!.toSet().toList());
                                                  },
                                                  child: const Icon(
                                                    Icons.cancel,
                                                    color: Palettes.red,
                                                    size: 19,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  : Align(
                                      alignment: Alignment.centerLeft,
                                      child: SizedBox(
                                        child: Text(
                                          '${widget.name}',
                                          style: Get.textTheme.bodyMedium!.copyWith(
                                            color: Palettes.primary.withOpacity(0.8),
                                            fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
                                          ),
                                        ),
                                      ),
                                    )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              widget.suffixIconPath!.isNotEmpty
                  ? Container(
                      padding: const EdgeInsets.only(bottom: 7),
                      child: Padding(
                        padding: Helper.isRtl() ? const EdgeInsets.only(right: 10, top: 6) : const EdgeInsets.only(left: 10, top: 6),
                        child: Image.asset(
                          widget.suffixIconPath!,
                          height: 20,
                          width: 20,
                          filterQuality: FilterQuality.high,
                          isAntiAlias: true,
                        ),
                      ),
                    )
                  : const SizedBox(),
              widget.suffixIconWidget ?? const SizedBox(),
            ],
          ),
        ],
      ),
    );
  }

  _dropDown() {
    return Align(
      alignment: Alignment.center,
      child: DropdownButton<String>(
        isExpanded: true,
        isDense: true,
        value: dropdownValue ?? widget.list!.first,
        icon: const Icon(
          Icons.arrow_drop_down_sharp,
          size: 20,
        ),
        // elevation: 16,
        // style: const TextStyle(color: Colors.deepPurple),
        style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black),
        underline: Container(),
        autofocus: true,
        onChanged: (String? value) async {
          setState(() {
            if (!selectItem!.contains(value)) {
              selectItem!.add(value!);
            }
          });
          return await widget.onChanged!(selectItem!.toSet().toList());
        },

        items: widget.list!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              // style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black),
            ),
          );
        }).toList(),
      ),
    );
  }
}
