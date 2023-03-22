library on_boarding_2_view;

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'on_boarding_2_view_model.dart';

part 'on_boarding_2_mobile.dart';
part 'on_boarding_2_tablet.dart';
part 'on_boarding_2_desktop.dart';

// ignore: must_be_immutable
class OnBoarding2View extends StatelessWidget {
  static const routeName = '/on_boarding_2';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoarding2ViewModel>.reactive(
        viewModelBuilder: () => OnBoarding2ViewModel(),
        onViewModelReady: (viewModel) {
          precacheImage(const AssetImage(MyImage.onBoarding2), context);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_)=>_OnBoarding2Mobile(viewModel),
            desktop:(_)=>_OnBoarding2Mobile(viewModel),
            tablet: (_)=>_OnBoarding2Mobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _OnBoarding2Desktop(viewModel),
            //tablet: _OnBoarding2Tablet(viewModel),
          );
        });
  }
}
