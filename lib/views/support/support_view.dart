library support_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'support_view_model.dart';

part 'support_mobile.dart';
part 'support_tablet.dart';
part 'support_desktop.dart';

// ignore: must_be_immutable
class SupportView extends StatelessWidget {
  static const routeName = '/support';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
      viewModelBuilder: () => SupportViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _SupportMobile(viewModel),
          desktop: _SupportMobile(viewModel),
          tablet: _SupportMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _SupportDesktop(viewModel),
          //tablet: _SupportTablet(viewModel),  
        );
      }
    );
  }
}