library on_boarding_3_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
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

  const OnBoarding3View({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnBoarding3ViewModel>.reactive(
        viewModelBuilder: () => OnBoarding3ViewModel(),
        onViewModelReady: (viewModel) async {
          await precacheImage(const AssetImage(MyImage.onBoarding3), context);
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _OnBoarding3Mobile(viewModel),
            desktop: (_) => _OnBoarding3Mobile(viewModel),
            tablet: (_) => _OnBoarding3Mobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _OnBoarding3Desktop(viewModel),
            //tablet: _OnBoarding3Tablet(viewModel),
          );
        });
  }
}
