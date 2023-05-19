import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/widgets/new.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({Key? key}) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  double w = 400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text(
              'Selected Item:',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 20),
            SelectDropList(
              value: 'Option 1',
              items: const [
                'Option 1',
                'Option 2',
                'Option 3',
                'Option 4',
              ],
              onTap: (value) {},
            ),
            Container(
              width: w,
              // height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: DropdownButton<String>(
                // value: ,
                isExpanded: true,
                // isDense: true,
                menuMaxHeight: 200,

                // itemHeight: 200,

                icon: const Icon(Icons.arrow_drop_down),
                iconSize: 24,
                elevation: 17,
                onTap: () {
                  setState(() {
                    w = w - 40;
                  });
                },
                style: const TextStyle(color: Colors.black, fontSize: 18),
                // underline: Container(
                //   height: 2,
                //   color: Colors.deepPurpleAccent,
                // ),

                onChanged: (String? newValue) {},
                // selectedItemBuilder: (context) {
                //   return [
                //     'Option 1',
                //     'Option 2',
                //     'Option 3',
                //     'Option 4',
                //   ].map<Widget>((String item) {
                //     return Container(
                //       alignment: Alignment.centerRight,
                //       width: 180,
                //       child: Text(item, textAlign: TextAlign.end),
                //     );
                //   }).toList();
                // },
                items: [
                  'Option 1',
                  'Option 2',
                  'Option 3',
                  'Option 4',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Container(
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
