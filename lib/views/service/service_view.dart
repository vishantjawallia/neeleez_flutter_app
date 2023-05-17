library service_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'service_view_model.dart';

part 'service_mobile.dart';
part 'service_tablet.dart';
part 'service_desktop.dart';

// ignore: must_be_immutable
class ServiceView extends StatelessWidget {
  static const routeName = '/service';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceViewModel>.reactive(
      viewModelBuilder: () => ServiceViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ServiceMobile(viewModel),
          desktop: _ServiceMobile(viewModel),
          tablet: _ServiceMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _ServiceDesktop(viewModel),
          //tablet: _ServiceTablet(viewModel),  
        );
      }
    );
  }
}