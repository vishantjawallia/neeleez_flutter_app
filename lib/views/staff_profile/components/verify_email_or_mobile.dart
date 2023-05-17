import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:pinput/pinput.dart';

import '../../../config/palettes.dart';

Future<Future<Object?>> verifyEmailOrMobile(_) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: const LogoutPopup(),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}

class LogoutPopup extends StatelessWidget {
  final TextEditingController? controller;
  const LogoutPopup({
    Key? key,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          height: 360,
          width: 330,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    'Verify OTP',
                    style: Get.textTheme.displaySmall!.copyWith(
                      color: Palettes.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Provide 6 digit OTP (One Time Password) we just sent you on +916666666666',
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: Palettes.black,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Pinput(
                    controller: controller,
                    onCompleted: (pin) => print(pin),
                    length: 6,
                    obscureText: false,
                    defaultPinTheme: PinTheme(
                      height: 60,
                      width: 200,
                      textStyle: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black, fontWeight: FontWeight.w600),
                      margin: const EdgeInsets.symmetric(vertical: 36),
                      decoration: BoxDecoration(
                        color: Palettes.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(spreadRadius: 0.4, blurRadius: 3, color: Palettes.grey1),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '01:55',
                    style: Get.textTheme.bodySmall!.copyWith(
                      color: Palettes.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomButton(
                      width: 130,
                      backgroundColor: Palettes.white,
                      text: 'Cancel',
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
                      text: 'Verify',
                      onTap: () async {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
