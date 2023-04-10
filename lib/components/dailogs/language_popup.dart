import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config/palettes.dart';

Future<Future<Object?>> languagePopup(_, {String? btn, String? dsc, String? head}) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
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
                          shrinkWrap: true,
                          itemCount: 10,
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 10),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Palettes.grey1, width: 0.8),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(horizontal: 4),
                                minVerticalPadding: 2,
                                minLeadingWidth: 50,
                                horizontalTitleGap: 10,
                                leading: const Icon(
                                  Icons.circle,
                                  color: Palettes.primary,
                                  size: 50,
                                ),
                                title: Text(
                                  'English',
                                  style: Get.textTheme.headlineSmall!.copyWith(color: Palettes.black),
                                ),
                                subtitle: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Palettes.primary,
                                      ),
                                      child: Text(
                                        'English',
                                        style: Get.textTheme.bodySmall!,
                                      ),
                                    ),
                                    const SizedBox(width: 22),
                                    Text(
                                      'francais',
                                      style: Get.textTheme.bodySmall!.copyWith(color: Palettes.black),
                                    ),
                                  ],
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
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}
