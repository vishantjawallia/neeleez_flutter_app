import 'dart:io';

void main() async {
  final isDir = await checkDirExist();
  if (isDir == "exists") {
    await createScreen(widgetName: 'DashboardView');
    // await createViewModel(widgetName: 'DashboardViewModel');
    // await createViewModel(widgetName: 'DashboardViewModel');
  }
}

Future<String> checkDirExist() async {
  final myDir = Directory('dir');
  var isThere = await myDir.exists();
  // print(isThere ? 'exists' : 'non-existent');
  return isThere ? 'exists' : 'non-existent';
}

createViewModel({required String widgetName}) async {
  final String content = '''
import 'package:stacked/stacked.dart';

class $widgetName extends BaseViewModel {
  SupportViewModel(){
    loadItems();
  }
  
  // Add ViewModel specific code here
  Future<void> loadItems() async {
    setBusy(true);
    //Write your models loading codes here

    //Let other views to render again
    setBusy(false);
    notifyListeners();
  }

}
''';

  const filename = 'src/home/file.dart';
  await File(filename).writeAsString(content);
}

Future<void> createScreen({
  String? widgetName,
}) async {
  final String content = '''
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class $widgetName extends StatelessWidget {
  const $widgetName({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:  <Widget>[
          Text(
            '$widgetName',
            style: Get.textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
''';
  const filename = 'src/home/file.dart';
  await File(filename).writeAsString(content);
}








// void main() async {
//   // Creates dir/ and dir/subdir/.
//   var directory = await Directory('src/home').create(recursive: true);
//   print(directory.path);
// }
