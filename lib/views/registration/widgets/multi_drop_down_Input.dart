import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/palettes.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/drop_down/src/dropdown_button2.dart';
import '../../../widgets/global_widget.dart';

class MultiDropDownInput<E> extends StatelessWidget {
  final String? name;
  final String? itemName;
  final ScrollController? scrollController;
  final String? prefixIconPath;
  final List<String>? selectedList;
  final FocusNode? focusNode;
  final List<DropdownMenuItem<E>>? items;
  final void Function(E? value)? onChanged;
  final void Function(String? value)? onRemove;
  MultiDropDownInput({
    super.key,
    required this.items,
    required this.onChanged,
    required this.name,
    this.prefixIconPath,
    this.focusNode,
    this.selectedList,
    this.itemName,
    required this.onRemove,
    this.scrollController,
  });

  final GlobalKey<DropdownButton2State> _menuKey = GlobalKey<DropdownButton2State>();
  @override
  Widget build(BuildContext context) {
    final button = _showPopupMenu();
    return CustomTextField(
      name: name,
      prefixIconPath: prefixIconPath,
      widgetMargin: const EdgeInsets.symmetric(vertical: 5),
      inputWidget: SizedBox(
        height: 46,
        child: GestureDetector(
          onTap: () {
            if (items!.isEmpty) {
              GlobalWidgets.toast('Select business category first.');
              return;
            }
            try {
              final state = _menuKey.currentState;
              log(state.runtimeType.toString());
              state!.callTap();
            } catch (e) {
              log(e.toString());
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              button,
              Container(
                  // color: Palettes.white,
                  padding: const EdgeInsets.only(left: 12),
                  decoration: const BoxDecoration(
                    color: Palettes.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
                  ),
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
                                            selectedList?[index] ?? 'Account',
                                            style: Get.textTheme.bodyMedium!.copyWith(
                                              color: Palettes.black,
                                              fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
                                            ),
                                          ),
                                          const SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () => onRemove!(selectedList?[index]),
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
    );
  }

  _showPopupMenu() {
    return DropdownButton2(
      key: _menuKey,
      focusNode: focusNode,
      isExpanded: true,
      underline: const SizedBox(),
      hint: Text(
        name ?? 'Select a project',
        style: Get.textTheme.bodyMedium!.copyWith(
          color: Palettes.primary.withOpacity(0.8),
          fontWeight: FontWeight.w500,
        ),
      ),
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(left: 14),
      ),
      dropdownStyleData: const DropdownStyleData(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        width: 310,
        maxHeight: 310,
        offset: Offset(0, -6),
      ),
      items: items,
      // value: value,
      onChanged: onChanged,
    );
  }
}
