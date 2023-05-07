import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class CustomDropDown1 extends StatelessWidget {
  final List<DropdownMenuItem<String>>? items;
  final String? name;
  final String? hint;
  final String? prefixIconPath;
  final Color? prefixIconColor;
  final String? value;
  final FocusNode? focusNode;
  final void Function(String? value)? onChanged;
  const CustomDropDown1({
    Key? key,
    this.name,
    this.prefixIconPath = "",
    this.prefixIconColor = Palettes.primary,
    required this.items,
    this.value,
    this.hint,
    this.focusNode,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('$name'),
      height: 50,
      margin: EdgeInsets.zero,
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
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10.5),
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
                  prefixIconPath!,
                  filterQuality: FilterQuality.high,
                  isAntiAlias: true,
                  color: prefixIconColor,
                  height: 26,
                  width: 26,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: _dropDown(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _dropDown() {
    return DropdownButton<String>(
      focusNode: focusNode,
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
      //  list!.map<DropdownMenuItem<String>>((String value) {
      //   return DropdownMenuItem<String>(
      //     value: value,
      //     child: Text(
      //       value,
      //       style: Get.textTheme.bodyMedium!.copyWith(
      //         color: Palettes.black,
      //         fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.5),
      //       ),
      //     ),
      //   );
      // }).toList(),
      icon: const Icon(Icons.arrow_drop_down_sharp),
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(),
      onChanged: onChanged,
    );
  }
}

class DropDownModel {
  final int? id;
  final String? nameEn;
  final String? nameAr;
  final String? nameFr;
  const DropDownModel({
    this.id,
    this.nameEn,
    this.nameAr,
    this.nameFr,
  });
  DropDownModel copyWith({int? id, String? nameEn, String? nameAr, String? nameFr}) {
    return DropDownModel(
      id: id ?? this.id,
      nameEn: nameEn ?? this.nameEn,
      nameAr: nameAr ?? this.nameAr,
      nameFr: nameFr ?? this.nameFr,
    );
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'nameEn': nameEn, 'nameAr': nameAr, 'nameFr': nameFr};
  }

  static DropDownModel fromJson(Map<String, Object?> json) {
    return DropDownModel(
        id: json['id'] == null ? null : json['id'] as int,
        nameEn: json['nameEn'] == null ? null : json['nameEn'] as String,
        nameAr: json['nameAr'] == null ? null : json['nameAr'] as String,
        nameFr: json['nameFr'] == null ? null : json['nameFr'] as String);
  }

  @override
  String toString() {
    return '''DropDownModel(
                id:$id,
nameEn:$nameEn,
nameAr:$nameAr,
nameFr:$nameFr
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is DropDownModel && other.runtimeType == runtimeType && other.id == id && other.nameEn == nameEn && other.nameAr == nameAr && other.nameFr == nameFr;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, nameEn, nameAr, nameFr);
  }
}
