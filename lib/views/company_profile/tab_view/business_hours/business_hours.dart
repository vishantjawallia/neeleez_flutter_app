import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/business_hours_provider.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../../models/company/timing.dart';
import '../../company_profile_view_model.dart';
import 'widgets/timing_box.dart';
// import 'widgets/timing_box.dart';
// import '../../widgets/timing_box.dart';

class BusinessHours extends StatelessWidget {
  final CompanyProfileViewModel viewModel;
  const BusinessHours(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final buss = Provider.of<BusinessHoursProvider>(context);
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
                  Container(
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
                const SizedBox(height: 15),
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
                                                          buss.onStartTimingTap(context, companyTimes, companyDayDetailViewModels.companyTimes!, ii!, jj!, kk!);
                                                        },
                                                        onEndTimingTap: (ii, jj, kk) async {
                                                          log(ii.toString());
                                                          log(jj.toString());
                                                          log(kk.toString());
                                                          buss.onEndTimingTap(context, companyTimes, companyDayDetailViewModels.companyTimes!, ii!, jj!, kk!);
                                                        },
                                                        icon: companyDayDetailViewModels.companyTimes!.first.id == companyTimes.id,
                                                        startTiming: TimeOfDay(hour: companyTimes.startHour ?? 0, minute: companyTimes.startMinute ?? 0),
                                                        endTiming: TimeOfDay(hour: companyTimes.endHour ?? 0, minute: companyTimes.endMinute ?? 0),
                                                        isHoliday: companyDayDetailViewModels.isHoliday!,
                                                        onAddTap: (ii, jj, kk) async {
                                                          buss.way2AddList(ii!, jj!, kk!, companyTimes);
                                                        },
                                                        onCloseTap: (ii, jj, kk) async {
                                                          buss.way2RemoveList(context, ii!, jj!, kk!, viewModel);
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
                onTap: () => buss.onSaveHandler(context, viewModel),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
