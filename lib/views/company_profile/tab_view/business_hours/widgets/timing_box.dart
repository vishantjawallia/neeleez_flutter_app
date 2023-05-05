import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

class TimingBox extends StatelessWidget {
  final List<Widget>? items;
  final void Function(bool? value, int i)? onSwitchChange;
  final String? text;
  final bool? switchValue;
  final int index;
  final int? companyTimingsIndex;

  // final void Function()? onAddTap;
  // final void Function()? onCloseTap;

  const TimingBox({
    Key? key,
    required this.items,
    required this.onSwitchChange,
    required this.switchValue,
    required this.text,
    required this.index,
    required this.companyTimingsIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // log("====>$closedTimingList");
    // log("====>${obj!.companyTimes!.length}");
    return Container(
      key: Key('$index'),
      padding: const EdgeInsets.only(top: 0, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Padding(
              padding: const EdgeInsets.only(top: 5.5),
              child: Text(
                text ?? 'Monday',
                style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
              ),
            ),
          ),
          SizedBox(
            width: 190,
            child: Column(
              children: items!,
            ),
          ),
          Container(
            width: 80,
            height: 22,
            alignment: Alignment.topRight,
            child: Switch(
              value: switchValue!,
              onChanged: (value) => onSwitchChange!(value, index),
              activeColor: Palettes.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class TimingBoxItem extends StatelessWidget {
  final TimeOfDay? startTiming;
  final TimeOfDay? endTiming;
  final int? index;

  final int? companyTimingsIndex;
  final int? companyDayDetailViewModelsIndex;
  final bool icon;
  final bool isHoliday;
  final Future Function(int? i, int? j, int? k)? onStartTimingTap;
  final Future Function(int? i, int? j, int? k)? onEndTimingTap;
  final Future Function(int? i, int? j, int? k)? onCloseTap;
  final Future Function(int? i, int? j, int? k)? onAddTap;
  const TimingBoxItem({
    super.key,
    required this.onStartTimingTap,
    required this.onEndTimingTap,
    required this.startTiming,
    required this.endTiming,
    required this.onCloseTap,
    required this.onAddTap,
    required this.icon,
    required this.index,
    required this.companyTimingsIndex,
    required this.companyDayDetailViewModelsIndex,
    required this.isHoliday,
  });

  @override
  Widget build(BuildContext context) {
    return isHoliday
        ? Align(
            alignment: Alignment.centerLeft,
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 6),
              height: 36,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Palettes.grey1,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                'Closed',
                style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
                textAlign: TextAlign.center,
              ),
            ),
          )
        : Padding(
            key: Key('$index'),
            padding: const EdgeInsets.only(bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => onStartTimingTap!(companyTimingsIndex!, companyDayDetailViewModelsIndex!, index!),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Palettes.primary),
                    ),
                    child: SizedBox(
                      width: 38,
                      child: Text(
                        toTime(startTiming?.hour, startTiming?.minute),
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: Palettes.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                InkWell(
                  onTap: () => onEndTimingTap!(companyTimingsIndex!, companyDayDetailViewModelsIndex!, index!),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Palettes.primary),
                    ),
                    child: SizedBox(
                      width: 38,
                      child: Text(
                        toTime(endTiming?.hour, endTiming?.minute),
                        style: Get.textTheme.bodyMedium!.copyWith(
                          color: Palettes.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 5),
                !icon
                    ? RotatedBox(
                        quarterTurns: 1,
                        child: GestureDetector(
                          onTap: () => onCloseTap!(companyTimingsIndex!, companyDayDetailViewModelsIndex!, index!),
                          child: SizedBox(
                            height: 24,
                            width: 24,
                            child: Image.asset(
                              MyIcon.iconIncorrect,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () => onAddTap!(companyTimingsIndex!, companyDayDetailViewModelsIndex!, index),
                        child: SizedBox(
                          height: 24,
                          width: 24,
                          child: Image.asset(
                            MyIcon.iconAdd,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
              ],
            ),
          );
  }

  toTime(hour, minute) {
    if (hour != null) {
      var now = DateTime.now();
      var dateTime = DateTime(now.year, now.month, now.day, hour, minute);

      var timeFormat = DateFormat('HH:mm');
      var formattedTime = timeFormat.format(dateTime);
      return formattedTime.toString();
    }
    return "";
  }
}
