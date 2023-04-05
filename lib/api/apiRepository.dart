import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class apiRepository {
  apiRepository._();

  /* -------------------------------- Api Post ------------------------------- */
  static Future apiPost(Map? data, String? url, {bool? auth, Map? params}) async {
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
        // return;
        throw "api-error";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api Get ------------------------------- */
  static Future apiGet({String? url, bool? auth, Uri? uri}) async {
    log(url.toString());
    try {
      final response = await http.get(
        Uri.parse(Uri.encodeFull(url!)),
        headers: {
          'Content-Type': "application/json",
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        // log(response.);
        log(uri!.pathSegments.toString());
        log(uri.path.toString());
        log(uri.toString());
        log(url.toString());
        // return;
        return null;
        // throw "api-error";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }
}
