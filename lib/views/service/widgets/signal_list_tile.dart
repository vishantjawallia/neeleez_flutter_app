import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';

import '../../../config/palettes.dart';

class SingleListTile extends StatelessWidget {
  final void Function(BuildContext context)? onDeleteTap;
  final void Function()? onEditTap;
  final void Function()? onTap;
  const SingleListTile({
    super.key,
    this.onTap,
    this.onDeleteTap,
    this.onEditTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 0.4,
              color: Palettes.grey1.withOpacity(0.5),
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const UrlImage(
                        url: '',
                        height: 55,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Designation'.tr,
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Palettes.grey3,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'hhhhh'.tr,
                              style: Get.textTheme.bodyMedium!.copyWith(
                                color: Palettes.grey3,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '46 464,00 Dh'.tr,
                              style: Get.textTheme.bodySmall!.copyWith(
                                color: Palettes.grey3,
                                // fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () => onDeleteTap!(context),
                    child: Container(
                      height: 34.5,
                      padding: const EdgeInsets.only(left: 3, right: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                        ),
                        color: Palettes.red,
                      ),
                      child: const Icon(
                        Icons.delete_forever_outlined,
                        size: 16,
                        color: Palettes.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onEditTap,
                    child: Container(
                      height: 34.5,
                      padding: const EdgeInsets.only(left: 3, right: 4),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                        ),
                        color: Palettes.primary,
                      ),
                      child: const Icon(
                        size: 16,
                        Icons.edit_square,
                        color: Palettes.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // child: ListTile(
          //   // dense: true,
          //   onTap: onTap,
          //   contentPadding: EdgeInsets.zero,
          //   // contentPadding: const EdgeInsets.only(left: 12),
          //   leading: const UrlImage(
          //     url: '',
          //   ),
          //   // leading: Container(
          //   //   width: 55,
          //   //   decoration: BoxDecoration(
          //   //     // borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          //   //     color: Colors.blue.withOpacity(0.1),
          //   //     // shape: BoxShape.circle,
          //   //   ),
          //   //   child: Container(
          //   //     // padding: const EdgeInsets.symmetric(vertical: 15),
          //   //     child: const UrlImage(
          //   //       url: '',
          //   //     ),
          //   //   ),
          //   // ),
          //   title: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         'Designation'.tr,
          //         style: Get.textTheme.bodyLarge!.copyWith(
          //           color: Palettes.grey3,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       Text(
          //         'hhhhh'.tr,
          //         style: Get.textTheme.bodyMedium!.copyWith(
          //           color: Palettes.grey3,
          //           // fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       Text(
          //         '46 464,00 Dh'.tr,
          //         style: Get.textTheme.bodySmall!.copyWith(
          //           color: Palettes.grey3,
          //           // fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          //   horizontalTitleGap: 10,
          //   minVerticalPadding: 0,
          //   trailing: Column(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       GestureDetector(
          //         onTap: () => onCrossTap!(context),
          //         child: Container(
          //           height: 25,
          //           decoration: const BoxDecoration(color: Palettes.red),
          //           child: const Icon(
          //             Icons.delete_forever_outlined,
          //             size: 18,
          //             color: Palettes.white,
          //           ),
          //         ),
          //       ),
          //       GestureDetector(
          //         onTap: () => onCrossTap!(context),
          //         child: Container(
          //           height: 25,
          //           decoration: const BoxDecoration(
          //             color: Palettes.primary,
          //           ),
          //           child: const Icon(
          //             size: 18,
          //             Icons.edit_square,
          //             color: Palettes.white,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
