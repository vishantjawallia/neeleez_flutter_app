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
        borderRadius: const BorderRadius.only(topRight: Radius.circular(24), bottomRight: Radius.circular(24)),
        child: Drawer(
          width: 80.w,
          child: Column(
            children: [
              Container(
                height: 20.h,
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
                          style: Get.textTheme.bodyText1!.copyWith(color: Palettes.white.withOpacity(0.6)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: ListView.builder(
                  itemCount: drawer.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  itemBuilder: (context, index) {
                    String name = drawer[index]['name'];
                    return Container(
                      alignment: Alignment.center,
                      height: 5.3.h,
                      padding: const EdgeInsets.only(left: 14),
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: index == 0 ? Palettes.primary : Colors.transparent,
                            width: 2.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Row(
                        children: <Widget>[
                          const Icon(
                            Icons.dashboard_customize,
                            size: 20,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            name,
                            style: Get.textTheme.bodyText1!.copyWith(color: Palettes.primary),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
