import 'dart:developer';

import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/models/ips_model/ip_api.dart';
import 'package:neeleez_flutter_app/models/ips_model/ip_info.dart';
import 'package:neeleez_flutter_app/models/ips_model/ip_whois.dart';

import '../../../models/country_detail.dart';
import '../../../models/ips_model/ip_base.dart';
import '../../../models/ips_model/ip_list.dart';

mixin SplashService {
  // Country Detail => GET => /api/Countries/IN
  Future<CountryDetail?> getCountryDetail(
    String countryCode,
  ) async {
    try {
      final res = await apiRepository.apiGet('$baseUrl/api/Countries/$countryCode');
      if (res != null) {
        return CountryDetail.fromJson(res);
      }
    } catch (e) {
      log("getCountryDetail=>>>>>>>>>$e");
    }
    return null;
  }

  // http://ipinfo.io?token=b883411df4c0d8
  Future<IpInfo?> getIpInfo() async {
    try {
      final res = await apiRepository.apiGet('http://ipinfo.io?token=b883411df4c0d8');
      if (res != null) {
        return IpInfo.fromJson(res);
      }
    } catch (e) {
      log("getIpInfo=>>>>>>>>>$e");
    }
    return null;
  }

  // http://ip-api.com/json/
  Future<IpApiModel?> getIpApi() async {
    try {
      final res = await apiRepository.apiGet('http://ip-api.com/json/');
      if (res != null) {
        return IpApiModel.fromJson(res);
      }
    } catch (e) {
      log("getIpApi=>>>>>>>>>$e");
    }
    return null;
  }

  // https://api.freegeoip.app/json/?apikey=fabe2610-4a9b-11ec-b323-c73b5ea5d95b
  Future<IpBase?> getIpBase() async {
    try {
      final res = await apiRepository.apiGet('https://api.freegeoip.app/json/?apikey=fabe2610-4a9b-11ec-b323-c73b5ea5d95b');
      if (res != null) {
        return IpBase.fromJson(res);
      }
    } catch (e) {
      log("getIpBase=>>>>>>>>>$e");
    }
    return null;
  }

  // https://ipwhois.app/json/
  Future<IpWhois?> getIpWhois() async {
    try {
      final res = await apiRepository.apiGet('https://ipwhois.app/json/');
      if (res != null) {
        return IpWhois.fromJson(res);
      }
    } catch (e) {
      log("getIpWhois=>>>>>>>>>$e");
    }
    return null;
  }

  // https://iplist.cc/api/
  Future<IpListModel?> getIpList() async {
    try {
      final res = await apiRepository.apiGet('https://iplist.cc/api/');
      if (res != null) {
        return IpListModel.fromJson(res);
      }
    } catch (e) {
      log("getIpList=>>>>>>>>>$e");
    }
    return null;
  }
}
