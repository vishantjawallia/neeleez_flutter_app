import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomDropDown extends StatefulWidget {
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
  final void Function(String? value)? onChanged;
  final void Function()? onTap;
  const CustomDropDown({
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
    required this.list,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  List<String>? list;
  _CustomDropDownState();
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('${widget.name}'),
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
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: _dropDown(),
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

  DropdownButton<String> _dropDown() {
    return DropdownButton<String>(
      isExpanded: true,
      isDense: true,
      value: dropdownValue ?? widget.list!.first,
      icon: const Icon(Icons.arrow_drop_down_sharp),
      // elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: widget.list!.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>
        (
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
