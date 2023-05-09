import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/models/company/company_profile.dart';

import 'widgets/select_file_poup.dart';
import 'widgets/warning_popup.dart';

class FileSectionProvider extends ChangeNotifier {
  File? file;
  List<CompanyImages>? imagesList;

  int? totalSize = 0;

  void loadItem(List<CompanyImages> list) {
    imagesList = list;
    totalSize = list.map((e) => e.size!).toList().reduce((value, element) => value + element);
    notifyListeners();
  }

  void uploadFileHandler(_) {
    selectFilePopup(
      _,
      onVideoSelect: () async {
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: [
              'mp4',
            ],
          );
          if (result != null) {
            PlatformFile file = result.files.first;

            log(file.name);
            // log(file.bytes);
            // log(file.size);
            // log(file.extension);
            // log(file.path);
          } else {
            // User canceled the picker
          }
        } catch (e) {
          log(e.toString());
        }
      },
      onImageSelect: () async {
        try {
          FilePickerResult? result = await FilePicker.platform.pickFiles(
            type: FileType.custom,
            allowedExtensions: ['jpg', 'png'],
          );

          if (result != null) {
            PlatformFile file = result.files.first;
            log(file.name);
            // log(file.bytes.toString());
            // log(file.size.t);
            // log(file.extension);
            // log(file.path);
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
}
