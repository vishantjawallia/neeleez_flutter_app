import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';

class CompanyProfileService {
  Future getGenders() async {
    try {
      final res = await apiRepository.apiGet(url: "$baseUrl/api/Genders");
      if (res != null) {
        return res;
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return null;
  }

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
// 1)	GET => /api/Genders/genders/true

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

// 2)	PUT => /api/Companies/UpdateTiming/{comapnyId}

// Package
// 1)	GET => /api/CompanyProfile/PackageInformation/{companyId}

// image upload/
// 1)	GET => /api/ Companies/CompanyProfile2/{comapnyId}

// 2)	POST => /api/Companies/CompanyLogo/{comapnyId}/{IsProfileChange}
}
