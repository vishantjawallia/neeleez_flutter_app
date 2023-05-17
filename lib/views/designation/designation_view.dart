library designation_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'designation_view_model.dart';

part 'designation_mobile.dart';
part 'designation_tablet.dart';
part 'designation_desktop.dart';

// ignore: must_be_immutable
class DesignationView extends StatelessWidget {
  static const routeName = '/designation';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DesignationViewModel>.reactive(
      viewModelBuilder: () => DesignationViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _DesignationMobile(viewModel),
          desktop: _DesignationMobile(viewModel),
          tablet: _DesignationMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _DesignationDesktop(viewModel),
          //tablet: _DesignationTablet(viewModel),  
        );
      }
    );
  }
}