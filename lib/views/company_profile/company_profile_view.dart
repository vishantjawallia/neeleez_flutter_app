library company_profile_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/business_hours.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/file_section/file_section.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/general_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/loaction/loaction.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/packages/packages.dart';

import 'package:neeleez_flutter_app/views/company_profile/tab_view/social_media/social_media.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/timing_box.dart';
// import 'package:neeleez_flutter_app/tab_view/custom_%20modal_progress_hud.dart';
// import 'package:neeleez_flutter_app/tab_view/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../models/company/timing.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/default_layout.dart';
import 'company_profile_view_model.dart';
// import 'widgets/file_section.dart';

part 'company_profile_mobile.dart';
part 'company_profile_tablet.dart';
part 'company_profile_desktop.dart';

// ignore: must_be_immutable
class CompanyProfileView extends StatelessWidget {
  static const routeName = '/company_profile';
  final UserData? user;

  const CompanyProfileView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyProfileViewModel>.reactive(
      viewModelBuilder: () => CompanyProfileViewModel(user: user),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _CompanyProfileMobile(viewModel),
          desktop: (_) => _CompanyProfileMobile(viewModel),
          tablet: (_) => _CompanyProfileMobile(viewModel),
        );
      },
    );
  }
}
