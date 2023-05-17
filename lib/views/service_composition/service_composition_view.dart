library service_composition_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'service_composition_view_model.dart';

part 'service_composition_mobile.dart';
part 'service_composition_tablet.dart';
part 'service_composition_desktop.dart';

// ignore: must_be_immutable
class ServiceCompositionView extends StatelessWidget {
  static const routeName = '/service_composition';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceCompositionViewModel>.reactive(
      viewModelBuilder: () => ServiceCompositionViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ServiceCompositionMobile(viewModel),
          desktop: _ServiceCompositionMobile(viewModel),
          tablet: _ServiceCompositionMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _ServiceCompositionDesktop(viewModel),
          //tablet: _ServiceCompositionTablet(viewModel),  
        );
      }
    );
  }
}