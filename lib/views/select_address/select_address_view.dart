library select_address_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/palettes.dart';
import '../../widgets/default_layout.dart';
import 'select_address_view_model.dart';

part 'select_address_mobile.dart';
part 'select_address_tablet.dart';
part 'select_address_desktop.dart';

// ignore: must_be_immutable
class SelectAddressView extends StatelessWidget {
  static const routeName = '/select_address';
  final Cities? city;

  const SelectAddressView({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SelectAddressViewModel>.reactive(
        viewModelBuilder: () => SelectAddressViewModel(city),
        onViewModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _SelectAddressMobile(viewModel),
            desktop: (_) => _SelectAddressMobile(viewModel),
            tablet: (_) => _SelectAddressMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _SelectAddressDesktop(viewModel),
            //tablet: _SelectAddressTablet(viewModel),
          );
        });
  }
}
