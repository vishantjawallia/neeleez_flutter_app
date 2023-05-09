// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls, unrelated_type_equality_checks

import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/models/company/provinces.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';
import 'package:neeleez_flutter_app/models/company/timing.dart';
import 'package:neeleez_flutter_app/models/package/package_info.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/verify_email_or_mobile.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';
import 'package:stacked/stacked.dart';

import '../../models/amenities/amenities.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../models/company/cities.dart';
import '../../models/company/companies.dart';
import '../../models/company/company_profile.dart' as cm;
import '../../models/gender/gender.dart';
import '../../models/general_info/general_info.dart';

class CompanyProfileViewModel extends BaseViewModel with CompanyProfileService {
  final UserData? user;
  final List<BusinessServicesByCountry>? businessCategoryList;
  final List<Gender>? serviceForList;
  final List<Amenities>? amentiasList;
  int tabIndex = 0;
  String? companyId = SharedPreferenceHelper.getString(Preferences.companyId);
  String? countryId = SharedPreferenceHelper.getString(Preferences.countryId);
  GeneralInformation? genInfo;
  cm.CompanyProfile? cp;
  RegionInformation? regionInfo;
  PackageInformation? pInfo;

  List<Countries>? countries;
  List<CompanyTimings>? timings;
  List<Countries>? countryList;
  DateTime? companyEstablishmentYearDate = DateTime.now();
  // String? busCatSelectedObj;

  // businessSubCategoryList
  // List<BusinessTypes>? businessSubCategoryList = [];

  // List<String>? stateList = [];
  // List<Provinces>? states = [];
  // List<String>? cityList = [];
  // Gender

  Countries? countrySelected;
  String? stateSelected;
  String? citySelected;
  bool? isFreelancer = false;
  bool? isDepartment = false;
  bool? isDesignation = false;

  BusinessServicesByCountry? busCatValue;

  List<BusinessTypes>? businessSubCategoryList;

  FocusNode? businessCategoryFocus;

  //general info
  String? serviceForId;
  String? serviceForValue;
  String? businessCategoryValue;
  String? businessCategoryId;
  //
  List<String> businessSubCategorySelectedList = [];
  List<int> businessSubCategorySelectedListID = [];
  List<String> serviceList = [];
  //
  List<String> amentiasStringList = [];
  List<String> amentiasSelectedList = [];
  List<int> amentiasSelectedListID = [];

  FocusNode businessCategoryFocusNode = FocusNode();
  FocusNode businessSubCategoryFocusNode = FocusNode();
  FocusNode servicesForFocusNode = FocusNode();
  FocusNode amenitiesFocusNode = FocusNode();

  List<Cities>? citiesList;
  List<Provinces> provinceList = [];
  // Countries? countryObj;
  // Provinces? provinceObj;
  // Cities? cityObj;

  CompanyProfileViewModel({
    this.user,
    this.serviceForList,
    this.amentiasList,
    this.businessCategoryList,
  }) {
    businessCategoryFocusNode.addListener(() => notifyListeners());
    businessSubCategoryFocusNode.addListener(() => notifyListeners());
    amenitiesFocusNode.addListener(() => notifyListeners());
    servicesForFocusNode.addListener(() => notifyListeners());
    onTabChanged(tabIndex);
  }

  void onFreelancerChange() {
    isFreelancer = !isFreelancer!;
    notifyListeners();
    log(isFreelancer.toString());
  }

  /* ------------------------------ general-info-save ------------------------------ */
  void onGeneralSave({
    String? email,
    int? genderId,
    String? mobile = "string",
    String? nameEn,
    String? logo = "string",
    bool? isFreeLancer,
    int? businessServiceId,
    String? nameAr = "string",
    String? tagLine = "string",
    String? edate,
    String? whatsapp = "string",
    String? tel1 = "string",
    String? url = "string",
    String? tel2 = "string",
    String? aboutUs = "string",
    String? taxNumber = "string",
    // List? companyBusinessTypes,
    // List? companyAmenity,
  }) async {
    setBusy(true);
    // List<int> companyBusinessTypes = [];

    // List<int> companyAmenity = [];
    List<Map<String, dynamic>> businessSubCategoryIds = [];
    List<Map<String, dynamic>> amentiasIds = [];
    for (int element in businessSubCategorySelectedListID) {
      businessSubCategoryIds.add({
        "btypeId": element,
      });
    }
    for (int element in amentiasSelectedListID) {
      amentiasIds.add({
        "amenityId": element,
      });
    }
    log("email =>$email");
    log("mobile =>$mobile");
    log("nameEn =>$nameEn");
    log("logo =>$logo");
    log("nameAr =>$nameAr");
    log("tagLine =>$tagLine");
    log("edate =>$edate");
    log("whatsapp =>$whatsapp");
    log("url =>$url");
    log("tel1 =>$tel1");
    log("tel2 =>$tel2");
    log("aboutUs =>$aboutUs");
    log("taxNumber =>$taxNumber");
    log("businessServiceId =>$businessServiceId");
    log("genderId =>$genderId");
    log("companyBusinessTypes =>$businessSubCategoryIds");
    log("companyAmenity =>$amentiasIds");
    log("isFreeLancer =>$isFreeLancer");

    await putGeneralInformation(
      companyId,
      email,
      genderId,
      mobile,
      nameEn,
      logo,
      isFreeLancer,
      businessServiceId,
      nameAr,
      tagLine,
      genInfo!.edate!,
      whatsapp,
      tel1,
      url,
      tel2,
      aboutUs,
      taxNumber,
      businessSubCategoryIds,
      amentiasIds,
    );
    genInfo ??= await generalInformationWithCompanyId(companyId!);
    if (genInfo != null) {
      serviceForId = genInfo!.genderId.toString();
      serviceForValue = serviceForList!.firstWhere((e) => e.genderId == (genInfo?.genderId ?? 0)).genderEn;
      serviceList = serviceForList!.map((e) => e.genderEn!).toList();
      //
      businessSubCategorySelectedList = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.businessTypeNameEn!).toList() : [];
      businessSubCategorySelectedListID = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.id!).toList() : [];
      if (genInfo!.businessTypesViewModel!.isNotEmpty) {
        String name = genInfo!.businessTypesViewModel!.first.businessService ?? "";
        BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == name);
        // if (obj.businessServiceId != null) {
        businessSubCategoryList ??= await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
        businessCategoryId = obj.businessServiceId.toString();
        businessCategoryValue = obj.service!;
        // }
      }
      //
      amentiasStringList = amentiasList!.map((e) => e.amenityNameEn!).toList();
      amentiasSelectedList = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.amenityNameEn!).toList() : [];
      amentiasSelectedListID = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.id!).toList() : [];
    }
    setBusy(false);
    notifyListeners();
  }

  /* ------------------------------ on-social-save ------------------------------ */
  void onSocialSave() async {
    // String companyId = "72";
    // String facebook = facebookController.text;
    // String instagram = instagramController.text;
    // String linkedIn = linkedInController.text;
    // String twitter = twitterController.text;
    // await putUpdateSocialMedia(companyId, facebook, instagram, linkedIn, twitter);
  }

  /* ------------------------------ on-contact-save------------------------------ */
  void onContactSave() {
    // putUpdateContactPerson(
    //   companyId,
    //   id,
    //   nameEn,
    //   nameAr,
    //   email,
    //   mobile,
    //   whatsApp,
    //   tel,
    //   designation,
    //   department,
    //   designationId,
    //   departmentId,
    // );
  }

  /* ------------------------------ on-contact-save------------------------------ */
  void onBusinessHoursSave(body) async {
    final List<CompanyDayDetailViewModels>? cd = await postCompanyTimings("$companyId", body);
    if (cd != null) {
      log("message");
    } else {
      log("null");
    }
  }

  /* ------------------------------ on-file-media-save------------------------------ */
  void onUploadMedia(File? file) {}

  void loadGeneralData() async {
    setBusy(true);
    genInfo ??= await generalInformationWithCompanyId(companyId!);
    if (genInfo != null) {
      serviceForId = genInfo!.genderId.toString();
      serviceForValue = serviceForList!.firstWhere((e) => e.genderId == (genInfo?.genderId ?? 0)).genderEn;
      serviceList = serviceForList!.map((e) => e.genderEn!).toList();
      //
      businessSubCategorySelectedList = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.businessTypeNameEn!).toList() : [];
      businessSubCategorySelectedListID = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.id!).toList() : [];
      if (genInfo!.businessTypesViewModel!.isNotEmpty) {
        String name = genInfo!.businessTypesViewModel!.first.businessService ?? "";
        BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == name);
        // if (obj.businessServiceId != null) {
        businessSubCategoryList ??= await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
        businessCategoryId = obj.businessServiceId.toString();
        businessCategoryValue = obj.service!;
        // }
      }
      //
      amentiasStringList = amentiasList!.map((e) => e.amenityNameEn!).toList();
      amentiasSelectedList = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.amenityNameEn!).toList() : [];
      amentiasSelectedListID = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.id!).toList() : [];
    }
    setBusy(false);
    notifyListeners();
  }

  void loadSocialMediaData() {}

  void loadLocationData() async {
    setBusy(true);
    countryList ??= await getCountries() ?? [];
    regionInfo ??= await regionInformation(companyId!);
    setBusy(false);
    notifyListeners();
  }

  void contactPersonInfoData() {}

  void businessHoursData() async {
    setBusy(true);
    timings ??= await getCompanyTimings(companyId!);
    setBusy(false);
    notifyListeners();
  }

  void packagesData() async {
    setBusy(true);
    cp ??= await getRegionInformation(companyId!);
    setBusy(false);
    notifyListeners();
  }

  void spaceFilesData() {}

  void onTabChanged(int value) {
    switch (value) {
      case 0:
        loadGeneralData();
        break;
      case 1:
        loadSocialMediaData();
        break;
      case 2:
        loadLocationData();
        break;
      case 3:
        contactPersonInfoData();
        break;
      case 4:
        businessHoursData();
        break;
      case 5:
        packagesData();
        break;
      case 6:
        packagesData();
        // spaceFilesData();
        break;
      default:
    }
    tabIndex = value;
    notifyListeners();
  }

  void copEstabYearOnTap(_) async {
    final DateTime? picked = await showDatePicker(
      context: _,
      initialDate: companyEstablishmentYearDate!,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != companyEstablishmentYearDate) {
      companyEstablishmentYearDate = picked;
      // companyEstablishmentYearController.text = companyEstablishmentYearDate.toString();
      notifyListeners();
    }
  }

  void businessCategoryOnChanged(String? value) async {
    setBusy(true);
    businessCategoryValue = value;
    notifyListeners();
    BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == value);
    businessCategoryId = obj.businessServiceId.toString();
    businessSubCategoryList = await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
    businessSubCategorySelectedList = [];
    setBusy(false);
    businessSubCategoryFocusNode.requestFocus();
    notifyListeners();
  }

  void businessSubCategoryChanged(String? value) {
    if (businessSubCategoryList == null) {
      GlobalWidgets.toast('Select business category first.');
      return;
    }
    BusinessTypes obj = businessSubCategoryList!.firstWhere((e) => e.businessTypeNameEn == value);
    if (!businessSubCategorySelectedList.contains(obj.businessTypeNameEn)) {
      businessSubCategorySelectedList.add(obj.businessTypeNameEn!);
      businessSubCategorySelectedListID.add(obj.businessTypeId!);
      notifyListeners();
    }
  }

  void businessSubCategoryRemove(String? value) {
    BusinessTypes obj = businessSubCategoryList!.firstWhere((e) => e.businessTypeNameEn == value);

    if (businessSubCategorySelectedList.contains(obj.businessTypeNameEn)) {
      businessSubCategorySelectedList.remove(obj.businessTypeNameEn!);
      businessSubCategorySelectedListID.remove(obj.businessTypeId!);
      notifyListeners();
    }
  }

  void amenitiesOnChanged(String? value) {
    Amenities obj = amentiasList!.firstWhere((e) => e.amenityNameEn == value);
    if (!amentiasSelectedList.contains(obj.amenityNameEn)) {
      amentiasSelectedList.add(obj.amenityNameEn!);
      amentiasSelectedListID.add(obj.id!);
      notifyListeners();
    }
  }

  void amenitiesOnRemove(String? value) {
    Amenities obj = amentiasList!.firstWhere((e) => e.amenityNameEn == value);
    if (amentiasSelectedList.contains(obj.amenityNameEn)) {
      amentiasSelectedList.remove(obj.amenityNameEn!);
      amentiasSelectedListID.remove(obj.id);
      notifyListeners();
    }
  }

  void servicesForOnChanged(String? value) {
    serviceForId = serviceForList!.firstWhere((e) => e.genderEn == value).genderId.toString();
    serviceForValue = value;
    notifyListeners();
  }

  void verifyMobileHandler(_, value) {
    verifyEmailOrMobile(_);
  }

  void verifyEmailHandler(_, value) {
    verifyEmailOrMobile(_);
  }
}
