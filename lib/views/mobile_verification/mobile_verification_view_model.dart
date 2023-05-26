import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:neeleez_flutter_app/components/dailogs/warning_popup.dart';
import 'package:neeleez_flutter_app/models/country_detail.dart';
import 'package:neeleez_flutter_app/views/mobile_verification/service/mobile_verification_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';
import 'package:stacked/stacked.dart';

import '../../models/company/companies.dart';
import '../company_profile/tab_view/general_info/widgets/select_country_dialog.dart';
import '../verify_otp/verify_otp_view.dart';

class MobileVerificationViewModel extends BaseViewModel with MobileVerificationService {
  final CountryDetail? countryDetail;
  final List<Countries>? countryList;
  late MaskTextInputFormatter? maskFormatter;

  Countries? country;
  String phoneNumberWithCode = "";
  String phoneNumber = "";

  FocusScopeNode phoneFocusScopeNode = FocusScopeNode();

  MobileVerificationViewModel({required this.countryDetail, this.countryList, this.country}) {
    maskFormatter = MaskTextInputFormatter(
      mask: countryDetail!.mobileMaskFormat,
      filter: {"0": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );
    phoneFocusScopeNode.addListener(() => notifyListeners());

    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(false);

    setBusy(false);

    notifyListeners();
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
    phoneNumber = value!.replaceAll(RegExp('[^0-9]'), '').toString();
    phoneNumberWithCode = country!.countryCode! + value.replaceAll(RegExp('[^0-9]'), '').toString();
    notifyListeners();
  }

  void sendHandler(_) async {
    phoneFocusScopeNode.unfocus();
    if (phoneNumber.isEmpty) {
      warningPopup(_, dsc: "Enter Valid Mobile Number !");
      return;
    }
    setBusy(true);
    bool res = await mobileAvailability(phoneNumber);
    setBusy(false);
    if (res) {
      GlobalWidgets.toast("User Already Exists");
      return;
    } else {
      Get.off(() => VerifyOtpView(
            phoneNumber: phoneNumber,
            countryCode: country!.countryCode!,
            country: country,
          ));
    }
  }
}

// GET /api/Companies/MobileAvailability/{Mobile}  true/fasle
// GET /api/Companies/CompanyIdByMobile/{Mobile}  ==> id 9699
  // GET /api/Companies/SignIn/{Mobile}