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
  //       return jsonDecode(response.body);
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
  //       return jsonDecode(response.body.toString());
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
    bool? isReturnResponse = false,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: jsonEncode(body!),
        // encoding: Encoding.getByName("utf-8"),
      );
      log(body.toString());
      log(response.statusCode.toString());
      log(response.bodyBytes.toString());
      log(response.contentLength.toString());
      log(response.headers.toString());
      log(response.isRedirect.toString());
      log(response.persistentConnection.toString());
      log(response.reasonPhrase.toString());
      log(response.request.toString());
      log(response.runtimeType.toString());
      log(response.body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (!isReturnResponse!) {
          return "Added";
        } else {
          return jsonDecode(response.body.toString());
        }
      } else if (response.statusCode == 401) {
        log(response.statusCode.toString());
        log(url.toString());
        final obj = jsonDecode(response.body);
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
        body: jsonEncode(body!),
      );
      log(body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401) {
        log(response.statusCode.toString());
        log(url.toString());
        final obj = jsonDecode(response.body);
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
  static Future apiPutWithDynamic(
    String? url,
    body, {
    bool? auth,
  }) async {
    try {
      final response = await http.put(
        Uri.parse(url!),
        headers: {
          'Content-Type': "application/json",
        },
        body: body,
      );
      log(body.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return jsonDecode(response.body.toString());
      } else if (response.statusCode == 401) {
        log(response.statusCode.toString());
        log(url.toString());
        final obj = jsonDecode(response.body);
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
        return jsonDecode(response.body);
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
  static Future<bool> apiDelete(
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
      );
      if (response.statusCode == 204 || response.statusCode == 200) {
        return true;
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
    return false;
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
          'content-type': "application/json",
          'accept': "application/json",
        },
        body: jsonEncode(body),
      );
      log(response.statusCode.toString());
      log(response.bodyBytes.toString());
      log(response.contentLength.toString());
      log(response.headers.toString());
      log(response.isRedirect.toString());
      log(response.persistentConnection.toString());
      log(response.reasonPhrase.toString());
      log(response.request.toString());
      log(response.runtimeType.toString());
      log(response.body.toString());
      // log(response.persistentConnection.toString());
      if (response.statusCode == 200) {
        return jsonDecode(response.body.toString());
      }
      // } else {
      //   log(response.statusCode.toString());
      //   log(response.body.toString());
      //   log(response.headers.toString());
      //   log(response.reasonPhrase.toString());
      //   log(response.request.toString());
      //   log(response.reasonPhrase.toString());
      //   // throw "api-error";
      // }
    } on SocketException catch (e) {
      log('$e');
      log(e.runtimeType.toString());
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
        body: jsonEncode(body ?? {}),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body.toString());
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
  static Future apiUploadFile(
    String? url, {
    File? file,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url!),
      );
      // request.files.add(
      //   await http.MultipartFile.fromPath('image', file!.path),
      // );
      var imagePart = http.MultipartFile(
        'LogoFile',
        file!.readAsBytes().asStream(),
        file.lengthSync(),
        filename: file.path.split('/').last,
      );
      request.files.add(imagePart);

      var response = await request.send();
      if (request.persistentConnection) {
        log(response.stream.toString());
      }
      response.stream.bytesToString().asStream().asBroadcastStream(
        onListen: (subscription) {
          subscription.onData((data) {
            log(data.toString());
          });
        },
      );
      if (response.statusCode == 200) {
        // response.stream.bytesToString().then((value) => log(value.toString()));
        // response.stream.bytesToString().asStream().asBroadcastStream(
        // response.stream.bytesToString().then((value) => log(value.toString()));
        //   onListen: (subscription) {
        //     subscription.onData((data) {
        //       log(data.toString());
        //     });
        //   },
        // );
        log(response.stream.toString());
        log('Image uploaded successfully');
      } else {
        // response.stream.bytesToString().then((value) => log(value.toString()));
        // response.stream.bytesToString().asStream().asBroadcastStream(
        //   onListen: (subscription) {
        //     subscription.onData((data) {
        //       log(data.toString());
        //     });
        //   },
        // );
        log(response.contentLength.toString());
        log(response.headers.toString());
        log(response.persistentConnection.toString());
        log(response.isRedirect.toString());
        log(response.stream.toString());
        // log(response..toString());
        log('Image upload failed with status code ${response.statusCode}');
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  // /* -------------------------------- Api File Upload  ------------------------------- */
  static Future apiPostUploadFile(
    String? url,
    File? file, {
    required Map<String, String>? body,
  }) async {
    try {
      // Map<String, String> requestBody = {
      //   "CompanyId": "73426",
      //   "ImageCategoryId": "4",
      //   "Title": file!.path.split('/').last,
      //   "IsMainImage": "false",
      //   "Priority": "0",
      //   "UserId": "0",
      //   "TeamUserId": "0",
      // };
      log(body.toString());
      Map<String, String> headers = <String, String>{
        "Content-Type": "multipart/form-data",
      };
      log(file!.path.split('/').last);
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url!),
      )
        ..headers.addAll(headers)
        ..files.add(
          http.MultipartFile.fromBytes(
            'ImageFileName',
            file.readAsBytesSync(),
            filename: file.path.split('/').last,
          ),
        )
        ..fields.addAll(body!);
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return respStr;
      } else if (response.statusCode == 404) {
        if (respStr == "File Not Found or filesize is more then 500 KB.") {
          return "file-error";
        }
      } else {
        log(respStr.toString());
        log(body.toString());
        log(response.statusCode.toString());
        log(response.contentLength.toString());
        log(response.headers.toString());
        log(response.persistentConnection.toString());
        log(response.isRedirect.toString());
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
    // static Future<String> apiUploadFile(
    //   String? url, {
    //   File? file,
    // }) async {
    //   log(url.toString());
    //   final bytes = await file!.readAsBytes();
    //   try {
    //     final response = await http.post(
    //       Uri.parse(url!),
    //       headers: {
    //         'Content-Type': "multipart/form-data",
    //         'Accept': '*/*',
    //       },
    //       body: bytes,
    //     );
    //     if (response.persistentConnection) {
    //       log(response.body.toString());
    //       log(response.bodyBytes.toString());
    //     }
    //     if (response.statusCode == 200) {
    //       log(response.body.toString());
    //       return "'File uploaded successfully";
    //     } else {
    //       log(response.bodyBytes.toString());
    //       log(response.body.toString());
    //       log(response.statusCode.toString());
    //       log(response.headers.toString());
    //       log(response.isRedirect.toString());
    //       log(response.persistentConnection.toString());
    //       log(response.persistentConnection.toString());
    //       log(response.reasonPhrase.toString());
    //       log(response.request.toString());

    //       throw Exception('Failed to upload file');
    //     }
    //   } on SocketException catch (e) {
    //     log('$e');
    //     throw "no-internet";
    //   }
    // }
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
}
