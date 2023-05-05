import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'widgets/select_file_poup.dart';

class FileSectionProvider extends ChangeNotifier {
  File? file;

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

            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
          } else {
            // User canceled the picker
          }
        } catch (e) {
          print(e);
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

            print(file.name);
            print(file.bytes);
            print(file.size);
            print(file.extension);
            print(file.path);
          } else {
            // User canceled the picker
          }
        } catch (e) {
          print(e);
        }
      },
    );
  }
}
