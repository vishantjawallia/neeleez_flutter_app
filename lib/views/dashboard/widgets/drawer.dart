// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

import '../../../config/config.dart';

class CustomDrawer extends Drawer {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                height: 22.h,
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
                          height: 60,
                          width: 60,
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
                    // SizedBox(height: 20),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Fransesca Metts',
                          style: Get.textTheme.headline4!.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(
                          'Fransesca@gmail.com',
                          style: Get.textTheme.bodyText1!.copyWith(color: Palettes.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: drawer.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  itemBuilder: (context, index) {
                    Map obj = drawer[index] as Map;
                    String name = obj['name'];
                    bool isLine = obj.containsKey('line') ? true : false;
                    return Container(
                      alignment: Alignment.center,
                      height: 46,
                      padding: Helper.isRtl() ? const EdgeInsets.only(left: 14) : const EdgeInsets.only(right: 14),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: isLine ? Palettes.grey2 : Colors.transparent,
                      ))
                          // border: Border(
                          //   left: BorderSide(
                          //     color: index == 0 ? Palettes.primary : Colors.transparent,
                          //     width: 2.5,
                          //     style: BorderStyle.solid,
                          //   ),
                          // ),
                          ),
                      child: Row(
                        children: <Widget>[
                          const Icon(Icons.dashboard_customize, size: 20),
                          const SizedBox(width: 16),
                          Text(
                            name,
                            style: Get.textTheme.bodyText1!.copyWith(
                              color: Palettes.black,
                              fontWeight: FontWeight.w600,
                              // letterSpacing: 1,
                            ),
                          )
                        ],
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
}
