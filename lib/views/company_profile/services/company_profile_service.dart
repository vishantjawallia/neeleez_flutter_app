import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/amenities/amenities.dart';
import 'package:neeleez_flutter_app/models/business_types/business_services_by_country.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';

class CompanyProfileService {
  Future<List<Gender>?> getGenders() async {
    try {
      final res = await apiRepository.apiGet(url: Url.Genders);
      if (res != null) {
        return Gender.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return null;
  }

  Future<List<Amenities>?> getAmenities() async {
    try {
      final res = await apiRepository.apiGet(url: Url.Amenities);
      if (res != null) {
        return Amenities.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return null;
  }

  //business category
  Future<List<BusinessServicesByCountry>?> getBusinessCategory(String countryId) async {
    try {
      final res = await apiRepository.apiGet(url: '$baseUrl/api/BusinessService/BusinessServicesByCountry/$countryId');
      if (res != null) {
        return BusinessServicesByCountry.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getBusinessCategory========>$e");
    }
    return null;
  }

  // CompanyEmailExist
  Future<bool> companyEmailExist(String? email) async {
    try {
      final res = await apiRepository.apiGet(url: "$baseUrl/api/Companies/CompanyEmailExist/$email");
      if (res != null) {
        return res as bool;
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return false;
  }

  Future<GeneralInformation?> generalInformationWithCompanyId(String? companyId) async {
    try {
      final res = await apiRepository.apiGet(url: "$baseUrl/api/CompanyProfile/GeneralInformation/$companyId");
      if (res != null) {
        return GeneralInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return null;
  }

  Future<void> businessServiceIdWithCountryId(
    String? businessServiceId,
    String? countryId,
  ) async {
    try {
      final res = await apiRepository.apiGet(url: "$baseUrl/api/BusinessTypes/$businessServiceId/$countryId");
      log(res.toString());
      if (res != null) {
        // return GeneralInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return;
  }
  // Future<List<Gender>?> getGenders() async {
  //   try {
  //     final res = await apiRepository.apiGet(url: Url.Genders);
  //     if (res != null) {
  //       return Gender.fromJsonList(res);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     log("getGenders========>$e");
  //   }
  //   return null;
  // }

  // Future<void> getGenders() async {
  //   try {
  //     final res = await apiRepository.apiGet(url: "$baseUrl/api/Genders");
  //     if (res != null) {
  //       return res;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     log("getGenders========>$e");
  //   }
  // }

  // Gernal info

// 2)	GET => /api/ BusinessService/BusinessServicesByCountry/IN

// 3)	GET => /api/ BusinessTypes/{BusinessCat}/{CountryId}

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

// 2)	PUT => /api/Companies/UpdateTiming/{comapnyId}

// Package
// 1)	GET => /api/CompanyProfile/PackageInformation/{companyId}

// image upload/
// 1)	GET => /api/ Companies/CompanyProfile2/{comapnyId}

// 2)	POST => /api/Companies/CompanyLogo/{comapnyId}/{IsProfileChange}
}
