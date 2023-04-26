import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';

class Redeemed extends StatelessWidget {
  const Redeemed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 100),
          child: Image.asset(
            MyImage.imgEmptyOffer,
            height: 135,
            fit: BoxFit.fill,
          ),
        ),
      ],
    ));
  }
}
