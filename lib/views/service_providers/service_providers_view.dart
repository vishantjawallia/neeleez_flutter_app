library service_providers_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/views/staff_profile/staff_profile_view.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_icon.dart';
import '../../config/palettes.dart';
import 'service_providers_view_model.dart';
import 'widgets/no_staff_added_item.dart';

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