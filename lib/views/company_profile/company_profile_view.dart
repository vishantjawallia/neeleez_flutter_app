library company_profile_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
// import 'package:neeleez_flutter_app/models/company/company_profile.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/business_hours/business_hours.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/contact_person_info/contact_person_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/file_section/file_section.dart';
// import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/general_info.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/loaction/loaction.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/packages/packages.dart';

import 'package:neeleez_flutter_app/views/company_profile/tab_view/social_media/social_media.dart';
// import 'package:neeleez_flutter_app/tab_view/custom_%20modal_progress_hud.dart';
// import 'package:neeleez_flutter_app/tab_view/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../models/amenities/amenities.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/default_layout.dart';
import 'company_profile_view_model.dart';
import 'tab_view/general_info/general_info.dart';
// import 'widgets/file_section.dart';

part 'company_profile_mobile.dart';
part 'company_profile_tablet.dart';
part 'company_profile_desktop.dart';

// ignore: must_be_immutable
class CompanyProfileView extends StatefulWidget {
  static const routeName = '/company_profile';
  final UserData? user;
  final List<BusinessServicesByCountry>? businessCategoryList;
  final List<Gender>? serviceForList;
  final List<Amenities>? amentiasList;

  const CompanyProfileView({
    super.key,
    required this.user,
    this.serviceForList,
    this.amentiasList,
    this.businessCategoryList,
  });

  @override
  State<CompanyProfileView> createState() => _CompanyProfileViewState();
}

class _CompanyProfileViewState extends State<CompanyProfileView> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompanyProfileViewModel>.reactive(
      viewModelBuilder: () {
        return CompanyProfileViewModel(
        user: widget.user,
        amentiasList: widget.amentiasList,
        serviceForList: widget.serviceForList,
        businessCategoryList: widget.businessCategoryList,
      );
      },
      onViewModelReady: (viewModel) {
        viewModel.tabController = TabController(initialIndex: 0, length: 7, vsync: this);
        viewModel.loadTabBar(context);
      },
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
