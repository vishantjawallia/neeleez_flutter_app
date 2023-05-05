import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';

Future<Future<Object?>> countrySelectDialog(
  _, {
  List? list,
  Function(dynamic value)? onSubmit,
}) async {
  return showGeneralDialog(
    context: _,
    barrierDismissible: false,
    barrierColor: Palettes.black.withOpacity(0.55),
    pageBuilder: (ctx, a1, a2) => Container(),
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeOutBack.transform(a1.value);
      return GestureDetector(
        onTap: () => Get.back(),
        child: Transform.scale(
          scale: curve,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                height: 516,
                width: 300,
                color: Palettes.white,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                        bottom: BorderSide(color: Palettes.grey1, width: 0.5),
                      )),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        child: Text(
                          'Select Country',
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        child: CupertinoPicker(
                          magnification: 1.22,
                          squeeze: 1.2,
                          useMagnifier: true,
                          itemExtent: _kItemExtent,
                          onSelectedItemChanged: (int selectedItem) {
                            log(selectedItem.toString());
                          },
                          children: List<Widget>.generate(_fruitNames.length, (int index) {
                            return Center(
                              child: Text(
                                _fruitNames[index],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Palettes.grey1, width: 0.5),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text(
                                'CANCEL ',
                                style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 6),
                            TextButton(
                              onPressed: () => onSubmit!(null),
                              child: Text(
                                'OK',
                                style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 350),
  );
}

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

// void main() => runApp(const CupertinoPickerApp());

class CupertinoPickerApp extends StatelessWidget {
  const CupertinoPickerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: CupertinoPickerExample(),
    );
  }
}

class CupertinoPickerExample extends StatefulWidget {
  const CupertinoPickerExample({super.key});

  @override
  State<CupertinoPickerExample> createState() => _CupertinoPickerExampleState();
}

class _CupertinoPickerExampleState extends State<CupertinoPickerExample> {
  int _selectedFruit = 0;

  // This shows a CupertinoModalPopup with a reasonable fixed height which hosts CupertinoPicker.
  void _showDialog() {
    showCupertinoModalPopup<void>(
      // backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) => Center(
        child: Container(
          height: 516,
          width: 300,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: Scaffold(
              body: Column(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: Palettes.grey1, width: 0.5),
                    )),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text(
                        'Select Country',
                        style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Flexible(
                    child: SizedBox(
                      child: CupertinoPicker(
                        magnification: 1.22,
                        squeeze: 1.2,
                        useMagnifier: true,
                        itemExtent: _kItemExtent,
                        onSelectedItemChanged: (int selectedItem) {
                          setState(() {
                            _selectedFruit = selectedItem;
                          });
                        },
                        children: List<Widget>.generate(_fruitNames.length, (int index) {
                          return Center(
                            child: Text(
                              _fruitNames[index],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Palettes.grey1, width: 0.5),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'CANCEL ',
                            style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            'OK',
                            style: Get.textTheme.titleLarge!.copyWith(color: Palettes.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // backgroundColor: Colors.transparent,
      navigationBar: const CupertinoNavigationBar(
        middle: Text('CupertinoPicker Sample'),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: DefaultTextStyle(
          style: TextStyle(
            color: CupertinoColors.label.resolveFrom(context),
            fontSize: 22.0,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Selected fruit: '),
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  // Display a CupertinoPicker with list of fruits.
                  onPressed: () => countrySelectDialog(context),
                  // This displays the selected fruit name.
                  child: Text(
                    _fruitNames[_selectedFruit],
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
