library appointments_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'appointments_view_model.dart';

part 'appointments_mobile.dart';
part 'appointments_tablet.dart';
part 'appointments_desktop.dart';

// ignore: must_be_immutable
class AppointmentsView extends StatelessWidget {
  static const routeName = '/appointments';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppointmentsViewModel>.reactive(
      viewModelBuilder: () => AppointmentsViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _AppointmentsMobile(viewModel),
          desktop: _AppointmentsMobile(viewModel),
          tablet: _AppointmentsMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _AppointmentsDesktop(viewModel),
          //tablet: _AppointmentsTablet(viewModel),  
        );
      }
    );
  }
}