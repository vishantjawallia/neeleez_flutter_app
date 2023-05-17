library format_view;

import 'package:get/get.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/palettes.dart';
import '../../widgets/default_layout.dart';
import 'components/add_item.dart';
import 'components/view_listing.dart';
import 'format_view_model.dart';

part 'format_mobile.dart';
part 'format_tablet.dart';
part 'format_desktop.dart';

// ignore: must_be_immutable
class FormatView extends StatelessWidget {
  static const routeName = '/format';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FormatViewModel>.reactive(
      viewModelBuilder: () => FormatViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _FormatMobile(viewModel),
          desktop: _FormatMobile(viewModel),
          tablet: _FormatMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _FormatDesktop(viewModel),
          //tablet: _FormatTablet(viewModel),  
        );
      }
    );
  }
}