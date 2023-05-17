library service_format_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'service_format_view_model.dart';

part 'service_format_mobile.dart';
part 'service_format_tablet.dart';
part 'service_format_desktop.dart';

// ignore: must_be_immutable
class ServiceFormatView extends StatelessWidget {
  static const routeName = '/service_format';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceFormatViewModel>.reactive(
      viewModelBuilder: () => ServiceFormatViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ServiceFormatMobile(viewModel),
          desktop: _ServiceFormatMobile(viewModel),
          tablet: _ServiceFormatMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _ServiceFormatDesktop(viewModel),
          //tablet: _ServiceFormatTablet(viewModel),  
        );
      }
    );
  }
}