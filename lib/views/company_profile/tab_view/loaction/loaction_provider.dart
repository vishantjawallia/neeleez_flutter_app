import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';

class LocationProvider extends ChangeNotifier with CompanyProfileService {
  Countries? obj;
  List<Countries> countries = [];
  LocationProvider() {
    loadItems();
  }

  void loadItems() {}

  void onCountryChange(int? value, List<Countries>? countries) {
    obj = countries!.firstWhere((element) => element.id == value);
    notifyListeners();
  }
}
