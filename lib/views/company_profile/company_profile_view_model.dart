import 'dart:core';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/amenities/amenities.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:stacked/stacked.dart';

import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../models/gender/gender.dart';
import '../../models/general_info/general_info.dart';

class CompanyProfileViewModel extends BaseViewModel with CompanyProfileService {
  final UserData? user;
  String companyId = "72";
  String countryId = "143";
  GeneralInformation? genInfo;
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
  List<String>? businessCategoryList = [];

  // businessSubCategoryList
  List<String>? businessSubCategoryList = [];
  List<String>? businessSubCategorySelectedList = [];

  List<String>? countryList = [];
  List<String>? stateList = [];
  List<String>? cityList = [];
// Gender
  List<String>? serviceForList = [];
  // Amenities
  List<String>? amentiasList = [];
  List<String>? amentiasSelectedList = [];

  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  bool? isFreelancer = false;
  bool? isDepartment = false;
  bool? isDesignation = false;

  String? busCatValue;

  String? serviceForValue;

  int tabIndex = 0;

  ///
  List<BusinessServicesByCountry> businessCategory = [];
  List<BusinessTypes> businessSubCategory = [];

  CompanyProfileViewModel({this.user}) {
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
    // onTabChanged(tabIndex);
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    genInfo = await generalInformationWithCompanyId(companyId);
    List<Gender> gender = await getGenders() ?? [];
    serviceForList = gender.isNotEmpty ? gender.map<String>((e) => e.genderEn!).toList() : [];
    //
    List<Amenities> amentias = await getAmenities() ?? [];
    amentiasList = amentias.isNotEmpty ? amentias.map<String>((e) => e.amenityNameEn!).toList() : [];
    //
    businessCategory = await getBusinessCategory('143') ?? [];
    businessCategoryList = businessCategory.isNotEmpty ? businessCategory.map<String>((e) => e.service!).toList() : [];
    //
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

    //Let other views to render again
    setBusy(false);
    notifyListeners();
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
    // int genderId = serviceForId ?? 0;
    List companyBusinessTypes = [];
    List companyAmenity = [];
    bool isFreeLancer = isFreelancer ?? false;
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
      edate,
      whatsapp,
      tel1,
      url,
      tel2,
      aboutUs,
      taxNumber,
      companyBusinessTypes,
      companyAmenity,
    );
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
  void onBusinessHoursSave() {}
  /* ------------------------------ on-file-media-save------------------------------ */
  void onUploadMedia(File? file) {}

  void loadGeneralData() {
    // // businessCategoryList = await getBusinessCategory('143') ?? [];
    // // businessCategoryList = businessList.isNotEmpty ? businessList s.map<String>((e) => e.service!).toList() : [];
    // // businessServiceIdWithCountryId()
    // GeneralInformation? generalInformation = await generalInformationWithCompanyId(id!);
    // isFreelancer = generalInformation!.isFreeLancer ?? false;
    // companyNameController.text = genInfo!.companyNumber ?? "";
    // taglineController.text = genInfo!.tagLine ?? "";
    // companyEstablishmentYearController.text = genInfo!.edate ?? "";
    // websiteController.text = genInfo!.url ?? "";
    // telephoneController.text = genInfo!.tel1 ?? "";
    // emailController.text = genInfo!.email ?? "";
    // additionalInfoController.text = genInfo!.aboutUs ?? "";

    // // socialMidea
    // facebookController.text = genInfo!.socialMediaInfo?.facebook ?? "";
    // instagramController.text = genInfo!.socialMediaInfo?.instagram ?? "";
    // linkedInController.text = genInfo!.socialMediaInfo?.linkedIn ?? "";
    // twitterController.text = genInfo!.socialMediaInfo?.twitter ?? "";
  }

  void loadSocialMediaData() {}

  void loadLocationData() async {
    // setBusy(true);
    // List<Countries> countries = await getCountries() ?? [];
    // amentiasList = countries.isNotEmpty ? countries.map<String>((e) => e.nameEn.toString()).toList() : [];
    // setBusy(false);
    // notifyListeners();
  }

  void contactPersonInfoData() {}

  void businessHoursData() {}

  void packagesData() {}

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
    log(value.toString());
    tabIndex = value;
    notifyListeners();
  }

  onChangedBusinessSubCategory(value) async {
    // setBusy(true);
    // List<BusinessTypes> businessSubCategory = await businessServiceIdWithCountryId(, '143') ?? [];
    // businessSubCategoryList = businessSubCategory.isNotEmpty ? businessSubCategory.map<String>((e) => e.businessTypeNameEn!).toList() : [];
    // setBusy(false);
    // notifyListeners();
  }

  void copEstabYearOnTap(_) async {
    // log("message");
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
    log(value.toString());
    amentiasSelectedList = value;
    notifyListeners();
  }

  void busCatOnChange(String? value) async {
    setBusy(true);
    busCatValue = value;
    BusinessServicesByCountry obj = businessCategory.firstWhere((e) => e.service == value);
    businessSubCategory = await businessServiceIdWithCountryId("${obj.businessServiceId!}", countryId);
    businessSubCategoryList = businessSubCategory.map<String>((e) => e.businessTypeNameEn!).toList();
    setBusy(false);
    notifyListeners();
  }

  void busSubCatSelectedOnChange(List? value) {}

  void serviceForOnChange(String? value) {
    serviceForValue = value;
    notifyListeners();
  }
}
