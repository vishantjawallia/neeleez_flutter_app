import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/models/country_detail.dart';
import 'package:neeleez_flutter_app/views/registration/service/registration_service.dart';
import 'package:stacked/stacked.dart';

import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../models/company/provinces.dart';
import '../company_profile/services/company_profile_service.dart';

class RegistrationViewModel extends BaseViewModel with RegistrationService, CompanyProfileService {
  final List<Countries>? countries;
  final CountryDetail? countryDetail;

  List<BusinessServicesByCountry> bus = [];
  BusinessServicesByCountry? busObj;

  List<BusinessTypes> busType = [];
  BusinessTypes? busTypeObj;

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

  RegistrationViewModel(this.countries, this.countryDetail) {
    name.addListener(() => notifyListeners());
    tel.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    pass.addListener(() => notifyListeners());
    googleAddr.addListener(() => notifyListeners());
    additionalAddr.addListener(() => notifyListeners());
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
    busTypeObj = null;
    busObj = value;
    setBusy(true);
    busType = await businessServiceIdWithCountryId("${value!.businessServiceId}", "${countryDetail!.countryId}") ?? [];
    setBusy(false);
    notifyListeners();
  }

  void busSubCategoryOnChange(BusinessTypes? value) {
    busTypeObj = value;
    notifyListeners();
  }

  void countryOnChange(Countries? value) async {
    city = null;
    province = null;
    country = value;
    setBusy(true);
    provinces = await getProvinces("${value!.id}") ?? [];
    setBusy(false);
    notifyListeners();
  }

  void provinceOnChange(Provinces? value) async {
    city = null;
    province = value;
    setBusy(true);
    cities = await getCities("${value!.provinceId}") ?? [];
    setBusy(false);
    notifyListeners();
  }

  void cityOnChange(Cities? value) {
    city = value;
    notifyListeners();
  }
}
