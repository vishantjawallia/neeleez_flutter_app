// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';

class Activated extends StatelessWidget {
  const Activated({Key? key}) : super(key: key);

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
      ),
    );
  }
}
