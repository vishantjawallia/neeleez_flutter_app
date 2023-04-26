library company_profile_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/business_hours.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/contact_person_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/general_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/loaction.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/packages.dart';
import 'package:neeleez_flutter_app/views/company_profile/widgets/social_media.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'company_profile_view_model.dart';
import 'widgets/file_section.dart';

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
