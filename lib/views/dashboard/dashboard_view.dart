library dashboard_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/palettes.dart';
import 'dashboard_view_model.dart';
import 'widgets/drawer.dart';

part 'dashboard_mobile.dart';
part 'dashboard_tablet.dart';
part 'dashboard_desktop.dart';

// ignore: must_be_immutable
class DashboardView extends StatelessWidget {
  static const routeName = '/dashboard';

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        onViewModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _DashboardMobile(viewModel),
            desktop: (_) => _DashboardMobile(viewModel),
            tablet: (_) => _DashboardMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _DashboardDesktop(viewModel),
            //tablet: _DashboardTablet(viewModel),
          );
        });
  }
}
