// CompanyProfileService CompanyProfileService = CompanyProfileService();

import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';

import '../../../config/url.dart';
import '../../../models/gender/gender.dart';

mixin RegistrationService {
  // GET => /api/Genders/genders/true
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

// GET => /api/ BusinessService/BusinessServicesByCountry/IN

// GET => /api/ BusinessTypes/{BusinessCat}/{CountryId}

// GET => /api/ Countries/

// GET => /api/ Provinces/{countryId}

// GET => /api/ Cities/{provinceId}

// GET => /api/Companies/CompanyEmailExist/{email}/0

  // POST => /api/Companies/NewCompany
  Future<bool> addNewCompany(
    int? isRegistered,
    int? companyId,
    bool? isFreeLancer,
    String? companyNameEn,
    int? genderId,
    String? mobile,
    String? whatsapp,
    String? tel1,
    String? email,
    String? password,
    int? areaId,
    int? countryId,
    int? cityId,
    double? lattitude,
    double? longitude,
    String? address,
    String? googleAddress,
    int? teamUserId,
    bool? isEmailVerified,
    bool? appMobileVerified,
    bool? webMobileVerified,
    int? businessServiceId,
    int? salesTeamId,
    List? serviceTypes,
  ) async {
    Map<String, dynamic> body = {
      "isRegistered": isRegistered,
      "companyId": companyId,
      "isFreeLancer": isFreeLancer,
      "companyNameEn": companyNameEn,
      "genderId": genderId,
      "mobile": mobile,
      "whatsapp": whatsapp,
      "tel1": tel1,
      "email": email,
      "password": password,
      "areaId": areaId,
      "countryId": countryId,
      "cityId": cityId,
      "lattitude": lattitude,
      "longitude": longitude,
      "address": address,
      "googleAddress": googleAddress,
      "teamUserId": teamUserId,
      "isEmailVerified": isEmailVerified,
      "appMobileVerified": appMobileVerified,
      "webMobileVerified": webMobileVerified,
      "businessServiceId": businessServiceId,
      "salesTeamId": salesTeamId,
      "serviceTypes": serviceTypes,
      // "serviceTypes": [
      //   {"btypeId": 0}
      // ]
    };

    try {
      final res = await apiRepository.apiPost("$baseUrl/api/Companies/NewCompany", body);
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("getGenders========>$e");
    }
    return false;
  }

  // POST => /api/Deviceinfo
  Future<bool> addDeviceInfo(
    int? applicationTypeId,
    int? clientId,
    int? companyId,
    int? salesTeamId,
    String? manufacturer,
    String? name,
    String? versionString,
    String? platform,
    String? idiom,
    String? deviceType,
    String? orientation,
    String? density,
    String? width,
    String? height,
    String? rotation,
  ) async {
    Map<String, dynamic> body = {
      "applicationTypeId": applicationTypeId,
      "clientId": clientId,
      "companyId": companyId,
      "salesTeamId": salesTeamId,
      "manufacturer": manufacturer,
      "name": name,
      "versionString": versionString,
      "platform": platform,
      "idiom": idiom,
      "deviceType": deviceType,
      "orientation": orientation,
      "density": density,
      "width": width,
      "height": height,
      "rotation": rotation
    };

    try {
      final res = await apiRepository.apiPost("$baseUrl/api/Deviceinfo", body);
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("addDeviceInfo========>$e");
    }
    return false;
  }

// {
//   "applicationTypeId": 0,
//   "clientId": 0,
//   "companyId": 0,
//   "salesTeamId": 0,
//   "manufacturer": "string",
//   "name": "string",
//   "versionString": "string",
//   "platform": "string",
//   "idiom": "string",
//   "deviceType": "string",
//   "orientation": "string",
//   "density": "string",
//   "width": "string",
//   "height": "string",
//   "rotation": "string"
// }
}
