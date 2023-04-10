import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/views/dashboard/dashboard_view_model.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';

import '../../config/palettes.dart';
import '../../config/preference.dart';

Future<Future<Object?>> languagePopup(_, {String? btn, String? dsc, String? head}) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return GestureDetector(
        onTap: () => Get.back(),
        child: Transform.scale(
          scale: curve,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: GestureDetector(
              onTap: () {},
              child: Align(
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    Container(
                      height: 42,
                      width: 330,
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      alignment: Alignment.center,
                      color: Palettes.white,
                      child: Text(
                        'Languages',
                        style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                      ),
                    ),
                    Container(
                      width: 330,
                      color: Palettes.white,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 450,
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: languageList.length,
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              itemBuilder: (context, index) {
                                Map data = languageList[index];
                                List listData = languageList[index]['languageList'];
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                  decoration: languageList.last == index
                                      ? const BoxDecoration()
                                      : const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(color: Palettes.grey1, width: 0.8),
                                          ),
                                        ),
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                                    minVerticalPadding: 2,
                                    minLeadingWidth: 50,
                                    horizontalTitleGap: 10,
                                    leading: UrlImage(
                                      height: 46,
                                      width: 46,
                                      url: data['iconImage'],
                                    ),
                                    title: Text(
                                      '${data['name']}',
                                      style: Get.textTheme.headlineSmall!.copyWith(color: Palettes.black),
                                    ),
                                    subtitle: Row(
                                      children: listData.map(
                                        (e) {
                                          String name = e['name'];
                                          return name.isNotEmpty
                                              ? Padding(
                                                  padding: const EdgeInsets.only(right: 16),
                                                  child: Material(
                                                    borderRadius: BorderRadius.circular(5),
                                                    child: InkWell(
                                                      borderRadius: BorderRadius.circular(5),
                                                      onTap: () async {
                                                        Locale local = e['local'];
                                                        Map<String, dynamic> obj = {
                                                          "iconImage": data['iconImage'],
                                                          "language_code": local.languageCode,
                                                          "country_code": local.countryCode,
                                                        };
                                                        await SharedPreferenceHelper.setString(Preferences.languageSelected, jsonEncode(obj));
                                                        Get.updateLocale(Locale("${obj["language_code"]}", "${obj["country_code"]}"));
                                                        Get.back();
                                                        DashboardViewModel().loadItems();
                                                        DashboardViewModel().rebuildUi();
                                                      },
                                                      child: Container(
                                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(5),
                                                          border: Border.all(color: Palettes.primary, width: 0.6),
                                                        ),
                                                        child: Text(
                                                          '${e['name']}',
                                                          style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox();
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}
