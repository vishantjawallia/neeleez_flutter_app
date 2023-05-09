import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:neeleez_flutter_app/helpers/helper.dart';

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
        log(response.statusCode.toString());
        log(url.toString());
        throw "Exception-Occurred";
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api Post With Dynamic Body------------------------------- */
  static Future apiPostWithDynamic(
    String? url,
    dynamic body, {
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
        log(response.statusCode.toString());
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
        return json.decode(response.body);
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
    String url,
    Map<String, dynamic> body, {
    bool? auth,
  }) async {
    Helper.mapLoop(body);
    log(body.toString());
    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {
          // 'Content-Type': "application/json",
          "Content-type": "multipart/form-data"
          // "accept": "*/*",
        },
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        return json.decode(response.body.toString());
      } else {
        log(response.statusCode.toString());
        log(response.body.toString());
        log(response.headers.toString());
        log(response.reasonPhrase.toString());
        log(response.request.toString());
        log(response.reasonPhrase.toString());
        // throw "api-error";
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

  /* -------------------------------- Api File Upload  ------------------------------- */
  static Future<String> apiUploadFile(
    String? url, {
    bool? auth,
    File? file,
  }) async {
    log(url.toString());
    final bytes = await file!.readAsBytes();
    try {
      final response = await http.post(
        Uri.parse(url!),
        headers: {'Content-Type': "application/json"},
        body: bytes,
      );
      if (response.statusCode == 200) {
        return "'File uploaded successfully";
      } else {
        throw Exception('Failed to upload file');
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }
}


//  {
//  "email" : "vishant@gmail.com",
//  "genderId" : 2,
//  "mobile" : "string",
//  "nameEn" : "vishant",
//  "nameAr" : "string",
//  "logo" : "string",
//  "isFreeLancer" : "false",
//  "businessServiceId" : 4,
//  "tagLine" : "vishant jawalliia",
//  "edate" : "01/01/2021",
//  "whatsapp" : "918054738366",
//  "tel1" : "8054738366",
//  "url" : "www.vishant.com",
//  "tel2" : "string",
//  "aboutUs" : "hello",
//  "taxNumber" : "string",
//  "companyBusinessTypes" : [{btypeId: 13}, {btypeId: 14}],
//  "companyAmenity" : [{amenityId: 85}, {amenityId: 81}, {amenityId: 3}]
//  }