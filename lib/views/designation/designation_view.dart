library designation_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/palettes.dart';
import '../../widgets/default_layout.dart';
// import 'components/add_item.dart';
// import 'components/view_listing.dart';
import 'components/add_item.dart';
import 'components/view_listing.dart';
import 'designation_view_model.dart';

part 'designation_mobile.dart';
part 'designation_tablet.dart';
part 'designation_desktop.dart';

// ignore: must_be_immutable
class DesignationView extends StatelessWidget {
  static const routeName = '/designation';

  const DesignationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DesignationViewModel>.reactive(
        viewModelBuilder: () => DesignationViewModel(),
        onViewModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _DesignationMobile(viewModel),
            desktop: (_) => _DesignationMobile(viewModel),
            tablet: (_) => _DesignationMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _DesignationDesktop(viewModel),
            //tablet: _DesignationTablet(viewModel),
          );
        });
  }
}
