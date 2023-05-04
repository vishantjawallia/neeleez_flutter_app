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

  void way2AddList(int companyTimingsIndex, int companyDayDetailViewModelsIndex, int companyTimesIndex, CompanyTimes obj) async {
    List<CompanyTimings> ctL = [];
    CompanyTimings ct = timings[companyTimingsIndex];
    List<CompanyDayDetailViewModels> cdL = timings[companyTimingsIndex].companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = timings[companyTimingsIndex].companyDayDetailViewModels![companyDayDetailViewModelsIndex];
    List<CompanyTimes> cL = timings[companyTimingsIndex].companyDayDetailViewModels![companyDayDetailViewModelsIndex].companyTimes!;
    CompanyTimes cc = timings[companyTimingsIndex].companyDayDetailViewModels![companyDayDetailViewModelsIndex].companyTimes![companyTimesIndex];
    if (!(cL.length >= 3)) {
      cL.add(
        obj.copyWith(id: 0),
      );
      cd.companyTimes != cL;
      ct.companyDayDetailViewModels != cdL;

      timings.replaceRange(companyTimingsIndex, companyTimingsIndex + 1, [ct]);
      notifyListeners();
    }
  }

  void addStartingTime(int companyTimingsIndex, int companyDayDetailViewModelsIndex, int companyTimesIndex, CompanyTimes obj) async {
    List<CompanyTimings> ctL = [];
    CompanyTimings ct = timings[companyTimingsIndex];
    List<CompanyDayDetailViewModels> cdL = timings[companyTimingsIndex].companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = timings[companyTimingsIndex].companyDayDetailViewModels![companyDayDetailViewModelsIndex];
    List<CompanyTimes> cL = timings[companyTimingsIndex].companyDayDetailViewModels![companyDayDetailViewModelsIndex].companyTimes!;
    CompanyTimes cc = obj;
    if (!(cL.length >= 3)) {
      cL.replaceRange(companyTimesIndex, companyTimesIndex + 1, [obj]);
      // cd.companyTimes != cL;
      // ct.companyDayDetailViewModels!.replaceRange(companyDayDetailViewModelsIndex, companyDayDetailViewModelsIndex + 1, [cd]);
      ct.companyDayDetailViewModels != cdL;

      timings.replaceRange(companyTimingsIndex, companyTimingsIndex + 1, [ct]);
      notifyListeners();
    }
  }

  void way2RemoveList(int iX, int iY, int iZ) {
    List<CompanyTimings> ctL = [];
    CompanyTimings ct = timings[iX];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![iY];
    List<CompanyTimes> cL = cd.companyTimes!;
    CompanyTimes cc = cd.companyTimes![iZ];
    if (!(cL.length <= 1)) {
      log(iZ.toString());
      cL.removeAt(iZ);
      cd.companyTimes != cL;
      ct.companyDayDetailViewModels != cdL;
      timings.replaceRange(iX, iX + 1, [ct]);
      notifyListeners();
    }
  }

  void onStartTimingTap(_, CompanyTimes companyTimes, i, j, k) async {
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
      CompanyTimes ct = companyTimes.copyWith(
        startHour: picked.hour,
        startMinute: picked.minute,
      );
      addStartingTime(i, j, k, ct);
      // log(picked.toString());
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
      CompanyTimes ct = companyTimes.copyWith(
        endHour: picked.hour,
        endMinute: picked.minute,
      );
      addStartingTime(i, j, k, ct);
      // log(picked.toString());
    }
  }

  void onSwitchChange(bool? value, int i, int j) {
    List<CompanyTimings> ctL = [];
    CompanyTimings ct = timings[i];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![j];
    // List<CompanyTimes> cL = cd.companyTimes!;
    // if (cd.isHoliday!) {
    CompanyDayDetailViewModels cddv = cd.copyWith(
      isHoliday: !cd.isHoliday!,
    );
    // cd.companyTimes != cL;
    ct.companyDayDetailViewModels!.replaceRange(j, j + 1, [cddv]);
    timings.replaceRange(i, i + 1, [ct]);
    notifyListeners();
    // }
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
            //  companyId: ,
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
