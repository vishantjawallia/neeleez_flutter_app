import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/components/dailogs/warning_popup.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/models/country_detail.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/views/registration/service/registration_service.dart';
import 'package:neeleez_flutter_app/views/select_address/select_address_view.dart';
import 'package:stacked/stacked.dart';

import '../../config/pref_constant.dart';
import '../../config/preference.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../models/company/provinces.dart';
import '../company_profile/services/company_profile_service.dart';

class RegistrationViewModel extends BaseViewModel with RegistrationService, CompanyProfileService {
  final List<Countries>? countries;
  final CountryDetail? countryDetail;
  String? companyId = SharedPreferenceHelper.getString(Preferences.companyId);
  String? countryId = SharedPreferenceHelper.getString(Preferences.countryId);

  double? lat;
  double? long;

  List<BusinessServicesByCountry> bus = [];
  BusinessServicesByCountry? busObj;

  List<BusinessTypes> busType = [];
  List<BusinessTypes> busSelectedList = [];
  // BusinessTypes? busTypeObj;

  List<Provinces> provinces = [];
  Provinces? province;

  List<Cities> cities = [];
  Cities? city;

  Countries? country;

  TextEditingController name = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController googleAddr = TextEditingController();
  TextEditingController additionalAddr = TextEditingController();
  FocusScopeNode busTypeFocusScopeNode = FocusScopeNode();
  ScrollController busTypeScrollController = ScrollController();

  bool isFreelancer = false;

  bool isTerms = false;

  List<Gender> serviceList = [];
  Gender? serviceObj;

  // List<BusinessTypes> busSelectedList = [];

  RegistrationViewModel(this.countries, this.countryDetail) {
    name.addListener(() => notifyListeners());
    tel.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    pass.addListener(() => notifyListeners());
    googleAddr.addListener(() => notifyListeners());
    additionalAddr.addListener(() => notifyListeners());
    //
    busTypeFocusScopeNode.addListener(() {
      busTypeScrollController.animateTo(busTypeScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 400), curve: Curves.ease);
      notifyListeners();
    });
    //
    busTypeScrollController.addListener(() => notifyListeners());
    loadItems();
  }

  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    // String? countryCode = SharedPreferenceHelper.getString(Preferences.countryCode);
    bus = await getBusinessCategory(countryDetail!.countryId!.toString()) ?? [];
    setBusy(false);
    notifyListeners();
  }

  // businessServiceIdWithCountryId();
  // getProvinces();
  // getCities();
  // companyEmailExist();
  // addNewCompany();
  // addDeviceInfo();

  void busCategoryOnChange(BusinessServicesByCountry? value) async {
    busSelectedList = [];
    busObj = value;
    setBusy(true);
    busType = await businessServiceIdWithCountryId("${value!.businessServiceId}", "${countryDetail!.countryId}") ?? [];
    setBusy(false);
    notifyListeners();
    log(busObj.toString());
  }

  void busSubCategoryOnChange(BusinessTypes? value) {
    if (!busSelectedList.contains(value)) {
      busSelectedList.add(value!);
      notifyListeners();
    }
    // busTypeScrollController.animateTo(busTypeScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
    // notifyListeners();
    log(busSelectedList.toString());
  }

  void countryOnChange(Countries? value) async {
    city = null;
    province = null;
    country = value;
    setBusy(true);
    provinces = await getProvinces("${value!.id}") ?? [];
    setBusy(false);
    notifyListeners();
    log(country.toString());
  }

  void provinceOnChange(_, Provinces? value) async {
    city = null;
    province = value;
    setBusy(true);
    cities = await getCities("${value!.provinceId}") ?? [];
    setBusy(false);
    notifyListeners();
    if (cities.isEmpty) {
      warningPopup(_, dsc: "Currently no city found for selected province");
    }
    log(province.toString());
  }

  void cityOnChange(Cities? value) {
    city = value;
    notifyListeners();
    log(city.toString());
  }

  void freelancerOnChange() {
    isFreelancer = !isFreelancer;
    notifyListeners();
  }

  void googleMapOnTap() {
    Get.to(() => SelectAddressView(city: city));
  }

  void busSubCategoryOnRemove(String? value) {
    BusinessTypes? obj = busSelectedList.firstWhere((e) => e.businessTypeNameEn == value);
    if (busSelectedList.contains(obj)) {
      busSelectedList.remove(obj);
      // busTypeScrollController.animateTo(busTypeScrollController.position.maxScrollExtent, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      notifyListeners();
    }
  }

  void termsOnChange(bool? value) {
    isTerms = value!;
    notifyListeners();
  }

  void registerOnTap(_) async {
    if (name.text.isEmpty) {
      warningPopup(_, dsc: "Please enter a Company name");
      return;
    }
    if (busObj == null || busSelectedList.isEmpty) {
      warningPopup(_, dsc: "Select Business Type");
      return;
    }
    if (email.text.isEmpty) {
      warningPopup(_, dsc: "Please enter an email");
      return;
    }
    if (pass.text.isEmpty) {
      warningPopup(_, dsc: "Password is empty or invalid");
      return;
    }
    if (province == null) {
      warningPopup(_, dsc: "Select State / Province");
      return;
    }
    if (city == null) {
      warningPopup(_, dsc: "Select City");
      return;
    }
    if (googleAddr.text.isEmpty) {
      warningPopup(_, dsc: "Type your location or select in map");
      return;
    }
    if (!isTerms) {
      warningPopup(_, dsc: "You must accept the Terms & Conditions");
      return;
    }
    setBusy(true);
    // bool res = await addNewCompany(
    //   0,
    //   int.parse(companyId!),
    //   isFreelancer,
    //   name.text, //companyNameEn!,
    //   0, //genderId,
    //   "",
    //   "",
    //   "",
    //   email.text,
    //   pass.text,
    //   0,
    //   int.parse(countryId!),
    //   city!.cityId,
    //   lat,
    //   long,
    //   "",
    //   "",
    //   0,
    //   false,
    //   false,
    //   false,
    //   busObj!.businessServiceId,
    //   0,
    //   busSelectedList.map((e) => {"btypeId": e.businessTypeId!}).toList(),
    // );
    // if (res) {
    //   // bool res = await addDeviceInfo(
    //   //   applicationTypeId,
    //   //   clientId,
    //   //   companyId,
    //   //   salesTeamId,
    //   //   manufacturer,
    //   //   name,
    //   //   versionString,
    //   //   platform,
    //   //   idiom,
    //   //   deviceType,
    //   //   orientation,
    //   //   density,
    //   //   width,
    //   //   height,
    //   //   rotation,
    //   // );
    //   setBusy(false);
    // }

    setBusy(false);
  }

  Future<bool> onWillPop() async {
    // alertPopUp(_)
    return false;
  }

  void serviceForOnChange(Gender? value) {
    serviceObj = value;
    notifyListeners();
  }
}



// {
//   "isRegistered": 0,
//   "companyId": 73488,
//   "isFreeLancer": true,
//   "companyNameEn": "Bhuci",
//   "genderId": 0,
//   "mobile": "9988204108",
//   "whatsapp": "9988204108",
//   "tel1": "9988204108",
//   "email": "bhuci@gmail.com",
//   "password": "123456",
//   "areaId": 0,
//   "countryId": 100,
//   "cityId": 1467,
//   "lattitude": 32.26707956240034,
//   "longitude": 75.56337676942348,
//   "address": "Hello",
//   "googleAddress": "Narot Mehra, Jalandhar Division, Punjab, India, 145025",
//   "teamUserId": 0,
//   "isEmailVerified": false,
//   "appMobileVerified": false,
//   "webMobileVerified": false,
//   "businessServiceId": 2,
//   "salesTeamId": 0,
//   "serviceTypes": [
//     {
//       "btypeId": 22
//     },{
//       "btypeId": 36
//     }
//   ]
// }