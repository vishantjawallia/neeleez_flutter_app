// ignore_for_file: use_build_context_synchronously, unused_local_variable

import 'dart:core';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/pref_constant.dart';
import 'package:neeleez_flutter_app/config/preference.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';
import 'package:neeleez_flutter_app/models/company/timing.dart';
import 'package:neeleez_flutter_app/models/department/department.dart';
import 'package:neeleez_flutter_app/models/designation/designation.dart';
import 'package:neeleez_flutter_app/models/package/package_info.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/components/verify_email_or_mobile.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/business_hours_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/file_section/file_section_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/general_info_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/loaction/loaction_provider.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/social_media/social_media_provider.dart';
import 'package:neeleez_flutter_app/views/designation/service/designation_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../models/amenities/amenities.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../models/company/companies.dart';
import '../../models/company/company_profile.dart' as cm;
import '../../models/gender/gender.dart';
import '../../models/general_info/general_info.dart';
import '../department/service/department_service.dart';
import 'tab_view/file_section/widgets/warning_popup.dart';

class CompanyProfileViewModel extends BaseViewModel with CompanyProfileService, DepartmentService, DesignationService {
  final UserData? user;
  final List<BusinessServicesByCountry>? businessCategoryList;
  final List<Gender>? serviceForList;
  final List<Amenities>? amentiasList;
  int tabIndex = 0;

  String? companyId = SharedPreferenceHelper.getString(Preferences.companyId);
  String? countryId = SharedPreferenceHelper.getString(Preferences.countryId);

  // models
  GeneralInformation? genInfo;
  cm.CompanyProfile? cp;
  RegionInformation? regionInfo;
  PackageInformation? pInfo;
  List<CompanyTimings>? timings;

  bool? isFreelancer = false;

  List<BusinessTypes>? businessSubCategoryList;
  List<Countries>? countryList;

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

  ScrollController businessSubCategoryScrollController = ScrollController();
  ScrollController amenitiesScrollController = ScrollController();

  //
  List<Department>? departmentList;
  List<Designation>? designationList;

  CompanyProfileViewModel({
    this.user,
    this.serviceForList,
    this.amentiasList,
    this.businessCategoryList,
  }) {
    businessCategoryFocusNode.addListener(() => notifyListeners());
    servicesForFocusNode.addListener(() => notifyListeners());
    businessSubCategoryScrollController.addListener(() => notifyListeners());
    amenitiesScrollController.addListener(() => notifyListeners());
    // focus
    businessCategoryFocusNode.addListener(() => notifyListeners());
    businessSubCategoryFocusNode.addListener(() => notifyListeners());
    servicesForFocusNode.addListener(() => notifyListeners());
    amenitiesFocusNode.addListener(() => notifyListeners());
  }

  /* ------------------------------ onTabChanged------------------------------ */
  void onTabChanged(BuildContext _, int value) async {
    tabIndex = value;
    notifyListeners();
    switch (value) {
      case 0:
        loadGeneralData(_);
        break;
      case 2:
        loadLocationData(_);
        break;
      case 3:
        packagesData(_);
        break;
      case 4:
        businessHoursData(_);
        break;
      case 5:
        packagesData(_);
        break;
      case 6:
        packagesData(_);
        break;
      default:
    }
  }

  void onFreelancerChange() {
    isFreelancer = !isFreelancer!;
    notifyListeners();
    log(isFreelancer.toString());
  }

  /* ------------------------------ general-info-save ------------------------------ */
  void onGeneralSave(
    _, {
    String? email,
    int? genderId,
    String? mobile = "",
    String? nameEn,
    String? logo = "",
    bool? isFreeLancer,
    int? businessServiceId,
    String? nameAr = "",
    String? tagLine = "",
    String? edate,
    String? whatsapp = "",
    String? tel1 = "",
    String? url = "",
    String? tel2 = "",
    String? aboutUs = "",
    String? taxNumber = "",
  }) async {
    List<Map<String, dynamic>> businessSubCategoryIds = businessSubCategorySelectedListID.map((e) => {"btypeId": e}).toList();
    List<Map<String, dynamic>> amentiasIds = amentiasSelectedListID.map((e) => {"amenityId": e}).toList();
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

    setBusy(true);
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
    genInfo = await generalInformationWithCompanyId(companyId!);
    notifyListeners();
    loadGeneralData(_, reload: true);
  }

  /* ------------------------------ on-social-save ------------------------------ */
  void onSocialSave(
    _, {
    String? facebook = "",
    String? instagram = "",
    String? linkedIn = "",
    String? twitter = "",
  }) async {
    setBusy(true);
    await putUpdateSocialMedia(companyId, facebook, instagram, linkedIn, twitter);
    loadGeneralData(_, reload: true);
  }

  /* ------------------------------ loadGeneralData------------------------------ */
  void loadGeneralData(_, {bool reload = false}) async {
    setBusy(true);
    if (reload) {
      genInfo = await generalInformationWithCompanyId(companyId!);
      cp = await getRegionInformation(companyId!);
    } else {
      genInfo ??= await generalInformationWithCompanyId(companyId!);
      cp ??= await getRegionInformation(companyId!);
    }
    countryList ??= await getCountries();
    notifyListeners();
    if (genInfo != null) {
      // businessSubCategory
      businessSubCategorySelectedList = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.businessTypeNameEn!).toList() : [];
      businessSubCategorySelectedListID = genInfo!.businessTypesViewModel!.isNotEmpty ? genInfo!.businessTypesViewModel!.map((e) => e.id!).toList() : [];
      if (genInfo!.businessTypesViewModel!.isNotEmpty) {
        String name = genInfo!.businessTypesViewModel!.first.businessService ?? "";
        BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == name);
        if (obj.businessServiceId != null) {
          businessSubCategoryList = await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
          businessCategoryId = obj.businessServiceId.toString();
          businessCategoryValue = obj.service!;
        }
      }
      // serviceFor
      serviceForId = genInfo!.genderId.toString();
      serviceForValue = serviceForList!.firstWhere((e) => e.genderId == (genInfo?.genderId ?? 0)).genderEn;
      serviceList = serviceForList!.map((e) => e.genderEn!).toList();
      // amentias
      amentiasStringList = amentiasList!.map((e) => e.amenityNameEn!).toList();
      amentiasSelectedList = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.amenityNameEn!).toList() : [];
      amentiasSelectedListID = genInfo!.amenitiesViewModels!.isNotEmpty ? genInfo!.amenitiesViewModels!.map((e) => e.id!).toList() : [];
    }
    setBusy(false);
    notifyListeners();
    Provider.of<GeneralInfoProvider>(_, listen: false).loadItem(genInfo, cp,countryList);
    Provider.of<SocialMediaProvider>(_, listen: false).loadItem(genInfo);
  }

  /* ------------------------------ LocationData------------------------------ */
  void loadLocationData(BuildContext _) async {
    setBusy(true);
    countryList ??= await getCountries() ?? [];
    regionInfo ??= await regionInformation(companyId!);
    setBusy(false);
    notifyListeners();
    Provider.of<LocationProvider>(_, listen: false).loadItems(regionInfo, countryList);
  }

  /* ------------------------------ BusinessHoursData------------------------------ */
  void businessHoursData(BuildContext _, {bool reload = false}) async {
    setBusy(true);
    if (reload) {
      timings = await getCompanyTimings(companyId!);
    } else {
      timings ??= await getCompanyTimings(companyId!);
    }
    setBusy(false);
    notifyListeners();
    Provider.of<BusinessHoursProvider>(_, listen: false).loadItems(timings!);
  }

  /* ------------------------------ PackagesData------------------------------ */
  void packagesData(_, {bool reload = false}) async {
    setBusy(true);
    if (reload) {
      cp = await getRegionInformation(companyId!);
      departmentList = await getDepartment(companyId!) ?? [];
      designationList = await getDesignationList(companyId!) ?? [];
    } else {
      cp ??= await getRegionInformation(companyId!);
      departmentList ??= await getDepartment(companyId!) ?? [];
      designationList ??= await getDesignationList(companyId!) ?? [];
    }
    setBusy(false);
    notifyListeners();
    Provider.of<FileSectionProvider>(_, listen: false).loadItem(cp?.companyImages);
    Provider.of<ContactPersonInfoProvider>(_, listen: false).loadItems(cp,countryList);
  }

  //State Change Staff
  void businessCategoryOnChanged(String? value) async {
    BusinessServicesByCountry obj = businessCategoryList!.firstWhere((e) => e.service == value);
    businessCategoryId = obj.businessServiceId.toString();
    businessCategoryValue = value;
    notifyListeners();
    setBusy(true);
    businessSubCategoryList = await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId!);
    businessSubCategorySelectedList = [];
    businessSubCategorySelectedListID = [];
    businessCategoryFocusNode.requestFocus();
    setBusy(false);
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
      businessSubCategoryFocusNode.requestFocus();
      notifyListeners();
    }
  }

  void businessSubCategoryRemove(String? value) {
    BusinessTypes obj = businessSubCategoryList!.firstWhere((e) => e.businessTypeNameEn == value);
    if (businessSubCategorySelectedList.contains(obj.businessTypeNameEn)) {
      businessSubCategorySelectedList.remove(obj.businessTypeNameEn!);
      businessSubCategorySelectedListID.remove(obj.businessTypeId!);
      businessSubCategoryFocusNode.requestFocus();
      notifyListeners();
    }
  }

  void amenitiesOnChanged(String? value) {
    Amenities obj = amentiasList!.firstWhere((e) => e.amenityNameEn == value);
    if (!amentiasSelectedList.contains(obj.amenityNameEn)) {
      amentiasSelectedList.add(obj.amenityNameEn!);
      amentiasSelectedListID.add(obj.id!);
      amenitiesFocusNode.requestFocus();
      notifyListeners();
    }
  }

  void amenitiesOnRemove(String? value) {
    Amenities obj = amentiasList!.firstWhere((e) => e.amenityNameEn == value);
    if (amentiasSelectedList.contains(obj.amenityNameEn)) {
      amentiasSelectedList.remove(obj.amenityNameEn!);
      amentiasSelectedListID.remove(obj.id!);
      amenitiesFocusNode.requestFocus();
      notifyListeners();
    }
  }

  void servicesForOnChanged(String? value) {
    serviceForId = serviceForList!.firstWhere((e) => e.genderEn == value).genderId.toString();
    serviceForValue = value;
    servicesForFocusNode.requestFocus();
    notifyListeners();
  }

  void verifyMobileHandler(_, value) {
    verifyEmailOrMobile(_);
  }

  void verifyEmailHandler(_, value) {
    verifyEmailOrMobile(_);
  }

  void accountDeleteTapHandler(_) {
    deleteAlert(
      _,
      iconPath: MyIcon.popD,
      text: "What do you want to do with your account?",
      onNoText: "Deactivate",
      onYesText: "Delete",
      onYesTap: () {
        Get.back();
      },
    );
  }

  // void deleteCompanyTiming() {
  //   • /api/CompanyTimings/DeleteCompanyTimingRow/{CId}
  // }
}
