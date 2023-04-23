import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/amenities/amenities.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:stacked/stacked.dart';

class CompanyProfileViewModel extends BaseViewModel with CompanyProfileService {
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
  List<String>? businessCategoryList = ['Hello', 'Go'];
  List<String>? businessSubCategorySelectedList = ['Hello', 'Go'];
  List<String>? businessSubCategoryList = ['Hello', 'Go'];
  List<String>? countryList = ['Hello', 'Go'];
  List<String>? stateList = ['Hello', 'Go'];
  List<String>? cityList = ['Hello', 'Go'];
  List<String>? serviceForList = ['Hello', 'Go'];
  List<String>? amentiasList = ['Hello', 'Go'];
  List<String>? amentiasSelectedList = ['Hello', 'Go'];
  String? businessCategory = "Hello";
  String? serviceFor;
  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  bool? isFreelancer = false;
  bool? isDepartment = false;
  bool? isDesignation = false;

  CompanyProfileViewModel() {
    companyNameController.addListener(() => notifyListeners());
    taglineController.addListener(() => notifyListeners());
    companyEstablishmentYearController.addListener(() => notifyListeners());
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
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here
    List<Gender> gender = await getGenders() ?? [];
    List<Amenities> amentias = await getAmenities() ?? [];
    GeneralInformation generalInformation = await generalInformationWithCompanyId("72") ?? const GeneralInformation();
    serviceForList = gender.isNotEmpty ? gender.map<String>((e) => e.genderEn.toString()).toList() : [];
    amentiasList = amentias.isNotEmpty ? amentias.map<String>((e) => e.amenityNameEn.toString()).toList() : [];
    isFreelancer = generalInformation.isFreeLancer ?? false;
    companyNameController.text = generalInformation.companyNumber ?? "";
    taglineController.text = generalInformation.tagLine ?? "";
    companyEstablishmentYearController.text = generalInformation.edate ?? "";

    websiteController.text = generalInformation.whatsapp ?? "";
    telephoneController.text = generalInformation.tel1 ?? "";
    emailController.text = generalInformation.email ?? "";
    additionalInfoController.text = generalInformation.aboutUs ?? "";
    // websiteController.text = generalInformation.w!;

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

  void onFreelancerChange(value) {
    log(value);
  }

  /* ------------------------------ general-info-save ------------------------------ */
  void onGeneralSave() {
    // log("onSave");
  }

  /* ------------------------------ on-social-save ------------------------------ */
  void onSocialSave() {}

  /* ------------------------------ on-contact-save------------------------------ */
  void onContactSave() {}

  /* ------------------------------ on-contact-save------------------------------ */
  void onBusinessHoursSave() {}
  /* ------------------------------ on-file-media-save------------------------------ */
  void onUploadMedia(File? file) {}

  // @override
  // Future<void> getGenders() {
  //   // TODO: implement getGenders
  //   throw UnimplementedError();
  // }

// Gernal info
// 1)	GET => /api/Genders/genders/true =============================================================

// 2)	GET => /api/ BusinessService/BusinessServicesByCountry/IN

// 3)	GET => /api/ BusinessTypes/{BusinessCat}/{CountryId}

// 4)	GET => /api/Amenities/

// 5)	GET => /api/Companies/CompanyEmailExist/{email}/0

// 6)	GET => /api/CompanyProfile/GeneralInformation/{companyId}

// 7)	PUT => /api/Companies/UpdateGeneralInformation/{companyId}

// 8)	POST => /api/ Companies/CompanyLogo/{companyId}/{IsProfileChange}

// Social Media
// 1)	GET => /api/CompanyProfile/GeneralInformation/{companyId}

// 2)	PUT => /api/Companies/UpdateSocialMedia/{comapnyId}

// Location
// 1)	GET => /api/ Countries/

// 2)	GET => /api/ Provinces/{countryId}

// 3)	GET => /api/ Cities/{provinceId}

// 4)	GET => /api/CompanyProfile/RegionInformation/{companyId}

// 5)	PUT => /api/Companies/UpdateAddress/{companyId}

// Contact Person info
// 1)	GET => /api/CompanyProfile/ContactPersonInfo/{companyId}

// 2)	PUT => /api/Companies/UpdateContactPerson/{companyId}

// 3)	GET => /api/ Designation/

// Business Hours
// 1)	GET => /api/CompanyProfile/TimingInformation/{companyId}

// 2)	PUT => /api/Companies/UpdateTiming/77293115

// Package
// 1)	GET => /api/CompanyProfile/PackageInformation/77293115

// image upload/
// 1)	GET => /api/ Companies/CompanyProfile2/{comapnyId}

// 2)	POST => /api/Companies/CompanyLogo/{comapnyId}/{IsProfileChange}
}
