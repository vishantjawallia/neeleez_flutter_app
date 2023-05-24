import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/palettes.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/drop_down/src/dropdown_button2.dart';

class DropDownInput<E> extends StatelessWidget {
  final String? name;
  final String? prefixIconPath;
  final E? value;
  final FocusNode? focusNode;
  final List<DropdownMenuItem<E>>? items;
  final void Function(E? value)? onChanged;
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
      inputWidget: SizedBox(
        height: 46,
        child: DropdownButton2(
          focusNode: focusNode,
          isExpanded: true,
          // isDense: true,
          underline: const SizedBox(),
          hint: Text(
            name ?? 'Select a project',
            // Get.textTheme.bodyMedium!.copyWith(
            //                 color: Palettes.primary.withOpacity(0.8),
            //                 fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
            //               )
            style: Get.textTheme.bodyMedium!.copyWith(
              color: Palettes.primary.withOpacity(0.7),
              fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
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

            // direction: DropdownDirection.textDirection,
          ),
          items: items,
          value: value,
          // style: Get.textTheme.bodyMedium!.copyWith(
          //   color: Palettes.primary,
          //   fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
          // ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
