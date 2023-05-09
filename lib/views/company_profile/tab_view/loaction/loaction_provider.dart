import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';
import 'package:neeleez_flutter_app/views/company_profile/services/company_profile_service.dart';

class LocationProvider extends ChangeNotifier with CompanyProfileService {
  RegionInformation? data;
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController additionalAddress = TextEditingController();
  String? countryImage;

  LocationProvider() {
    // loadItems();
  }

  void loadItems(RegionInformation? regionInfo, List<Countries>? countryList) async {
    countryImage = countryList?.firstWhere((e) => e.id == regionInfo?.countryId).iconImage2;
    data = regionInfo;
    state.text = regionInfo?.provinceNameEn ?? "";
    city.text = regionInfo?.cityNameEn ?? "";
    country.text = regionInfo?.countryNameEn ?? "";
    address.text = regionInfo?.googleAddress ?? "";
    additionalAddress.text = regionInfo?.address ?? "";
    notifyListeners();
  }
}
