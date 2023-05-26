import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/models/company/sign_in.dart';

mixin MobileVerificationService {
  // GET /api/Companies/MobileAvailability/{Mobile}  true/fasle
  Future<bool> mobileAvailability(
    String? mobile,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/MobileAvailability/$mobile");
      if (res != null) {
        return res;
      }
    } catch (e) {
      log(e.toString());
      log("mobileAvailability========>$e");
    }
    return false;
  }

  // GET /api/Companies/CompanyIdByMobile/{Mobile}  ==> id 9699
  Future<String?> companyIdByMobile(
    String? mobile,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/CompanyIdByMobile/$mobile");
      if (res != null) {
        return res.toString();
      }
    } catch (e) {
      log(e.toString());
      log("companyIdByMobile========>$e");
    }
    return null;
  }

  // GET /api/Companies/SignIn/{Mobile}
  Future<SignIn?> newSignIn(
    String? mobile,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/SignIn/$mobile");
      if (res != null) {
        // log(res);
        return SignIn.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("newSignIn========>$e");
    }
    return null;
  }
}
