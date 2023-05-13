// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';

import '../../../../models/company/timing.dart';
import 'model/put_timing.dart';
// import '../../widgets/timing_box.dart';

class BusinessHoursProvider extends ChangeNotifier {
  List<CompanyTimings> realTimings = [];
  List<CompanyTimings> timings = [];

  bool isClosed = false;

  void clearNewCompanyTimes() {
    timings = [];
    notifyListeners();
  }

  // setTimings(List<CompanyTimings> value) async {
  //   if (timings.length != value.length) {
  //     await Future.delayed(const Duration(milliseconds: 100));
  //     timings = value;
  //     notifyListeners();
  //   }
  // }

  void way2AddList(int i, int j, int k, CompanyTimes obj) async {
    CompanyTimings ct = timings[i];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = cdL[j];
    List<CompanyTimes> cL = cd.companyTimes!;
    var id = DateTime.now().millisecondsSinceEpoch;
    if (!(cL.length >= 3)) {
      cL.add(
        obj.copyWith(
          id: id,
          endHour: 0,
          endMinute: 0,
          startMinute: 0,
          startHour: 0,
        ),
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

  void onStartTimingTap(_, CompanyTimes companyTimes, List<CompanyTimes> companyTimesList, int i, int j, int k) async {
    final TimeOfDay? picked = await showTimePicker(
      context: _,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            alwaysUse24HourFormat: false,
          ),
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
      // final companyTimesLastObj = companyTimesList.last;
      // if (companyTimesList.length > 1) {
      //   if (companyTimesLastObj.endHour! > h) {
      //     warningPopup(_, btn: "Ok", head: "Warning");
      //     return;
      //   }
      // }
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

  onEndTimingTap(_, CompanyTimes companyTimes, List<CompanyTimes> companyTimesList, i, j, k) async {
    final TimeOfDay? picked = await showTimePicker(
      context: _,
      initialTime: const TimeOfDay(hour: 0, minute: 0),
      initialEntryMode: TimePickerEntryMode.dial,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
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
      // final companyTimesLastObj = companyTimesList.last;
      // if (companyTimesList.length > 1) {
      //   if (companyTimesLastObj.endHour! > h) {
      //     warningPopup(_, btn: "Ok", head: "Warning");
      //     return;
      //   }
      // }
      if (!compare) {
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

  void loadItems(List<CompanyTimings> list) async {
    if (timings.length != list.length) {
      await Future.delayed(const Duration(milliseconds: 100));
      timings = list;
      notifyListeners();
    }
  }

  void onSaveHandler(CompanyProfileViewModel viewModel) async {
    List<PutTiming> timing2 = [];

    for (var x = 0; x < timings.length; x++) {
      CompanyTimings xx = timings[x];
      for (var y = 0; y < xx.companyDayDetailViewModels!.length; y++) {
        CompanyDayDetailViewModels yy = xx.companyDayDetailViewModels![y];
        for (var z = 0; z < yy.companyTimes!.length; z++) {
          CompanyTimes zz = yy.companyTimes![z];
          PutTiming obj = PutTiming(
            dowId: yy.dowId,
            id: zz.id,
            isHoliday: yy.isHoliday,
            startTime: intToTiming(zz.startHour!, zz.startMinute!),
            endTime: intToTiming(zz.endHour!, zz.endHour!),
          );
          timing2.add(obj);
        }
      }
    }

    for (var element in timing2) {
      log(element.toJson().toString());
    }
    // log(timing2.toString());

    // Map<String, dynamic> obj = {
    //   "id": 0,
    //   "dowId": 0,
    //   "startTime": "string",
    //   "endTime": "string",
    //   "isHoliday": true,
    // };

    viewModel.setBusy(true);
    await Future.delayed(const Duration(seconds: 2));
    await viewModel.postCompanyTimings(viewModel.companyId!, []);
    viewModel.setBusy(false);
    // await Future.delayed(const Duration(seconds: 3));
    // viewModel.setBusy(false);
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

String intToTiming(int hour, int min) {
  // DateTime dateTime = DateTime.now(); // Replace this with your desired DateTime
  DateTime dateTime = DateTime(0, 1, 1, hour, min, 0, 0, 0);

  // Create a DateFormat object for the desired time format
  DateFormat timeFormat = DateFormat("HH:mm:ss.S");

  // Format the DateTime object using the timeFormat
  String formattedTime = timeFormat.format(dateTime);
  log(formattedTime);
  return formattedTime;
}
