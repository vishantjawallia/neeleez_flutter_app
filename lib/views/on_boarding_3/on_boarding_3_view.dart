library on_boarding_3_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helper/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'on_boarding_3_view_model.dart';

part 'on_boarding_3_mobile.dart';
part 'on_boarding_3_tablet.dart';
part 'on_boarding_3_desktop.dart';

// ignore: must_be_immutable
class OnBoarding3View extends StatelessWidget {
  static const routeName = '/on_boarding_3';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoarding3ViewModel>.reactive(
      viewModelBuilder: () => OnBoarding3ViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _OnBoarding3Mobile(viewModel),
          desktop: _OnBoarding3Mobile(viewModel),
          tablet: _OnBoarding3Mobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _OnBoarding3Desktop(viewModel),
          //tablet: _OnBoarding3Tablet(viewModel),  
        );
      }
    );
  }
}