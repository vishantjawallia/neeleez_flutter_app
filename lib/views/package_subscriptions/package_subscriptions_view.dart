library package_subscriptions_view;

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_Image.dart';
import 'package_subscriptions_view_model.dart';

part 'package_subscriptions_mobile.dart';
part 'package_subscriptions_tablet.dart';
part 'package_subscriptions_desktop.dart';

// ignore: must_be_immutable
class PackageSubscriptionsView extends StatelessWidget {
  static const routeName = '/package_subscriptions';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PackageSubscriptionsViewModel>.reactive(
      viewModelBuilder: () => PackageSubscriptionsViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _PackageSubscriptionsMobile(viewModel),
          desktop: _PackageSubscriptionsMobile(viewModel),
          tablet: _PackageSubscriptionsMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _PackageSubscriptionsDesktop(viewModel),
          //tablet: _PackageSubscriptionsTablet(viewModel),  
        );
      }
    );
  }
}