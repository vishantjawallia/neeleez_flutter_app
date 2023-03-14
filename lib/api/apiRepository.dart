import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class apiRepository {
  apiRepository._();

  /* -------------------------------- Api Post ------------------------------- */
  static Future apiPost(Map? data, String? url, bool? auth) async {
    try {
      final response = await http.post(
        Uri.parse(url!),
        headers: {'Content-Type': "application/json"},
        body: jsonEncode(data),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.statusCode.toString());
        log(url.toString());
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }

  /* -------------------------------- Api Get ------------------------------- */
  static Future apiGet(String? url, bool? auth) async {
    try {
      final response = await http.get(
        Uri.parse(url!),
        headers: {'Content-Type': "application/json"},
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.statusCode.toString());
        log(url.toString());
        return;
      }
    } on SocketException catch (e) {
      log('$e');
    }
  }
}
