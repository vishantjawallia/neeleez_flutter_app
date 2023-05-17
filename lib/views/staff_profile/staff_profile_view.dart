library staff_profile_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/views/staff_profile/tab_view/tab_bar1/tab_bar1.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_icon.dart';
import '../../config/palettes.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/default_layout.dart';
import 'staff_profile_view_model.dart';
import 'tab_view/tab_bar2/tab_bar2.dart';

part 'staff_profile_mobile.dart';
part 'staff_profile_tablet.dart';
part 'staff_profile_desktop.dart';

// ignore: must_be_immutable
class StaffProfileView extends StatelessWidget {
  static const routeName = '/staff_profile';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StaffProfileViewModel>.reactive(
      viewModelBuilder: () => StaffProfileViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _StaffProfileMobile(viewModel),
          desktop: _StaffProfileMobile(viewModel),
          tablet: _StaffProfileMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _StaffProfileDesktop(viewModel),
          //tablet: _StaffProfileTablet(viewModel),  
        );
      }
    );
  }
}