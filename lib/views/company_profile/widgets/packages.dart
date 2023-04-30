import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';

import '../../../models/company/company_profile.dart';

class Packages extends StatelessWidget {
  final CompanyPackage? companyPackage;
  const Packages({
    Key? key,
    required this.companyPackage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Packages'.tr,
                    style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black, fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 3,
                    width: 35,
                    decoration: const BoxDecoration(
                      color: Palettes.red,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            companyPackage != null ? _activePackage() : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Container _activePackage() {
    return Container(
      height: 230,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Palettes.red,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(blurRadius: 20, spreadRadius: 0.5, color: Palettes.grey1),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            color: Palettes.white,
            alignment: Alignment.center,
            child: Text(
              companyPackage!.packageNameEn!,
              // 'Entry Package'.tr,
              style: Get.textTheme.displayLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.red),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            'Expiry Date: ${companyPackage!.expiryDateTime!}'.tr,
            style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600, color: Palettes.white),
          ),
          const SizedBox(height: 1),
          Text(
            companyPackage!.remarkEn!,
            style: Get.textTheme.titleLarge!.copyWith(color: Palettes.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          CustomButton(
            onTap: () {},
            text: 'Upgrade',
            backgroundColor: Palettes.white,
            borderColor: Palettes.primary,
          )
        ],
      ),
    );
  }
}
