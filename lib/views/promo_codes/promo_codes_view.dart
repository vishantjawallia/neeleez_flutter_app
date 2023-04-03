library promo_codes_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'promo_codes_view_model.dart';

part 'promo_codes_mobile.dart';
part 'promo_codes_tablet.dart';
part 'promo_codes_desktop.dart';

// ignore: must_be_immutable
class PromoCodesView extends StatelessWidget {
  static const routeName = '/promo_codes';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PromoCodesViewModel>.reactive(
      viewModelBuilder: () => PromoCodesViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _PromoCodesMobile(viewModel),
          desktop: _PromoCodesMobile(viewModel),
          tablet: _PromoCodesMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _PromoCodesDesktop(viewModel),
          //tablet: _PromoCodesTablet(viewModel),  
        );
      }
    );
  }
}