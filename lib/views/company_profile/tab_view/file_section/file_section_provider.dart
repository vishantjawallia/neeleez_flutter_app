import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/api/apiRepository.dart';
import 'package:neeleez_flutter_app/config/config.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/models/company/company_profile.dart';

import 'widgets/select_file_poup.dart';
import 'widgets/warning_popup.dart';

class FileSectionProvider extends ChangeNotifier {
  File? file;
  List<CompanyImages>? imagesList;

  int? totalSize = 0;

  void loadItem(List<CompanyImages>? list) async {
    await Future.delayed(const Duration(milliseconds: 100));
    imagesList = list ?? [];
    totalSize = list?.map((e) => e.size!).toList().reduce((value, element) => value + element) ?? 0;
    notifyListeners();
  }

  void uploadFileHandler(_) {
    selectFilePopup(
      _,
      onVideoSelect: () async {
        Get.back();
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: [
              'mp4',
            ],
          );
          if (result != null) {
            PlatformFile file = result.files.first;
            Map<String, String> body = {
              "CompanyId": "73426",
              "ImageCategoryId": "4",
              "Title": file.path!.split('/').last,
              "IsMainImage": "false",
              "Priority": "0",
              "UserId": "0",
              "TeamUserId": "0",
            };
            await apiRepository.apiPostUploadFile("$baseUrl/api/CompanyImages", File(file.path!), body: body).then((value) {
              log(value.toString());
            });

            log(file.name);
          } else {
            // User canceled the picker
          }
        } catch (e) {
          log(e.toString());
        }
      },
      onImageSelect: () async {
        Get.back();
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpg', 'png'],
          );

          if (result != null) {
            PlatformFile file = result.files.first;
            Map<String, String> body = {
              "CompanyId": "73426",
              "ImageCategoryId": "4",
              "Title": file.path!.split('/').last,
              "IsMainImage": "false",
              "Priority": "0",
              "UserId": "0",
              "TeamUserId": "0",
            };
            await apiRepository.apiPostUploadFile("$baseUrl/api/CompanyImages", File(file.path!), body: body).then((value) {
              log(value.toString());
            });
          } else {
            // User canceled the picker
          }
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  void fileDeleteHandler(BuildContext _, int id) {
    deleteAlert(
      _,
      text: 'Do you really want to delete it?.',
      iconPath: MyIcon.popD,
      onYesTap: () {
        // Get.back();
      },
    );
  }

  /* -------------------------------- Api File Upload  ------------------------------- */
  static Future apiUploadFile(
    String? url, {
    File? file,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse(url!),
      );
      request.files.add(
        http.MultipartFile.fromBytes(
          'LogoFile',
          File(file!.path).readAsBytesSync(),
          filename: file.path,
        ),
      );
      log(request.headers.entries.toString());
      var response = await request.send();

      if (request.persistentConnection) {
        log(response.stream.toString());
      }
      response.stream.bytesToString().asStream().asBroadcastStream(
        onListen: (subscription) {
          subscription.onData((data) {
            log(data.toString());
          });
          subscription.onDone(() {
            log(subscription.toString());
          });
        },
      );
      if (response.statusCode == 200) {
        log(response.stream.toString());
        log('Image uploaded successfully');
      } else {
        log(response.contentLength.toString());
        log(response.headers.toString());
        log(response.persistentConnection.toString());
        log(response.isRedirect.toString());
        log(response.stream.toString());

        log('Image upload failed with status code ${response.statusCode}');
      }
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  /* -------------------------------- Api File Upload  ------------------------------- */
  static Future apiUploadFile2(
    String? url, {
    File? file,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    try {
      var stream = http.ByteStream(file!.openRead());
      // get file length
      // var length = await file.length(); //imageFile is your image file
      Map<String, String> headers = {
        'Content-Type': "application/json",
      };

      // string to uri
      var uri = Uri.parse(url!);

      // create multipart request
      var request = http.MultipartRequest("POST", uri);
      String name = file.path.split('/').last;
      // multipart that takes file
      var multipartFileSign = http.MultipartFile.fromBytes(
        'ImageFileName',
        File(file.path).readAsBytesSync(),
        filename: name,
      );

      // add file to multipart
      request.files.add(multipartFileSign);

      //add headers
      request.headers.addAll(headers);
      // request.fields.assignAll(body);

      //adding params
      request.fields['Companyld'] = jsonEncode(73426);
      request.fields['ImageCategoryld'] = jsonEncode(4);
      request.fields['Title'] = jsonEncode(name);
      request.fields['IsMainImage'] = jsonEncode(false);
      request.fields['Priority'] = jsonEncode(0);
      request.fields['Userld'] = jsonEncode(0);
      request.fields['TeamUserld'] = jsonEncode(0);
      jsonEncode(request.fields);
      // request.fields['lastName'] = 'efg';

      // send
      var response = await request.send();

      log(response.statusCode.toString());
      log(response.statusCode.toString());
      log(response.contentLength.toString());
      log(response.headers.toString());
      log(response.persistentConnection.toString());
      log(response.isRedirect.toString());
      log(response.stream.toString());

      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        log(value.toString());
        log(response.statusCode.toString());
        // log(response.contentLength.toString());
        // log(response.headers.toString());
        // log(response.persistentConnection.toString());
        // log(response.isRedirect.toString());
        // log(response.stream.toString());
        log(value);
      });
    } on SocketException catch (e) {
      log('$e');
      throw "no-internet";
    }
  }

  // var jj = {
  //   "Companyld": 73426,
  //   "ImageCategoryld": 4,
  //   "Title": "bb.png",
  //   "ImageFileName": File(''),
  //   "IsMainImage": false,
  //   "Priority": 0,
  //   "Userld": 0,
  //   "TeamUserld": 0,
  // };
}

// api Post upload file
Future apiPostNew(
  String? url, {
  bool? auth,
  File? file,
}) async {
  var bytes = file!.readAsBytesSync();
  Map<String, dynamic> body = {
    "Companyld": 73426,
    "ImageCategoryld": 4,
    "Title": "bb.png",
    "ImageFileName": bytes,
    "IsMainImage": false,
    "Priority": 0,
    "Userld": 0,
    "TeamUserld": 0,
  };
  try {
    final response = await http.post(
      Uri.parse(url!),
      headers: {
        "Content-Type": "multipart/form-data",
      },
      body: jsonEncode(body),
      encoding: Encoding.getByName("utf-8"),
    );
    // log(body.toString());
    log(response.statusCode.toString());
    log(response.body.toString());
    log(response.contentLength.toString());
    log(response.headers.toString());
    log(response.persistentConnection.toString());
    log(response.isRedirect.toString());
    // log(response.stream.toString());

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


// }
