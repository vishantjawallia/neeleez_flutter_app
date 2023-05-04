import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/business_hours_provider.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../models/company/timing.dart';
import 'widgets/timing_box.dart';
// import 'widgets/timing_box.dart';
// import '../../widgets/timing_box.dart';

class BusinessHours extends StatelessWidget {
  final void Function(dynamic body)? onBusinessHoursSave;
  List<CompanyTimings>? timings;
  BusinessHours({
    Key? key,
    required this.timings,
    required this.onBusinessHoursSave,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final buss = Provider.of<BusinessHoursProvider>(context);
    if (timings != null) {
      buss.setTimings(timings!);
    }
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Align(
              alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Business Hours'.tr,
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
                  GestureDetector(
                    onTap: () {
                      buss.clearNewCompanyTimes();
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Palettes.primary),
                      ),
                      child: Text(
                        'Apply All'.tr,
                        style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black, fontSize: 15),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Palettes.grey1),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Day',
                        style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
                      ),
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Start',
                              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              'End',
                              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Holiday',
                        style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
                      ),
                    ],
                  ),
                ),
                ...buss.timings
                    .asMap()
                    .map(
                      (i, CompanyTimings companyTimings) {
                        if (companyTimings.companyDayDetailViewModels!.isEmpty) {
                          buss.addSingleEntryInAll(i, companyTimings);
                        }
                        return MapEntry(
                          i,
                          Column(
                              children: companyTimings.companyDayDetailViewModels!.isNotEmpty
                                  ? companyTimings.companyDayDetailViewModels!
                                      .asMap()
                                      .map(
                                        (j, CompanyDayDetailViewModels companyDayDetailViewModels) => MapEntry(
                                          j,
                                          TimingBox(
                                            companyTimingsIndex: i,
                                            index: j,
                                            text: companyDayDetailViewModels.dow,
                                            switchValue: companyDayDetailViewModels.isHoliday,
                                            onSwitchChange: (value, index) => buss.onSwitchChange(value, i, index),
                                            items: companyDayDetailViewModels.companyTimes!
                                                .asMap()
                                                .map(
                                                  (k, CompanyTimes companyTimes) {
                                                    return MapEntry(
                                                      k,
                                                      TimingBoxItem(
                                                        companyTimingsIndex: i,
                                                        companyDayDetailViewModelsIndex: j,
                                                        index: k,
                                                        onStartTimingTap: (ii, jj, kk) async {
                                                          log(ii.toString());
                                                          log(jj.toString());
                                                          log(kk.toString());
                                                          buss.onStartTimingTap(context, companyTimes, ii!, jj!, kk!);
                                                        },
                                                        onEndTimingTap: (ii, jj, kk) async {
                                                          log(ii.toString());
                                                          log(jj.toString());
                                                          log(kk.toString());
                                                          buss.onEndTimingTap(context, companyTimes, ii!, jj!, kk!);
                                                        },
                                                        icon: companyDayDetailViewModels.companyTimes!.first.id == companyTimes.id,
                                                        startTiming: "${companyTimes.startHour}:${companyTimes.startMinute}",
                                                        isHoliday: companyDayDetailViewModels.isHoliday!,
                                                        endTiming: "${companyTimes.endHour}:${companyTimes.endMinute}",
                                                        onAddTap: (ii, jj, kk) async {
                                                          buss.way2AddList(ii!, jj!, kk!, companyTimes);
                                                        },
                                                        onCloseTap: (ii, jj, kk) async {
                                                          buss.way2RemoveList(ii!, jj!, kk!);
                                                        },
                                                      ),
                                                    );
                                                  },
                                                )
                                                .values
                                                .toList(),
                                          ),
                                        ),
                                      )
                                      .values
                                      .toList()
                                  : []),
                        );
                      },
                    )
                    .values
                    .toList(),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: CustomButton(
                textColor: Palettes.white,
                width: 300,
                text: 'Save',
                backgroundColor: Palettes.primary,
                borderColor: Palettes.primary,
                onTap: () async {
                  final buss = Provider.of<BusinessHoursProvider>(context, listen: false);
                  List<CompanyDayDetailViewModels> kk = [];
                  for (var i = 0; i < buss.timings.length; i++) {
                    CompanyTimings c = buss.timings[i];
                    for (var j = 0; j < c.companyDayDetailViewModels!.length; j++) {
                      kk.add(c.companyDayDetailViewModels![j]);
                    }
                  }
                  // var mm = (kk);
                  log(jsonEncode(kk));
                  // return onBusinessHoursSave!(kk);

                  // buss.timings.map((e) {
                  // List<CompanyDayDetailViewModels> kk = [];
                  //   e.companyDayDetailViewModels!.map((d) {
                  //     kk.add(d);
                  //   });
                  // });
                  // buss.timings.map(
                  //   (e) => e.companyDayDetailViewModels!.map((d) {
                  //     kk.add(d);
                  //     // log(d.)
                  //   }),
                  // );
                  // log(kk.length.toString());
                  // log(kk.toString());
                  // log(message)
                  // kk.map((e) {
                  //   log(e.toJson().toString());
                  // });
                  // log(jsonEncode(kk));

                  // log(hh.asMap().);

                  // hh.mapMany((item) {
                  //   log(item.toString());
                  //   return null;
                  // });
                  // log(hh.asMap().toString());
                  // var timing = [
                  //   {
                  //     "id": 0,
                  //     "companyId": 0,
                  //     "dowId": 0,
                  //     "dowShort": "string",
                  //     "dow": "string",
                  //     "isHoliday": true,
                  //     "isOpen24Hours": true,
                  //     "companyTimes": [
                  //       {
                  //         "id": 0,
                  //         "companyTimingId": 0,
                  //         "companyId": 0,
                  //         "startHour": 0,
                  //         "startMinute": 0,
                  //         "endHour": 0,
                  //         "endMinute": 0,
                  //       }
                  //     ]
                  //   }
                  // ];
                  // log(timing.toString());
                  // return widget.onBusinessHoursSave!();
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
