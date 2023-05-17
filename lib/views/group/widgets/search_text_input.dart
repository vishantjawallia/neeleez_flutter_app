import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/palettes.dart';

class SearchTextInput extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  const SearchTextInput({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Palettes.grey3.withOpacity(0.4),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Palettes.primary, width: 0.7),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 44,
            padding: const EdgeInsets.only(left: 14),
            child: const Icon(Icons.search),
          ),
          Flexible(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              style: Get.textTheme.bodyLarge!.copyWith(
                color: Palettes.black,
                fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w500, 0.5),
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 14),
                border: InputBorder.none,
                hintText: 'Search...',
                hintStyle: Get.textTheme.bodyMedium!.copyWith(
                  color: Palettes.primary.withOpacity(0.8),
                  fontWeight: FontWeight.lerp(FontWeight.w400, FontWeight.w500, 0.755),
                ),
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
