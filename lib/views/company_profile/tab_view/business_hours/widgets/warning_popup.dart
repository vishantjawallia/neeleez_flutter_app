import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';

Future<Future<Object?>> warningPopup(
  _, {
  String? btn,
  String? dsc,
  String? head,
  String? iconPath,
}) async {
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
            alignment: Alignment.bottomCenter,
            heightFactor: 2.15,
            child: Wrap(
              children: [
                SizedBox(
                  width: 330,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                              ),
                              color: Palettes.primary,
                            ),
                            height: 70,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                                topLeft: Radius.zero,
                                topRight: Radius.zero,
                              ),
                              color: Palettes.white,
                            ),
                            height: 220,
                            width: 330,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  head ?? 'Warning',
                                  style: Get.textTheme.displayMedium!.copyWith(
                                    color: Palettes.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  dsc ?? 'Email or Password not Correct.',
                                  style: Get.textTheme.bodyLarge!.copyWith(
                                    color: Palettes.grey1,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const SizedBox(
                                  width: 280,
                                  child: Divider(
                                    color: Colors.grey,
                                    thickness: 1,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // CustomButton(
                                    //   width: 130,
                                    //   backgroundColor: Palettes.white,
                                    //   text: 'No',
                                    //   rippleColor: Palettes.grey1.withOpacity(0.1),
                                    //   borderColor: Palettes.primary,
                                    //   textColor: Palettes.primary,
                                    //   onTap: () {
                                    //     Get.back();
                                    //   },
                                    // ),
                                    CustomButton(
                                      width: 140,
                                      height: 22,
                                      backgroundColor: Palettes.primary,
                                      textColor: Palettes.white,
                                      borderColor: Palettes.primary,
                                      text: btn ?? 'Ok',
                                      onTap: () async {
                                        Get.back();
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 18),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        top: 22,
                        // right: 99,
                        child: Image.asset(
                          iconPath ?? MyIcon.popC,
                          height: 100,
                          width: 100,
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
