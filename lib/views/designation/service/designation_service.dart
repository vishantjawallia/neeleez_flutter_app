import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';

import '../../../config/config.dart';
import '../../../models/designation/designation.dart';

mixin DesignationService {


  Future<List<Designation>?> getDesignationList(
    String companyId,
  ) async {
    try {
      final res = await apiRepository.apiGet("$baseUrl/api/Designation/$companyId");
      log(res.toString());
      if (res != null) {
        return Designation.fromJsonList(res);
      }
    } catch (e) {
      log(e.toString());
      log("getDesignation========>$e");
    }
    return null;
  }

  Future<bool> postDesignation(
    int? id,
    int companyId,
    String? designationEn,
    String? designationAr,
    String? remarks,
    String? stateDate,
    bool? isActive,
    int? userId,
    int? companyUsetId,
  ) async {
    Map<String, dynamic> body = {
      "id": id,
      "companyId": companyId,
      "designationEn": designationEn,
      "designationAr": designationAr,
      "remarks": remarks,
      "stateDate": stateDate,
      "isActive": isActive,
      "userId": userId,
      "companyUsetId": companyUsetId,
    };
    try {
      final res = await apiRepository.apiPost("$baseUrl/api/Designation/", body);
      log(res.toString());
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("getDesignation========>$e");
    }
    return false;
  }

  Future<bool> putDesignation(
    String designationId,
    int? id,
    int companyId,
    String? designationEn,
    String? designationAr,
    String? remarks,
    String? stateDate,
    bool? isActive,
    int? userId,
    int? companyUsetId,
  ) async {
    Map<String, dynamic> body = {
      "id": id,
      "companyId": companyId,
      "designationEn": designationEn,
      "designationAr": designationAr,
      "remarks": remarks,
      "stateDate": stateDate,
      "isActive": isActive,
      "userId": userId,
      "companyUsetId": companyUsetId,
    };
    try {
      final res = await apiRepository.apiPut("$baseUrl/api/Designation/$designationId", body);
      log(res.toString());
      if (res != null) {
        return true;
      }
    } catch (e) {
      log(e.toString());
      log("getDesignation========>$e");
    }
    return false;
  }
}
