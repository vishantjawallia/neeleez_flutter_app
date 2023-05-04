// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls

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
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:stacked/stacked.dart';

import '../../models/amenities/amenities.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
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
  // List<CompanyTimings>? newTimg = [];
  // List<CompanyTimings>? timings;
  FocusNode busMyFocusNode = FocusNode();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController taglineController = TextEditingController();
  TextEditingController companyEstablishmentYearController = TextEditingController();
  TextEditingController whatsAppNoController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController websiteController = TextEditingController();
  TextEditingController additionalInfoController = TextEditingController();
  TextEditingController facebookController = TextEditingController();
  TextEditingController twitterController = TextEditingController();
  TextEditingController instagramController = TextEditingController();
  TextEditingController linkedInController = TextEditingController();
  TextEditingController googleAddressController = TextEditingController();
  TextEditingController additionalAddressController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  DateTime? companyEstablishmentYearDate = DateTime.now();
  // String? busCatSelectedObj;

  // businessSubCategoryList
  List<String>? businessSubCategoryList = [];
  List<String>? businessSubCategorySelectedList = [];

  List<String>? stateList = [];
  List<Provinces>? states = [];
  List<String>? cityList = [];
// Gender
  // Amenities
  List<String>? amentiasSelectedList = [];

  Countries? countrySelected;
  String? stateSelected;
  String? citySelected;
  bool? isFreelancer = false;
  bool? isDepartment = false;
  bool? isDesignation = false;

  String? busCatValue;

  String? serviceForValue;

  List<BusinessTypes> businessSubCategory = [];

  FocusNode? businessCategoryFocus;

  CompanyProfileViewModel({
    this.user,
    this.serviceForList,
    this.amentiasList,
    this.businessCategoryList,
  }) {
    companyNameController.addListener(() => notifyListeners());
    taglineController.addListener(() => notifyListeners());
    // companyEstablishmentYearController.addListener(() => notifyListeners());
    whatsAppNoController.addListener(() => notifyListeners());
    telephoneController.addListener(() => notifyListeners());
    emailController.addListener(() => notifyListeners());
    websiteController.addListener(() => notifyListeners());
    additionalInfoController.addListener(() => notifyListeners());
    facebookController.addListener(() => notifyListeners());
    twitterController.addListener(() => notifyListeners());
    instagramController.addListener(() => notifyListeners());
    linkedInController.addListener(() => notifyListeners());
    googleAddressController.addListener(() => notifyListeners());
    additionalAddressController.addListener(() => notifyListeners());
    fullNameController.addListener(() => notifyListeners());
    mobileNoController.addListener(() => notifyListeners());
    countryCodeController.addListener(() => notifyListeners());
    busMyFocusNode.addListener(() => notifyListeners());
    // loadItems();
    onTabChanged(tabIndex);
  }

  void onFreelancerChange() {
    isFreelancer = !isFreelancer!;
    notifyListeners();
    log(isFreelancer.toString());
  }

  /* ------------------------------ general-info-save ------------------------------ */
  void onGeneralSave() async {
    String email = emailController.text;
    String mobile = mobileNoController.text;
    String nameEn = fullNameController.text;
    String logo = "";
    String nameAr = "";
    String tagLine = taglineController.text;
    String edate = "";
    String whatsapp = websiteController.text;
    String url = websiteController.text;
    String tel1 = "";
    String tel2 = "";
    String aboutUs = additionalInfoController.text;
    String taxNumber = "";
    int businessServiceId = 0;
    int genderId = 0;
    List companyBusinessTypes = [];
    List companyAmenity = [];
    bool isFreeLancer = isFreelancer ?? false;
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
    log("companyBusinessTypes =>$companyBusinessTypes");
    log("companyAmenity =>$companyAmenity");
    log("isFreeLancer =>$isFreeLancer");

    // await putGeneralInformation(
    //   companyId!,
    //   email,
    //   genderId,
    //   mobile,
    //   nameEn,
    //   logo,
    //   isFreeLancer,
    //   businessServiceId,
    //   nameAr,
    //   tagLine,
    //   edate,
    //   whatsapp,
    //   tel1,
    //   url,
    //   tel2,
    //   aboutUs,
    //   taxNumber,
    //   companyBusinessTypes,
    //   companyAmenity,
    // );
  }

  /* ------------------------------ on-social-save ------------------------------ */
  void onSocialSave() async {
    String companyId = "72";
    String facebook = facebookController.text;
    String instagram = instagramController.text;
    String linkedIn = linkedInController.text;
    String twitter = twitterController.text;
    await putUpdateSocialMedia(companyId, facebook, instagram, linkedIn, twitter);
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
      isFreelancer = genInfo!.isFreeLancer ?? false;
      companyNameController.text = genInfo!.companyNumber ?? "";
      taglineController.text = genInfo!.tagLine ?? "";
      companyEstablishmentYearController.text = genInfo!.edate ?? "";
      websiteController.text = genInfo!.url ?? "";
      telephoneController.text = genInfo!.tel1 ?? "";
      emailController.text = genInfo!.email ?? "";
      additionalInfoController.text = genInfo!.aboutUs ?? "";
      // socialMedia
      facebookController.text = genInfo!.socialMediaInfo?.facebook ?? "";
      instagramController.text = genInfo!.socialMediaInfo?.instagram ?? "";
      linkedInController.text = genInfo!.socialMediaInfo?.linkedIn ?? "";
      twitterController.text = genInfo!.socialMediaInfo?.twitter ?? "";
      fullNameController.text = genInfo!.nameEn ?? "";
      mobileNoController.text = genInfo!.mobile ?? "";
      amentiasSelectedList = genInfo!.amenitiesViewModels!.map<String>((e) => e.amenityNameEn!).toList();
    }
    setBusy(false);
    notifyListeners();
  }

  void loadSocialMediaData() {}

  void loadLocationData() async {
    setBusy(true);
    countryList ??= await getCountries() ?? [];
    regionInfo ??= await regionInformation(companyId!);
    if (regionInfo != null) {
      googleAddressController.text = regionInfo?.googleAddress! ?? "";
      additionalAddressController.text = regionInfo?.address ?? "";
    }
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
        spaceFilesData();
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
      companyEstablishmentYearController.text = companyEstablishmentYearDate.toString();
      notifyListeners();
    }
  }

  void amentiasOnChange(List<String>? value) {
    amentiasSelectedList = value;
    notifyListeners();
  }

  void busCatOnChange(String? value) async {
    setBusy(true);
    busCatValue = value;
    BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == value);
    businessSubCategory = await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
    businessSubCategoryList = businessSubCategory.map<String>((e) => e.businessTypeNameEn!).toList();
    setBusy(false);
    notifyListeners();
    busMyFocusNode.requestFocus();
    busMyFocusNode.nextFocus();
  }

  void busSubCatSelectedOnChange(List? value) {
    log(value.toString());
  }

  void serviceForOnChange(String? value) {
    serviceForValue = value;
    notifyListeners();
  }

  void cityOnChange(String? value) {}

  void stateOnChange(String? value) async {}

  void countryOnChange(value) {
    log(value);
  }
}
