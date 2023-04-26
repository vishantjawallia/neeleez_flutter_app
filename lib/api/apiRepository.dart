import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

class apiRepository {
  apiRepository._();

  // /* -------------------------------- Api Post ------------------------------- */
  // static Future apiPost(Map? data, String? url, {bool? auth, Map? params}) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(url!),
  //       headers: {'Content-Type': "application/json"},
  //       body: jsonEncode(data),
  //     );
  //     if (response.statusCode == 200) {
  //       return json.decode(response.body);
  //     } else {
  //       log(response.statusCode.toString());
  //       log(url.toString());
  //       // return;
  //       throw "api-error";
  //     }
  //   } on SocketException catch (e) {
  //     log('$e');
  //     throw "no-internet";
  //   }
  // }

  // /* -------------------------------- Api Get ------------------------------- */
  // static Future apiGet({String? url, bool? auth, Uri? uri}) async {
  //   log(url.toString());
  //   try {
  //     final response = await http.get(
  //       Uri.parse(Uri.encodeFull(url!)),
  //       headers: {
  //         'Content-Type': "application/json",
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       return json.decode(response.body.toString());
  //     } else {
  //       log(response.statusCode.toString());
  //       log(response.body.toString());
  //       // log(response.);
  //       log(uri!.pathSegments.toString());
  //       log(uri.path.toString());
  //       log(uri.toString());
  //       log(url.toString());
  //       // return;
  //       return null;
  //       // throw "api-error";
  //     }
  //   } on SocketException catch (e) {
  //     log('$e');
  //     throw "no-internet";
  //   }
  // }

  /* -------------------------------- Api Post ------------------------------- */
  static Future apiPost(
    String? url,
    Map<String, dynamic>? body, {
    bool? auth,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode(body!),
      );
      log(body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else if (response.statusCode == 401) {
        log(response.statusCode.toString());
        log(url.toString());
        final obj = json.decode(response.body);
        throw obj['detail'];
      } else {
        // log(response.bodyBytes.toString());
        log(response.statusCode.toString());
        // log(response.body.toString());
        log(url.toString());
        throw "Exception-Occurred";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api Get ------------------------------- */
  static Future apiGet(
    String? url, {
    bool? auth,
  }) async {
    log(url.toString());
    try {
      final response = await http.get(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        throw "api-error";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api Delete ------------------------------- */
  static Future<bool?> apiDelete(
    String? url, {
    Map<String, dynamic>? body,
    bool? auth,
  }) async {
    log(url.toString());
    try {
      final response = await http.delete(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode(body ?? {}),
      );
      if (response.statusCode == 204) {
        return true;
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
    return null;
  }

  /* -------------------------------- Api Put ------------------------------- */
  static Future apiPut(
    String? url,
    Map<String, dynamic>? body, {
    bool? auth,
  }) async {
    log(url.toString());
    try {
      final response = await http.put(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode(body!),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        log(url.toString());
        throw "api-error";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api Patch ------------------------------- */
  static Future apiPatch(
    String? url, {
    bool? auth,
    Map<String, dynamic>? body,
  }) async {
    log(url.toString());
    try {
      final response = await http.patch(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: json.encode(body ?? {}),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());

        throw "api-error";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }
}
