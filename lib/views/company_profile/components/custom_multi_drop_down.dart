// ignore_for_file: unused_element, unused_field

import 'dart:developer';

import 'package:flutter/material.dart';
// ignore_for_file: deprecated_member_use

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomMultiDropDown extends StatefulWidget {
  final TextEditingController? controller;
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
  final void Function(List<String>? value)? onChanged;
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
    this.suffixIconWidget,
    this.checkedSuffixIcon = false,
    required this.list,
    this.selectedList,
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
  final GlobalKey<PopupMenuButtonState> _menuKey = GlobalKey<PopupMenuButtonState>();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final button = _showPopupMenu();
    // _scrollController.addListener(() async {
    //   if ((_scrollController.position.maxScrollExtent == _scrollController.position.pixels)) {
    //     log("message");
    //     // setState(() {
    //     //   isScroll = false;
    //     //   page = page! + 1;
    //     // });
    //     // final url = '${widget.url}?page=$page&user_id=$userId';
    //     // final res = await apiRepository.apiGet(url, true);
    //     // if (res != null) {
    //     //   MembersData data = MembersData.fromJson(res);
    //     //   if (mounted) {
    //     //     setState(
    //     //       () {
    //     //         if (memberList!.length < data.members!.toList().length) {
    //     //           isScroll = true;
    //     //           memberList = data.members!.toList();
    //     //         } else {
    //     //           noMoreData = true;
    //     //           log('No more Data');
    //     //         }
    //     //       },
    //     //     );
    //     //   }
    //     // }
    //   }
    // });
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
                  child: GestureDetector(
                    onTap: () {
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
                                    selectItem!.isNotEmpty
                                        ? Flexible(
                                            child: ListView.builder(
                                              controller: _scrollController,
                                              // addAutomaticKeepAlives: true,
                                              // addRepaintBoundaries: true,
                                              // addSemanticIndexes: true,
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
                                                          selectItem?[index] ?? 'Account',
                                                          style: Get.textTheme.bodyMedium!.copyWith(
                                                            color: Palettes.black,
                                                            fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                                                          ),
                                                        ),
                                                        const SizedBox(width: 4),
                                                        GestureDetector(
                                                          onTap: () async {
                                                            setState(() {
                                                              if (selectItem!.contains(selectItem![index])) {
                                                                selectItem!.remove(selectItem![index]);
                                                              }
                                                            });
                                                            // try {
                                                            //   setState(() {
                                                            //     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
                                                            //   });
                                                            // } catch (e) {
                                                            //   log(e.toString());
                                                            // }
                                                            return widget.onChanged!(selectItem!.toSet().toList());
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
                                                '${widget.name}',
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
      position: PopupMenuPosition.over,
      // itemBuilder: (context) => ['Delete', 'Rename', 'Delete', 'Deete', 'Delete', 'Delete']
      itemBuilder: (context) => widget.list!
          .map((e) => PopupMenuItem(
                onTap: () {
                  setState(() {
                    if (!selectItem!.contains(e)) {
                      selectItem!.add(e);
                    }
                  });
                  widget.onChanged!(selectItem);
                },
                child: SizedBox(
                  child: Text(
                    e,
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: Palettes.black,
                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                    ),
                    // style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black),
                  ),
                ),
              ))
          .toList(),
      onSelected: (_) {},
    );
  }

  setValue() {
    setState(() {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
    return;
  }
}
