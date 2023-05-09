import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/palettes.dart';

Future<Future<Object?>> selectFilePopup(
  _, {
  Function()? onVideoSelect,
  Function()? onImageSelect,
}) async {
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
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 370,
                    child: Material(
                      color: Palettes.white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                              color: Palettes.white,
                              child: Text(
                                'Select Upload Type',
                                style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            ListTile(
                              focusColor: Palettes.black,
                              title: const Text('Image'),
                              onTap: onImageSelect,
                            ),
                            ListTile(
                              focusColor: Palettes.black,
                              onTap: onVideoSelect,
                              title: const Text('Video'),
                            ),
                            TextButton(
                              onPressed: () => Get.back(),
                              child: const Text(
                                'CANCEL',
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}
