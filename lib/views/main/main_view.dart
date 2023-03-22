library main_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'main_view_model.dart';

part 'main_mobile.dart';
part 'main_tablet.dart';
part 'main_desktop.dart';

// ignore: must_be_immutable
class MainView extends StatelessWidget {
  static const routeName = '/main';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      viewModelBuilder: () => MainViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _MainMobile(viewModel),
          desktop: _MainMobile(viewModel),
          tablet: _MainMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _MainDesktop(viewModel),
          //tablet: _MainTablet(viewModel),  
        );
      }
    );
  }
}