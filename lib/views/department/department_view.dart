library department_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
// import '../../widgets/default_layout.dart';
import '../../config/palettes.dart';
import '../../models/user_data.dart';
import 'components/add_item.dart';
import 'components/view_listing.dart';
import 'department_view_model.dart';

part 'department_mobile.dart';
part 'department_tablet.dart';
part 'department_desktop.dart';

// ignore: must_be_immutable
class DepartmentView extends StatelessWidget {
  static const routeName = '/department';
  UserData? user;

  DepartmentView(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    // final main = Provider.of<MainProvider>(context);
    return ViewModelBuilder<DepartmentViewModel>.reactive(
      viewModelBuilder: () => DepartmentViewModel(user),
      onViewModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _DepartmentMobile(viewModel),
          desktop: (_) => _DepartmentMobile(viewModel),
          tablet: (_) => _DepartmentMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _DepartmentDesktop(viewModel),
          //tablet: _DepartmentTablet(viewModel),
        );
      },
    );
  }
}
