import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:neeleez_flutter_app/models/country_detail.dart';
import 'package:stacked/stacked.dart';

import '../../models/company/companies.dart';
import '../company_profile/tab_view/general_info/widgets/select_country_dialog.dart';
import '../verify_otp/verify_otp_view.dart';

class MobileVerificationViewModel extends BaseViewModel {
  final CountryDetail? countryDetail;
  final List<Countries>? countryList;
  late MaskTextInputFormatter? maskFormatter;
  bool loading;
  Countries? country;
  String phoneNumber = "";

  MobileVerificationViewModel(
    this.loading, {
    required this.countryDetail,
    this.countryList,
  }) {
    maskFormatter = MaskTextInputFormatter(
      mask: countryDetail!.mobileMaskFormat,
      filter: {"0": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(loading);
    //Write your models loading codes here
    country = countryList?.firstWhere((e) => e.id == countryDetail!.countryId);
    notifyListeners();
    //Let other views to render again
    Future.delayed(const Duration(seconds: 1), () {
      setBusy(false);
    });
    notifyListeners();
  }

  void sendHandler() {
    Get.off(() => VerifyOtpView(
          phoneNumber: phoneNumber,
        ));
  }

  onCountryCodeTap(BuildContext context, countryList, int? countryId) {
    countrySelectDialog(
      context,
      list: countryList,
      intialValue: countryList?.firstWhere((e) => e.id == countryId),
      onSubmit: (value) {
        Get.back();
        country = value!;
        String mask = value.mobileMaskFormat!.replaceAll('0', 'X');
        // String mask = value.mobileMask!.substring(value.countryCode!.length, value.mobileMask!.length).replaceAll('0', 'X');
        maskFormatter = MaskTextInputFormatter(
          mask: mask,
          type: MaskAutoCompletionType.lazy,
          filter: {"X": RegExp(r'[0-9]')},
        );
        notifyListeners();
      },
    );
  }

  void phoneOnChange(String? value) {
    phoneNumber = country!.countryCode! + value!.replaceAll(RegExp('[^0-9]'), '').toString();
    notifyListeners();
  }
// GET /api/Companies/MobileAvailability/{Mobile}  true/fasle
// GET /api/Companies/CompanyIdByMobile/{Mobile}  ==> id 9699
  // GET /api/Companies/SignIn/{Mobile} 

}

// class NumberFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     var text = newValue.text;

//     if (newValue.selection.baseOffset == 0) {
//       return newValue;
//     }

//     var buffer = StringBuffer();
//     for (int i = 0; i < text.length; i++) {
//       buffer.write(text[i]);
//       var nonZeroIndex = i + 1;
//       print(text.length);
//       if (nonZeroIndex <= 3) {
//         print("non");
//         print(nonZeroIndex);
//         if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
//           buffer.write('-'); // Add double spaces.
//         }
//       } else {
//         if (nonZeroIndex % 12 == 0 && nonZeroIndex != text.length) {
//           buffer.write('-'); // Add double spaces.
//         }
//       }
//     }

//     var string = buffer.toString();
//     return newValue.copyWith(text: string, selection: TextSelection.collapsed(offset: string.length));
//   }
// }

// class PhoneTextFormatter extends TextInputFormatter {
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     if (newValue.text.isNotEmpty) {
//       int num = int.parse(newValue.text.replaceAll(',', ''));
//       final f = NumberFormat("#,###");
//       var selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
//       final newString = newValue.copyWith(text: f.format(num));
//       return TextEditingValue(
//         text: newString.text,
//         selection: TextSelection.collapsed(offset: newValue.text.length - selectionIndexFromTheRight),
//       );
//     } else {
//       return newValue.copyWith(text: '');
//     }
//   }
// }

class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    const currencySymbol = '€';
    if (newValue.text.isEmpty || newValue.text.trim() == currencySymbol) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      var selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
      final f = NumberFormat.currency(locale: 'de', decimalDigits: 0, symbol: '');
      var num = int.parse(newValue.text.replaceAll(RegExp('[^0-9]'), ''));
      final newString = '$currencySymbol ${f.format(num).trim()}';
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

class PhoneTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // const currencySymbol = '€';x
    // if (newValue.text.isEmpty || newValue.text.trim() == currencySymbol) {
    //   return newValue.copyWith(text: '');
    // } else
    if (newValue.text.compareTo(oldValue.text) != 0) {
      var selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
      log(selectionIndexFromTheRight.toString());
      final f = NumberFormat("## ### ## ##");
      // final f = NumberFormat("#,### 00 000 00 00");
      // final f = NumberFormat.currency(locale: 'de', decimalDigits: 0, symbol: '');
      log(f.toString());
      var num = int.parse(newValue.text.replaceAll(RegExp('[^0-13]'), ''));
      log(num.toString());
      final newString = f.format(num).trim();
      log(newString.toString());
      // int num = int.parse(newValue.text.replaceAll('-', ''));
      // final f = NumberFormat("#-###");
      // final newString = newValue.copyWith(text: f.format(num));
      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}

class NumericTextFormatter2 extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      int num = int.parse(newValue.text.replaceAll(',', ''));
      final f = NumberFormat("#,###");
      return newValue.copyWith(text: f.format(num));
    } else {
      return newValue.copyWith(text: '');
    }
  }
}
