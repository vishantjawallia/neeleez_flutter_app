library dashboard_view;

// import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/user_data.dart';
import 'package:neeleez_flutter_app/views/dashboard/widgets/box_widget.dart';
import 'package:neeleez_flutter_app/views/package_subscriptions/package_subscriptions_view.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:neeleez_flutter_app/widgets/url_image.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/palettes.dart';
import 'dashboard_view_model.dart';
import 'widgets/drawer.dart';
import 'widgets/layout.dart';

part 'dashboard_mobile.dart';
part 'dashboard_tablet.dart';
part 'dashboard_desktop.dart';

// ignore: must_be_immutable
class DashboardView extends StatelessWidget {
  static const routeName = '/dashboard';
  final UserData? userData;
  const DashboardView({super.key, this.userData});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DashboardViewModel>.reactive(
      viewModelBuilder: () => DashboardViewModel(userData: userData),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _DashboardMobile(viewModel),
          desktop: (_) => _DashboardMobile(viewModel),
          tablet: (_) => _DashboardMobile(viewModel),
        );
      },
    );
  }
}
