import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/amenities/amenities.dart';
import 'package:neeleez_flutter_app/models/business_types/business_services_by_country.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';
import 'package:stacked/stacked.dart';

import '../../models/company/companies.dart';

class CompanyProfileViewModel extends BaseViewModel with CompanyProfileService {
  final UserData? user;
  String companyId = "72";
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
  int? serviceForId;
  String? countrySelected;
  String? stateSelected;
  String? citySelected;
  bool? isFreelancer = false;
  bool? isDepartment = false;
  bool? isDesignation = false;

  CompanyProfileViewModel({this.user}) {
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
    //gender
    List<Gender> gender = await getGenders() ?? [];
    serviceForList = gender.isNotEmpty ? gender.map<String>((e) => e.genderEn.toString()).toList() : [];
    //amentias
    List<Amenities> amentias = await getAmenities() ?? [];
    amentiasList = amentias.isNotEmpty ? amentias.map<String>((e) => e.amenityNameEn.toString()).toList() : [];

    // businessList
    List<BusinessServicesByCountry> businessList = await getBusinessCategory('143') ?? [];
    countryList = businessList.isNotEmpty ? businessList.map<String>((e) => e.service.toString()).toList() : [];
    // businessServiceIdWithCountryId()
    GeneralInformation? generalInformation = await generalInformationWithCompanyId("72");
    isFreelancer = generalInformation!.isFreeLancer ?? false;
    companyNameController.text = generalInformation.companyNumber ?? "";
    taglineController.text = generalInformation.tagLine ?? "";
    companyEstablishmentYearController.text = generalInformation.edate ?? "";
    websiteController.text = generalInformation.whatsapp ?? "";
    telephoneController.text = generalInformation.tel1 ?? "";
    emailController.text = generalInformation.email ?? "";
    additionalInfoController.text = generalInformation.aboutUs ?? "";

    // socialMidea
    facebookController.text = generalInformation.socialMediaInfo?.facebook ?? "";
    instagramController.text = generalInformation.socialMediaInfo?.instagram ?? "";
    linkedInController.text = generalInformation.socialMediaInfo?.linkedIn ?? "";
    twitterController.text = generalInformation.socialMediaInfo?.twitter ?? "";

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
    int genderId = serviceForId ?? 0;
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

  void loadGeneralData() {}

  void loadSocialMediaData() {}

  void loadLocationData() async {
    setBusy(true);
    List<Countries> countries = await getCountries() ?? [];
    amentiasList = countries.isNotEmpty ? countries.map<String>((e) => e.nameEn.toString()).toList() : [];
    setBusy(false);
    notifyListeners();
  }

  void contactPersonInfoData() {}

  void businessHoursData() {}

  void packagesData() {}

  void spaceFilesData() {}

  void onTabChanged(int value) {
    log(value.toString());
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
  }
}
