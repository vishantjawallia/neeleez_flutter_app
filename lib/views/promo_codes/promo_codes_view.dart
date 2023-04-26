library promo_codes_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/promo_codes/components/activated.dart';
import 'package:neeleez_flutter_app/views/promo_codes/components/redeemed.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../widgets/default_layout.dart';

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
        onViewModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _PromoCodesMobile(viewModel),
            desktop: (_) => _PromoCodesMobile(viewModel),
            tablet: (_) => _PromoCodesMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _PromoCodesDesktop(viewModel),
            //tablet: _PromoCodesTablet(viewModel),
          );
        });
  }
}
