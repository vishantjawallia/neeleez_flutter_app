import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';

import '../../../models/package/company_active_package.dart';

mixin PackageSubscriptionsService {
  Future<CompanyActivePackage?> generalInformationWithCompanyId(
    String? companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Companies/CompanyActivePackage/$companyId");
      if (res != null) {
        return CompanyActivePackage.fromJson(res);
      }
    } catch (e) {
      log(e.toString());
      log("generalInformationWithCompanyId========>$e");
    }
    return null;
  }
}
