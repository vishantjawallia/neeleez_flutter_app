import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/palettes.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/drop_down/src/dropdown_button2.dart';

class DropDownInput extends StatelessWidget {
  final String? name;
  final String? prefixIconPath;
  final Object? value;
  final FocusNode? focusNode;
  final List<DropdownMenuItem<Object>>? items;
  final void Function(Object?)? onChanged;
  const DropDownInput({
    super.key,
    required this.items,
    this.value,
    required this.onChanged,
    required this.name,
    required this.prefixIconPath,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      name: name,
      prefixIconPath: prefixIconPath,
      widgetMargin: const EdgeInsets.symmetric(vertical: 5),
      inputWidget: DropdownButton2(
        focusNode: focusNode,
        isExpanded: true,
        isDense: true,
        underline: const SizedBox(),
        hint: Text(
          name ?? 'Select a project',
          style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black, fontWeight: FontWeight.w500),
        ),
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 14),
        ),
        dropdownStyleData: const DropdownStyleData(
          padding: EdgeInsets.zero,
          width: 310,
          maxHeight: 310,
          offset: Offset(0, -16),
          // direction: DropdownDirection.textDirection,
        ),
        items: items,
        value: value,
        onChanged: onChanged,
      ),
    );
  }
}
