library company_profile_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'company_profile_view_model.dart';

part 'company_profile_mobile.dart';
part 'company_profile_tablet.dart';
part 'company_profile_desktop.dart';

// ignore: must_be_immutable
class CompanyProfileView extends StatelessWidget {
  static const routeName = '/company_profile';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyProfileViewModel>.reactive(
      viewModelBuilder: () => CompanyProfileViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _CompanyProfileMobile(viewModel),
          desktop: _CompanyProfileMobile(viewModel),
          tablet: _CompanyProfileMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _CompanyProfileDesktop(viewModel),
          //tablet: _CompanyProfileTablet(viewModel),  
        );
      }
    );
  }
}