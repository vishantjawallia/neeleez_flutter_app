// ignore_for_file: unused_element, unused_field, no_logic_in_create_state

import 'dart:developer';

import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';

class CustomMultiDropDown extends StatelessWidget {
  final TextEditingController? controller;
  final ScrollController? scrollController;
  final List<String>? list;
  final List<String>? selectedList;
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

  final FocusNode? focusNode;
  final void Function(String? value)? onChanged;
  final void Function(String? value)? onRemove;
  final void Function()? onTap;
  CustomMultiDropDown({
    super.key,
    this.controller,
    this.scrollController,
    this.name,
    this.inputFieldPadding,
    this.widgetMargin,
    this.obscureText,
    this.prefixIconPath = "",
    this.suffixIconPath = "",
    required this.onChanged,
    required this.onRemove,
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
    this.enabled = true,
    this.outlineBorder = false,
    this.suffixIconWidget,
    this.checkedSuffixIcon = false,
    required this.list,
    this.selectedList,
    this.focusNode,
  });

  // List<String>? list;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final GlobalKey<PopupMenuButtonState> _menuKey = GlobalKey<PopupMenuButtonState>();

  @override
  Widget build(BuildContext context) {
    final button = _showPopupMenu();
    return Container(
      key: _scaffoldKey,
      // key: Key('${widget.name}'),
      height: height ?? 50,
      margin: widgetMargin ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Palettes.white,
        borderRadius: BorderRadius.circular(10),
        border: outlineBorder!
            ? Border.all(
                color: Palettes.black,
                width: 0.7,
              )
            : Border.all(
                color: Palettes.white,
                width: 1.5,
              ),
        // border: Border.all(
        //   color: Palettes.white,
        //   width: 1.5,
        // ),
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
                padding: prefixPadding ?? EdgeInsets.symmetric(horizontal: 14, vertical: outlineBorder! ? 13 : 10.5),
                // padding: prefixPadding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10.5),
                decoration: BoxDecoration(
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
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      if (list!.isEmpty) {
                        GlobalWidgets.toast('Empty $name');
                        return;
                      }
                      try {
                        final state = _menuKey.currentState;
                        log(state.runtimeType.toString());
                        state!.showButtonMenu();
                      } catch (e) {
                        log(e.toString());
                      }
                    },
                    child: SizedBox(
                      height: 47,
                      width: 100.w,
                      child: GestureDetector(
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            button,
                            Container(
                                color: Palettes.white,
                                padding: const EdgeInsets.only(left: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    selectedList!.isNotEmpty
                                        ? Flexible(
                                            child: ListView.builder(
                                              controller: scrollController,
                                              itemCount: selectedList!.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              padding: const EdgeInsets.only(right: 40),
                                              itemBuilder: (context, index) {
                                                return Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(16),
                                                      color: Palettes.greyPrimary.withOpacity(0.6),
                                                    ),
                                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text(
                                                          selectedList?[index] ?? 'Account',
                                                          style: Get.textTheme.bodyMedium!.copyWith(
                                                            color: Palettes.black,
                                                            fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 4),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            return onRemove!(selectedList![index]);
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
                                            ),
                                          )
                                        : Align(
                                            alignment: Alignment.centerLeft,
                                            child: SizedBox(
                                              child: Text(
                                                '$name',
                                                style: Get.textTheme.bodyMedium!.copyWith(
                                                  color: Palettes.primary.withOpacity(0.8),
                                                  fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
                                                ),
                                              ),
                                            ),
                                          ),
                                    const Icon(Icons.arrow_drop_down_sharp),
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _showPopupMenu() {
    return PopupMenuButton(
      key: _menuKey,
      iconSize: 0,
      constraints: BoxConstraints(
        maxHeight: 250,
        minWidth: 78.w,
      ),
      offset: const Offset(15, 0),
      itemBuilder: (context) => list!
          .map((e) => PopupMenuItem(
                onTap: () {
                  return onChanged!(e);
                },
                child: Text(
                  e,
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: Palettes.black,
                    fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                  ),
                ),
              ))
          .toList(),
      onSelected: (_) {},
    );
  }
}
