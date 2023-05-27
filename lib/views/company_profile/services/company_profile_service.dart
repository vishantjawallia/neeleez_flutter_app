import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/url.dart';
import 'package:neeleez_flutter_app/models/amenities/amenities.dart' as am;
import 'package:neeleez_flutter_app/models/business_types/business_services_by_country.dart';

import 'package:neeleez_flutter_app/models/company/company_profile_images.dart';
import 'package:neeleez_flutter_app/models/company/region_Info.dart';
import 'package:neeleez_flutter_app/models/country_languages.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';
import 'package:neeleez_flutter_app/models/package/package_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/model/put_timing.dart';
// /api/CompanyProfile/GeneralInformation/{CompanyId}
// /api/CompanyProfile/RegionInformation/{CompanyId}/api/CompanyProfile/ContactPersonInfo/{CompanyId}
import '../../../models/business_types/business_types.dart';
import '../../../models/company/cities.dart';
import '../../../models/company/companies.dart';
import '../../../models/company/company_profile.dart';
import '../../../models/company/designation.dart';
import '../../../models/company/provinces.dart';
import '../../../models/company/timing.dart';

mixin CompanyProfileService {
  Future<List<Gender>?> getGenders() async {
    try {
      final res = await apiRepository.apiGet(Url.Genders);
      if (res != null) {
        return Gender.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return null;
  }

  Future<List<am.Amenities>?> getAmenities() async {
    try {
      final res = await apiRepository.apiGet(Url.Amenities);
      if (res != null) {
        return am.Amenities.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getAmenities========>$e");
    }
    return null;
  }

  // GET => /api/ BusinessService/BusinessServicesByCountry/IN
  Future<List<BusinessServicesByCountry>?> getBusinessCategory(
    String countryId,
  ) async {
    try {
      final res = await apiRepository.apiGet('$baseUrl/api/BusinessService/BusinessServicesByCountry/$countryId');
      if (res != null) {
        return BusinessServicesByCountry.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getBusinessCategory========>$e");
    }
    return null;
  }

  // GET => /api/Companies/CompanyEmailExist/{email}/0
  Future<bool> companyEmailExist(
    String email,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/CompanyEmailExist/$email");
      if (res != null) {
        return res as bool;
      }
    } catch (e) {
      log(e.toString());
      log("companyEmailExist========>$e");
    }
    return false;
  }

  Future<GeneralInformation?> generalInformationWithCompanyId(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/GeneralInformation/$companyId");
      if (res != null) {
        return GeneralInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("generalInformationWithCompanyId========>$e");
    }
    return null;
  }

  // GET => /api/ BusinessTypes/{BusinessCat}/{CountryId}
  Future<List<BusinessTypes>?> businessServiceIdWithCountryId(
    String businessServiceId,
    String countryId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/BusinessTypes/$businessServiceId/$countryId");
      log(res.toString());
      if (res != null) {
        return BusinessTypes.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("businessServiceIdWithCountryId========>$e");
    }
    return null;
  }

  Future<List<Designation>?> getDesignation() async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Designation");
      log(res.toString());
      if (res != null) {
        return Designation.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("regionInformation========>$e");
    }
    return null;
  }

  Future<List<Countries>?> getCountries() async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Countries");
      log(res.toString());
      if (res != null) {
        return Countries.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getCountries========>$e");
    }
    return null;
  }

  Future<List<CountryLanguage>?> getLanguages() async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CountryLanguages");
      log(res.toString());
      if (res != null) {
        return CountryLanguage.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getLanguages========>$e");
    }
    return null;
  }

  // GET => /api/ Provinces/{countryId}
  Future<List<Provinces>?> getProvinces(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Provinces/$companyId");
      log(res.toString());
      if (res != null) {
        return Provinces.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getProvinces========>$e");
    }
    return null;
  }

  // GET => /api/ Cities/{provinceId}
  Future<List<Cities>?> getCities(
    String provinceId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Cities/$provinceId");
      log(res.toString());
      if (res != null) {
        return Cities.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getCities========>$e");
    }
    return null;
  }

  Future<CompanyProfile?> getRegionInformation(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/CompanyProfile/$companyId");
      log(res.toString());
      if (res != null) {
        return CompanyProfile.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("getRegionInformation========>$e");
    }
    return null;
  }

  Future<PackageInformation?> packageInformation(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/PackageInformation/$companyId");
      log(res.toString());
      if (res != null) {
        return PackageInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("packageInformation========>$e");
    }
    return null;
  }

  Future<RegionInformation?> regionInformation(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/RegionInformation/$companyId");
      log(res.toString());
      if (res != null) {
        return RegionInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("regionInformation========>$e");
    }
    return null;
  }

  // Future<void> getContactPersonInfo(
  //   String companyId,
  // ) async {
  //   try {
  //     final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/ContactPersonInfo/$companyId");
  //     log(res.toString());
  //     if (res != null) {
  //       return;
  //       return RegionInformation.fromJson(res);
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //     log("regionInformation========>$e");
  //   }
  //   return;
  // }

  Future<void> getTimingInformation(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/TimingInformation/$companyId");
      log(res.toString());
      if (res != null) {
        return;
        // return RegionInformation.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("regionInformation========>$e");
    }
    return;
  }

  Future<List<CompanyTimings>?> getCompanyTimings(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyTimings/$companyId");
      log(res.toString());
      if (res != null) {
        return CompanyTimings.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("regionInformation========>$e");
    }
    return null;
  }

  Future<bool> postCompanyTimings(
    String companyId,
    dynamic list,
  ) async {
    try {
      final res = await apiRepository.apiPostWithDynamic("$baseUrl/api/CompanyTimings", list);
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("postCompanyTimings========>$e");
    }
    return false;
  }

  Future<List<CompanyProfileImage>?> companyProfileImage(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/CompanyProfile/Images/$companyId");
      log(res.toString());
      if (res != null) {
        return CompanyProfileImage.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("companyProfileImage========>$e");
    }
    return null;
  }

  Future<void> postCompanyLogo(
    String companyId,
    isProfileChange,
  ) async {
    try {
      final res = await apiRepository.apiPost("$baseUrl/api/Companies/CompanyLogo/$companyId/:IsProfileChange", {});
      log(res.toString());
      if (res != null) {
        return;
      }
    } catch (e) {
      log(e.toString());
      log("postCompanyLogo========>$e");
    }
    return;
  }

  Future<void> putGeneralInformation(
    String? companyId,
    String? email,
    int? genderId,
    String? mobile,
    String? nameEn,
    String? logo,
    bool? isFreeLancer,
    int? businessServiceId,
    String? nameAr,
    String? tagLine,
    String? edate,
    String? whatsapp,
    String? tel1,
    String? url,
    String? tel2,
    String? aboutUs,
    String? taxNumber,
    List<Map<String, dynamic>>? companyBusinessTypes,
    List<Map<String, dynamic>>? companyAmenity,
  ) async {
    Map<String, dynamic> data = {
      "email": email,
      "genderId": genderId,
      "mobile": mobile,
      "nameEn": nameEn,
      "nameAr": nameAr,
      "logo": logo,
      "isFreeLancer": isFreeLancer,
      "businessServiceId": businessServiceId,
      "tagLine": tagLine,
      "edate": edate,
      "whatsapp": whatsapp,
      "tel1": tel1,
      "url": url,
      "tel2": tel2,
      "aboutUs": aboutUs,
      "taxNumber": taxNumber,
      "companyBusinessTypes": companyBusinessTypes,
      "companyAmenity": companyAmenity,
    };
    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Companies/UpdateGeneralInformation/$companyId", data);
      log(res.toString());
      if (res != null) {
        log(res.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      log("putGeneralInformation========>$e");
    }
    return;
  }

  Future<void> putUpdateSocialMedia(
    String? companyId,
    String? facebook,
    String? instagram,
    String? linkedIn,
    String? twitter,
  ) async {
    Map<String, dynamic> data = {
      "facebook": facebook,
      "instagram": instagram,
      "linkedIn": linkedIn,
      "twitter": twitter,
    };

    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Companies/UpdateSocialMedia/$companyId", data);
      log(res.toString());
      if (res != null) {
        log(res.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      log("putUpdateSocialMedia========>$e");
    }
    return;
  }

  Future<void> putBusinessTiming(
    String? companyId,
    List<PutTiming>? data,
  ) async {
    //   Map<String, dynamic> data = {
    //     "facebook": facebook,
    //     "instagram": instagram,
    //     "linkedIn": linkedIn,
    //     "twitter": twitter,
    //      {
    //   // "id": 0,
    //   // "dowId": 0,
    //   // "startTime": "string",
    //   // "endTime": "string",
    //   // "isHoliday": true
    // }
    //   };

    try {
      final res = await apiRepository.apiPutWithDynamic("$baseUrl/api/Companies/UpdateSocialMedia/$companyId", data);
      log(res.toString());
      if (res != null) {
        log(res.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      log("putBusinessTiming========>$e");
    }
    return;
  }

  Future<void> putUpdateContactPerson(
    String? companyId,
    int? id,
    String? nameEn,
    String? nameAr,
    String? email,
    String? mobile,
    String? whatsApp,
    String? tel,
    String? designation,
    String? department,
    int? designationId,
    int? departmentId,
  ) async {
    Map<String, dynamic> data = {
      "id": id,
      "nameEn": nameEn,
      "nameAr": nameAr,
      "email": email,
      "mobile": mobile,
      "whatsApp": whatsApp,
      "tel": tel,
      "designation": designation,
      "department": department,
      "designationId": designationId,
      "departmentId": departmentId,
    };
    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Companies/UpdateContactPerson/$companyId", data);
      log(res.toString());
      if (res != null) {
        log(res.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      log("putUpdateContactPerson========>$e");
    }
    return;
  }

  Future<void> putUpdateAddress(
    String companyId,
    String address,
    String googleAddress,
    double lattitude,
    double longitude,
    int areaId,
  ) async {
    Map<String, dynamic> data = {
      "address": address,
      "googleAddress": googleAddress,
      "lattitude": lattitude,
      "longitude": longitude,
      "areaId": areaId,
    };
    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Companies/UpdateAddress/$companyId", data);
      log(res.toString());
      if (res != null) {
        log(res.toString());
        return;
      }
    } catch (e) {
      log(e.toString());
      log("putUpdateAddress========>$e");
    }
    return;
  }

  Future<bool> deleteCompanyTimings(
    String cId,
  ) async {
    try {
      final res = await apiRepository.apiDelete("$baseUrl/api/CompanyTimings/DeleteCompanyTimingRow/$cId");
      log(res.toString());
      return true;
    } catch (e) {
      log(e.toString());
      log("deleteCompanyTimings========>$e");
    }
    return false;
  }
}
