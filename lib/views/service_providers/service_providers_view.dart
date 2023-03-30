library service_providers_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'service_providers_view_model.dart';

part 'service_providers_mobile.dart';
part 'service_providers_tablet.dart';
part 'service_providers_desktop.dart';

// ignore: must_be_immutable
class ServiceProvidersView extends StatelessWidget {
  static const routeName = '/service_providers';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceProvidersViewModel>.reactive(
      viewModelBuilder: () => ServiceProvidersViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ServiceProvidersMobile(viewModel),
          desktop: _ServiceProvidersMobile(viewModel),
          tablet: _ServiceProvidersMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _ServiceProvidersDesktop(viewModel),
          //tablet: _ServiceProvidersTablet(viewModel),  
        );
      }
    );
  }
}