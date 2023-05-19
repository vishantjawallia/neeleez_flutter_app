// ignore_for_file: non_constant_identifier_names, unused_local_variable, use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';

import '../../../../models/company/timing.dart';
import 'widgets/delete_alert.dart';
// import 'model/put_timing.dart';
// import 'model/put_timing2.dart';
// import '../../widgets/timing_box.dart';

class BusinessHoursProvider extends ChangeNotifier {
  // List<CompanyTimings> realTimings = [];
  List<CompanyTimings> timings = [];

  bool isClosed = false;

  // void clearNewCompanyTimes() {
  //   timings = [];
  //   notifyListeners();
  // }

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
          companyTimingId: 0,
          isNew: true,
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

  void way2RemoveList(
    BuildContext _,
    int iX,
    int iY,
    int iZ,
    CompanyProfileViewModel viewModel,
  ) async {
    CompanyTimings ct = timings[iX];
    List<CompanyDayDetailViewModels> cdL = ct.companyDayDetailViewModels!;
    CompanyDayDetailViewModels cd = ct.companyDayDetailViewModels![iY];
    List<CompanyTimes> cL = cd.companyTimes!;
    CompanyTimes cl = cd.companyTimes![iZ];
    if (!(cL.length <= 1) && cl.isNew!) {
      log(iZ.toString());
      cL.removeAt(iZ);
      cd.companyTimes != cL;
      ct.companyDayDetailViewModels != cdL;
      timings.replaceRange(iX, iX + 1, [ct]);
      notifyListeners();
    }
    if (!cl.isNew!) {
      deleteAlert(
        _,
        text: 'Timer setting will be deleted from the server permanently. Are you sure to delete this?',
        onYesTap: () async {
          Get.back();
          viewModel.setBusy(true);
          bool res = await viewModel.deleteCompanyTimings(cl.id.toString());
          if (res) {
            viewModel.setBusy(false);
            viewModel.businessHoursData(_, reload: true);
          }
        },
      );
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
          // child: Theme(
          //   data: ThemeData.light().copyWith(
          //     colorScheme: const ColorScheme.light(
          //         // change the border color
          //         primary: Palettes.primary,
          //         background: Palettes.primary,
          //         primaryContainer: Palettes.primary
          //         // change the text color
          //         // onSurface: Colors.primaries,
          //         ),
          //     // button colors
          //     // buttonTheme: const ButtonThemeData(
          //     //   colorScheme: ColorScheme.light(
          //     //     primary: Colors.green,
          //     //   ),
          //     // ),
          //   ),
          //   child: child!,
          // ),
        );
        // return MediaQuery(
        //   data: MediaQuery.of(context).copyWith(
        //     alwaysUse24HourFormat: false,
        //   ),
        //   child: child!,
        // );
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
    // if (timings.length != list.length) {
    // await Future.delayed(const Duration(milliseconds: 100));
    timings = list;
    notifyListeners();
    // }
  }

  void onSaveHandler(context, CompanyProfileViewModel viewModel) async {
    List<CompanyDayDetailViewModels> ttt = [];
    for (var element in timings) {
      ttt.add(element.companyDayDetailViewModels!.first);
    }
    for (var x = 0; x < ttt.length; x++) {
      CompanyDayDetailViewModels xx = ttt[x];
      for (var y = 0; y < xx.companyTimes!.length; y++) {
        CompanyTimes yy = xx.companyTimes![y].copyWith(
          id: xx.companyTimes![y].isNew! ? 0 : xx.companyTimes![y].id,
        );
        xx.companyTimes!.replaceRange(y, y + 1, [yy]);
      }
      ttt.replaceRange(x, x + 1, [xx]);
    }
    for (var element in ttt) {
      Map jj = element.toJson();
      log('{');
      jj.forEach((key, value) {
        log('"$key" : "$value"');
      });
      log('}');
      // Helper.mapLoop(jsonEncode(element));
// log(message)

      // log(element.toString ));
      // log(jsonEncode(element));
    }
    viewModel.setBusy(true);
    bool res = await viewModel.postCompanyTimings(ttt.first.companyId!.toString(), ttt);
    if (res) {
      viewModel.setBusy(false);
      viewModel.businessHoursData(context, reload: true);
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

// {
//  "id" : 10374,
//  "companyId" : 76,
//  "dowId" : 1,
//  "dowShort" : "MON",
//  "dow" : "Monday",
//  "isHoliday" : false,
//  "isOpen24Hours" : true,
//  "companyTimes" : [
//    {
//       id: 11512,
//       isNew: false,
//       companyTimingId: 10374,
//       companyId: 0,
//       startHour: 9,
//       startMinute: 0,
//       endHour: 18,
//       endMinute: 00
//    },
//    {
//       id: 0,
//       isNew: true,
//       companyTimingId: 0,
//       companyId: 0,
//       startHour: 8,
//       startMinute: 0,
//       endHour: 16,
//       endMinute: 0,
//    }
//   ]
// }
