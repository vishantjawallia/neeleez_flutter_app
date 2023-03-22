library on_boarding_1_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'on_boarding_1_view_model.dart';

part 'on_boarding_1_mobile.dart';
part 'on_boarding_1_tablet.dart';
part 'on_boarding_1_desktop.dart';

// ignore: must_be_immutable
class OnBoarding1View extends StatelessWidget {
  static const routeName = '/on_boarding_1';

  const OnBoarding1View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoarding1ViewModel>.reactive(
      viewModelBuilder: () => OnBoarding1ViewModel(),
      onViewModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (_, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_)=>_OnBoarding1Mobile(viewModel),
          desktop:(_)=> _OnBoarding1Mobile(viewModel),
          tablet: (_)=>_OnBoarding1Mobile(viewModel),
        );
      }
    );
  }
}