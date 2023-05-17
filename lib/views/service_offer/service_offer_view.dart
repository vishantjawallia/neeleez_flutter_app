library service_offer_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'service_offer_view_model.dart';

part 'service_offer_mobile.dart';
part 'service_offer_tablet.dart';
part 'service_offer_desktop.dart';

// ignore: must_be_immutable
class ServiceOfferView extends StatelessWidget {
  static const routeName = '/service_offer';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ServiceOfferViewModel>.reactive(
      viewModelBuilder: () => ServiceOfferViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ServiceOfferMobile(viewModel),
          desktop: _ServiceOfferMobile(viewModel),
          tablet: _ServiceOfferMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _ServiceOfferDesktop(viewModel),
          //tablet: _ServiceOfferTablet(viewModel),  
        );
      }
    );
  }
}