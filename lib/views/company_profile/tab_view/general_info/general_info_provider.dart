import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/models/company/company_profile.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';

import 'widgets/select_country_dialog.dart';

class GeneralInfoProvider extends ChangeNotifier {
  GeneralInformation? data;
  ScrollController scrollController = ScrollController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyName2 = TextEditingController();
  TextEditingController tagline = TextEditingController();
  TextEditingController companyEsb = TextEditingController();
  TextEditingController additionalInfo = TextEditingController();
  TextEditingController whatsAppNo = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  DateTime? copEstabYear;
  bool? isFreelancer = false;
  String? code = "";
  int? codeId;

  List<String> businessSubCategorySelectedList = [];

  GeneralInfoProvider() {
    // scrollController.addListener(() => notifyListeners());
    companyName.addListener(() => notifyListeners());
    companyName2.addListener(() => notifyListeners());
    tagline.addListener(() => notifyListeners());
    companyEsb.addListener(() => notifyListeners());
    additionalInfo.addListener(() => notifyListeners());
    whatsAppNo.addListener(() => notifyListeners());
    telephone.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    website.addListener(() => notifyListeners());
  }

  void load() async {}

  void setFreelancer() {
    isFreelancer = !isFreelancer!;
    notifyListeners();
  }

  void copEstabYearOnTap(_) async {
    final DateTime? picked = await showDatePicker(
      context: _,
      initialDate: copEstabYear ?? DateTime.now(),
      firstDate: DateTime(1960, 8),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != copEstabYear) {
      copEstabYear = picked;
      String formattedDate = DateFormat('dd/MM/yyyy').format(picked);
      companyEsb.text = formattedDate;
      notifyListeners();
    }
  }

  void loadItem(GeneralInformation? generalInformation, CompanyProfile? cp, List<Countries>? countryList) async {
    await Future.delayed(const Duration(milliseconds: 100));
    log(generalInformation.toString());
    if (generalInformation != null) {
      data = generalInformation;
      isFreelancer = generalInformation.isFreeLancer ?? false;
      companyName.text = generalInformation.nameEn ?? "";
      companyName2.text = generalInformation.nameAr ?? "";
      tagline.text = generalInformation.tagLine ?? "";
      companyEsb.text = generalInformation.edate ?? "";
      DateFormat dateFormat = DateFormat("dd/MM/yyyy");
      copEstabYear = dateFormat.parse(companyEsb.text);
      website.text = generalInformation.url ?? "";
      telephone.text = generalInformation.tel1 ?? "";
      email.text = generalInformation.email ?? "";
      whatsAppNo.text = generalInformation.whatsapp ?? "";
      additionalInfo.text = generalInformation.aboutUs ?? "";
      code = countryList?.firstWhere((e) => e.id == cp!.companyAddress?.countryId).countryCode.toString();
      codeId = countryList?.firstWhere((e) => e.id == cp!.companyAddress?.countryId).id;
      notifyListeners();
    }
  }

  clearAll() {
    data = null;
    scrollController = ScrollController();
    companyName.text = "";
    companyName2.text = "";
    tagline.text = "";
    companyEsb.text = "";
    additionalInfo.text = "";
    whatsAppNo.text = "";
    telephone.text = "";
    email.text = "";
    website.text = "";
    copEstabYear = null;
    isFreelancer = false;
    businessSubCategorySelectedList = [];
    notifyListeners();
  }

  onCountryCodeTap(context, List<Countries>? countryList) {
    countrySelectDialog(
      context,
      list: countryList,
      intialValue: countryList?.firstWhere((e) => e.id == codeId),
      onSubmit: (value) {
        Get.back();
        code = value!.countryCode;
        notifyListeners();
      },
    );
  }
}
