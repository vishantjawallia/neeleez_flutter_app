// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/screens/dashboard/widgets/drawer.dart';
// import 'package:neeleez_flutter_app/screens/dashboard/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  // final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEnableOpenDragGesture: true,
      body: Container(
        child: GestureDetector(
          onTap: () {
            try {
              _scaffoldKey.currentState!.openDrawer();
            } catch (e) {
              Get.log("$e");
            }
          },
          child: Center(
            child: Text(
              'Dashboard',
              style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
            ),
          ),
        ),
      ),
    );
  }
}
