// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../models/company/timing.dart';
// import '../../widgets/timing_box.dart';

class BusinessHoursProvider extends ChangeNotifier {
  List<CompanyTimings> realTimings = [];
  List<CompanyTimings> timings = [];

  bool isClosed = false;

  void clearNewCompanyTimes() {
    timings = [];
    notifyListeners();
  }

  setTimings(List<CompanyTimings> value) async {
    if (timings.length != value.length) {
      Future.delayed(const Duration(milliseconds: 100), () {
        timings = value;
        notifyListeners();
      });
    }
  }

  void way2AddList(int i, int j, int k, CompanyTimes obj) async {
    CompanyTimings ct = timings[i];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = cdL[j];
    List<CompanyTimes> cL = cd.companyTimes!;
    var id = DateTime.now().millisecondsSinceEpoch;
    if (!(cL.length >= 3)) {
      cL.add(
        obj.copyWith(id: id),
      );
      cd.companyTimes != cL;
      cdL.replaceRange(j, j + 1, [cd]);
      ct.companyDayDetailViewModels != cdL;
      timings.replaceRange(i, i + 1, [ct]);
      notifyListeners();
    }
  }

  void way2RemoveList(int iX, int iY, int iZ) {
    CompanyTimings ct = timings[iX];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![iY];
    List<CompanyTimes> cL = cd.companyTimes!;
    if (!(cL.length <= 1)) {
      log(iZ.toString());
      cL.removeAt(iZ);
      cd.companyTimes != cL;
      ct.companyDayDetailViewModels != cdL;
      timings.replaceRange(iX, iX + 1, [ct]);
      notifyListeners();
    }
  }

  void onStartTimingTap(_, CompanyTimes companyTimes, int i, int j, int k) async {
    final TimeOfDay? picked = await showTimePicker(
      context: _,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      TimeOfDay t = picked;
      TimeOfDay t2 = TimeOfDay(hour: companyTimes.endHour!, minute: companyTimes.endMinute!);
      bool compare = compareTime(t, t2);
      int h = picked.hour;
      int m = picked.minute;
      CompanyTimes cc = companyTimes;
      if (compare) {
        cc = companyTimes.copyWith(
          startHour: h,
          startMinute: m,
        );
      } else {
        cc = companyTimes.copyWith(
          startHour: h,
          startMinute: m,
          endHour: h,
          endMinute: m,
        );
      }
      List<CompanyTimings> ctL = timings;
      CompanyTimings ct = ctL[i];
      List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
      CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![j];
      List<CompanyTimes> cL = ct.companyDayDetailViewModels![j].companyTimes!;
      cL.replaceRange(k, k + 1, [cc]);
      cd.companyTimes != cL;
      cdL.replaceRange(j, j + 1, [cd]);
      ct.companyDayDetailViewModels != cdL;
      ctL.replaceRange(i, i + 1, [ct]);
      timings = ctL;
      notifyListeners();
    }
  }

  onEndTimingTap(_, CompanyTimes companyTimes, i, j, k) async {
    final TimeOfDay? picked = await showTimePicker(
      context: _,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null) {
      TimeOfDay t = picked;
      TimeOfDay t2 = TimeOfDay(hour: companyTimes.endHour!, minute: companyTimes.endMinute!);
      bool compare = compareTime(t, t2);
      int h = picked.hour;
      int m = picked.minute;
      CompanyTimes cc = companyTimes;
      if (compare) {
        cc = companyTimes.copyWith(
          endHour: h,
          endMinute: m,
        );
      } else {
        cc = companyTimes.copyWith(
          startHour: h,
          startMinute: m,
          endHour: h,
          endMinute: m,
        );
      }
      List<CompanyTimings> ctL = timings;
      CompanyTimings ct = ctL[i];
      List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
      CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![j];
      List<CompanyTimes> cL = ct.companyDayDetailViewModels![j].companyTimes!;
      cL.replaceRange(k, k + 1, [cc]);
      cd.companyTimes != cL;
      cdL.replaceRange(j, j + 1, [cd]);
      ct.companyDayDetailViewModels != cdL;
      ctL.replaceRange(i, i + 1, [ct]);
      timings = ctL;
      notifyListeners();
    }
  }

  void onSwitchChange(bool? value, int i, int j) {
    CompanyTimings ct = timings[i];
    CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![j];
    CompanyDayDetailViewModels cddv = cd.copyWith(
      isHoliday: !cd.isHoliday!,
    );
    ct.companyDayDetailViewModels!.replaceRange(j, j + 1, [cddv]);
    timings.replaceRange(i, i + 1, [ct]);
    notifyListeners();
  }

  void addSingleEntryInAll(int i, CompanyTimings companyTimes) {
    List<CompanyTimings> ctL = [];
    CompanyTimings ct = timings[i];
    List<CompanyDayDetailViewModels> cdL = timings[i].companyDayDetailViewModels!;
    if (cdL.isEmpty) {
      CompanyDayDetailViewModels ccc = CompanyDayDetailViewModels(
        dow: companyTimes.dow,
        dowId: companyTimes.id,
        dowShort: companyTimes.dowShort,
        isOpen24Hours: companyTimes.defaultIsOpen24Hours,
        isHoliday: companyTimes.defaultIsHoliday,
        companyTimes: [
          const CompanyTimes(
            endHour: 20,
            endMinute: 0,
            startMinute: 0,
            startHour: 9,
          ),
        ],
      );
      cdL.add(ccc);
      notifyListeners();
    }
  }
}

bool compareTime(TimeOfDay startTime, TimeOfDay endTime) {
  bool result = false;
  int startTimeInt = (startTime.hour * 60 + startTime.minute) * 60;
  int endTimeInt = (endTime.hour * 60 + endTime.minute) * 60;
  int dif = endTimeInt - startTimeInt;

  if (endTimeInt > startTimeInt) {
    result = true;
  } else {
    result = false;
  }
  return result;
}
