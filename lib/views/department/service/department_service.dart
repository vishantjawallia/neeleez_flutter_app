import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';

import '../../../config/config.dart';
import '../../../models/department/department.dart';

mixin DepartmentService {
  Future<List<Department>?> getDepartment(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Department/$companyId");
      log(res.toString());
      if (res != null) {
        return Department.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getDepartment========>$e");
    }
    return null;
  }

  Future<bool> postDepartment(
    int? depId,
    String? name,
    String? nameAr,
    int? companyId,
    bool? isActive,
    String? stateDate,
    int? userId,
    int? companyUserId,
  ) async {
    Map<String, dynamic> body = {
      "depId": depId,
      "name": name,
      "nameAr": nameAr,
      "companyId": companyId,
      "isActive": isActive,
      "stateDate": stateDate,
      "userId": userId,
      "companyUserId": companyUserId,
    };
    try {
      final res = await apiRepository.apiPost("$baseUrl/api/Department", body);
      log(res.toString());
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("getDepartment========>$e");
    }
    return false;
  }

  Future<bool> putDepartment(
    int? depId,
    String? name,
    String? nameAr,
    int? companyId,
    bool? isActive,
    String? stateDate,
    int? userId,
    int? companyUserId,
  ) async {
    Map<String, dynamic> body = {
      "depId": depId,
      "name": name,
      "nameAr": nameAr,
      "companyId": companyId,
      "isActive": isActive,
      "stateDate": stateDate,
      "userId": userId,
      "companyUserId": companyUserId,
    };
    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Department/$depId", body);
      log(res.toString());
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("getDepartment========>$e");
    }
    return false;
  }
}
