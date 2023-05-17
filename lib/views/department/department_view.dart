library department_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
// import '../../widgets/default_layout.dart';
import '../../config/my_Image.dart';
import '../../config/my_icon.dart';
import '../../config/palettes.dart';
import '../../widgets/custom_button.dart';
import 'components/add_item.dart';
import 'components/view_listing.dart';
import 'department_view_model.dart';
import 'widgets/input_text_rtl.dart';
import 'widgets/search_text_input.dart';
import 'widgets/signal_list_tile.dart';

part 'department_mobile.dart';
part 'department_tablet.dart';
part 'department_desktop.dart';

// ignore: must_be_immutable
class DepartmentView extends StatelessWidget {
  static const routeName = '/department';

  const DepartmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DepartmentViewModel>.reactive(
        viewModelBuilder: () => DepartmentViewModel(),
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
        });
  }
}
