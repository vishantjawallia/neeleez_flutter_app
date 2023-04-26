library package_order_summary_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'package_order_summary_view_model.dart';

part 'package_order_summary_mobile.dart';
part 'package_order_summary_tablet.dart';
part 'package_order_summary_desktop.dart';

// ignore: must_be_immutable
class PackageOrderSummaryView extends StatelessWidget {
  static const routeName = '/package_order_summary';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PackageOrderSummaryViewModel>.reactive(
      viewModelBuilder: () => PackageOrderSummaryViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _PackageOrderSummaryMobile(viewModel),
          desktop: _PackageOrderSummaryMobile(viewModel),
          tablet: _PackageOrderSummaryMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _PackageOrderSummaryDesktop(viewModel),
          //tablet: _PackageOrderSummaryTablet(viewModel),  
        );
      }
    );
  }
}