library data_listing_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'data_listing_view_model.dart';

part 'data_listing_mobile.dart';
part 'data_listing_tablet.dart';
part 'data_listing_desktop.dart';

// ignore: must_be_immutable
class DataListingView extends StatelessWidget {
  static const routeName = '/data_listing';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataListingViewModel>.reactive(
      viewModelBuilder: () => DataListingViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _DataListingMobile(viewModel),
          desktop: _DataListingMobile(viewModel),
          tablet: _DataListingMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _DataListingDesktop(viewModel),
          //tablet: _DataListingTablet(viewModel),  
        );
      }
    );
  }
}