import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';

import '../../../../models/company/cities.dart';
import '../../../../models/company/provinces.dart';

class LocationProvider extends ChangeNotifier with CompanyProfileService {
  Countries? country;
  Provinces? province;
  Cities? city;
  bool? loadingC = false;
  bool? loadingP = false;
  List<Countries>? countries = [];
  List<Provinces>? provinces = [];
  List<Cities>? cities = [];
  LocationProvider() {
    loadItems();
  }

  void loadItems() {}

  void onCountryChange(int? value, List<Countries>? countries) async {
    notifyListeners();
    country = countries?.firstWhere((element) => element.id == value);
    loadingC = true;
    notifyListeners();
    provinces = await getProvinces("${country!.id!}");
    cities = [];
    province = null;
    city = null;
    loadingC = false;
    notifyListeners();
  }

  void onStateChanged(String? value) async {
    province = provinces?.firstWhere((element) => element.provinceNameEn == value);
    loadingP = true;
    notifyListeners();
    cities = await getCities("${province!.provinceId!}");
    city = null;
    loadingP = false;
    notifyListeners();
  }

  void onCityChanged(String? value) {
    city = cities?.firstWhere((element) => element.cityNameEn == value);
    notifyListeners();
  }

  clearAll() {
    country = null;
    province == null;
    city == null;
    loadingC = false;
    loadingP = false;
    countries = [];
    provinces = [];
    cities = [];
    notifyListeners();
  }
}
