// ignore_for_file: unused_field, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/screens/dashboard/dashboard_controller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final DashboardController dashboardController = DashboardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Container(
        child: GestureDetector(
          onTap: () {
            dashboardController.increment();
          },
          child: Center(
            child: Obx(
              () => Text(
                'Dashboard${dashboardController.count}',
                style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
