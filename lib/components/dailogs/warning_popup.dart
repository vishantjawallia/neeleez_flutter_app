import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';

import '../../config/palettes.dart';

Future<Future<Object?>> warningPopup(_) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: const WarningPopup(),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}

class WarningPopup extends StatelessWidget {
  const WarningPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              'Alert !',
                              style: Get.textTheme.displayMedium!.copyWith(
                                color: Palettes.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Do you really want to logout?',
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CustomButton(
                                  width: 130,
                                  backgroundColor: Palettes.white,
                                  text: 'No',
                                  rippleColor: Palettes.grey1.withOpacity(0.1),
                                  borderColor: Palettes.primary,
                                  textColor: Palettes.primary,
                                  onTap: () {
                                    Get.back();
                                  },
                                ),
                                CustomButton(
                                  width: 130,
                                  backgroundColor: Palettes.primary,
                                  textColor: Palettes.white,
                                  borderColor: Palettes.primary,
                                  text: 'Yes',
                                  onTap: () async {
                                    Get.back();
                                    // await SharedPreferenceHelper.setString(Preferences.customerId, 'N/A');
                                    // await SharedPreferenceHelper.setString(Preferences.countryInfo, 'N/A');
                                    // await SharedPreferenceHelper.setBoolean(Preferences.isLogged, false);
                                    // Get.offAll(() => const LoginView());
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
                      MyIcon.popD,
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
    );
  }
}
