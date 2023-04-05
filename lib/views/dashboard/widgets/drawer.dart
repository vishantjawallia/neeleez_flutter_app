// ignore_for_file: deprecated_member_use, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:shimmer/shimmer.dart';

import '../../../config/config.dart';
import '../../../models/user_data.dart';
import '../dashboard_view_model.dart';

class CustomDrawer extends Drawer {
  final void Function(Map obj)? onItemTap;
  final DashboardViewModel _dashboardController = DashboardViewModel();
  CustomDrawer({
    Key? key,
    required this.onItemTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserData? useData = _dashboardController.userData;
    bool? isBusy = _dashboardController.isBusy;
    return SafeArea(
      child: ClipRRect(
        borderRadius: Helper.isRtl()
            ? const BorderRadius.only(
                topRight: Radius.circular(24),
                bottomRight: Radius.circular(24),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
        child: Drawer(
          width: 80.w,
          child: Column(
            children: [
              Container(
                height: 212,
                width: 100.w,
                padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 22),
                color: Palettes.primary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Palettes.red,
                            border: Border.all(color: Palettes.white),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.maybePop(context);
                          },
                          child: const Icon(
                            Icons.menu,
                            color: Palettes.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _nameData(isBusy, useData)
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: drawer.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemBuilder: (context, index) {
                    Map obj = drawer[index] as Map;
                    String name = obj['name'];
                    bool isLine = obj.containsKey('line') ? true : false;
                    return InkWell(
                      onTap: () => onItemTap!(obj),
                      child: Container(
                        alignment: Alignment.center,
                        height: 42,
                        padding: Helper.isRtl() ? const EdgeInsets.only(left: 14) : const EdgeInsets.only(right: 14),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: isLine ? Palettes.grey2 : Colors.transparent,
                            ),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.asset(
                              obj['icon'],
                              filterQuality: FilterQuality.low,
                              height: 20,
                              width: 20,
                            ),
                            const SizedBox(width: 16),
                            Text(
                              name,
                              style: Get.textTheme.bodyLarge!.copyWith(
                                color: Palettes.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Text(
                  '0.0.7',
                  style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, color: Palettes.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _nameData(isBusy, useData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        isBusy! || useData == null
            ? SizedBox(
                height: 14,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Palettes.white.withOpacity(0.4),
                    ),
                  ),
                ),
              )
            : Text(
                "${useData!.firstName!} ${useData!.lastName!}",
                style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
              ),
        isBusy! || useData == null
            ? SizedBox(
                height: 14,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white,
                  child: Container(
                    margin: const EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Palettes.white.withOpacity(0.4),
                    ),
                  ),
                ),
              )
            : Text(
                useData!.email!,
                style: Get.textTheme.bodyText1!.copyWith(color: Palettes.white),
              ),
      ],
    );
  }
}
