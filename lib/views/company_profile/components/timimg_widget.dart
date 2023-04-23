import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';

class TimingWidget extends StatefulWidget {
  final String? name;
  const TimingWidget({
    super.key,
    this.name,
  });

  @override
  State<TimingWidget> createState() => _TimingWidgetState();
}

class _TimingWidgetState extends State<TimingWidget> {
  bool? closed = false;
  bool? startVisible1 = true;
  bool? startVisible2 = false;
  bool? startVisible3 = false;
  bool? endVisible1 = true;
  bool? endVisible2 = false;
  bool? endVisible3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 9, bottom: 4),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20.w,
            child: Text(
              widget.name ?? 'Monday',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: closed!
                ? InkWell(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30.w,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          decoration: BoxDecoration(
                            color: Palettes.grey1.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Colsed'.tr,
                            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black.withOpacity(0.8), fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      timingBox(
                        onEndTap: () => endCalenderOpen1(),
                        onStartTap: () => startCalenderOpen1(),
                        onAddCrossTap: () {
                          if (startVisible3 == true) {
                            return;
                          } else if (startVisible2 == true) {
                            setState(() {
                              startVisible3 = true;
                            });
                          } else {
                            setState(() {
                              startVisible2 = true;
                            });
                          }
                        },
                      ),
                      Visibility(
                        visible: startVisible2!,
                        child: timingBox(
                          cross: true,
                          onEndTap: () => endCalenderOpen2(),
                          onStartTap: () => startCalenderOpen2(),
                          onAddCrossTap: () {
                            setState(() {
                              startVisible2 = false;
                            });
                          },
                        ),
                      ),
                      Visibility(
                        visible: startVisible3!,
                        child: timingBox(
                          cross: true,
                          onEndTap: () => endCalenderOpen3(),
                          onStartTap: () => startCalenderOpen3(),
                          onAddCrossTap: () {
                            setState(() {
                              startVisible3 = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
          ),
          Container(
            width: 19.w,
            height: 22,
            alignment: Alignment.topRight,
            child: Switch(
              value: closed!,
              onChanged: (bool value) {
                setState(() {
                  closed = !closed!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  timingBox({
    bool? cross = false,
    final void Function()? onStartTap,
    final void Function()? onEndTap,
    final void Function()? onAddCrossTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: onStartTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Palettes.primary),
              ),
              child: Text(
                '09:00'.tr,
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: Palettes.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(width: 2.w),
          InkWell(
            onTap: onEndTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Palettes.primary),
              ),
              child: Text(
                '16:00'.tr,
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: Palettes.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          const SizedBox(width: 5),
          cross!
              ? GestureDetector(
                  onTap: onAddCrossTap,
                  child: const RotatedBox(
                    quarterTurns: 90,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Palettes.red,
                      child: Icon(
                        Icons.cancel,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                )
              : GestureDetector(
                  onTap: onAddCrossTap,
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  startCalenderOpen1() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }

  endCalenderOpen1() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }

  startCalenderOpen2() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }

  endCalenderOpen2() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }

  startCalenderOpen3() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }

  endCalenderOpen3() async {
    TimeOfDay? pickedS = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(data: MediaQuery.of(context!).copyWith(alwaysUse24HourFormat: false), child: child!);
        });
    log(pickedS!.hour ?? 0);
  }
}
