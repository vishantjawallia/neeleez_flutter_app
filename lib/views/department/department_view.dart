library department_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'department_view_model.dart';

part 'department_mobile.dart';
part 'department_tablet.dart';
part 'department_desktop.dart';

// ignore: must_be_immutable
class DepartmentView extends StatelessWidget {
  static const routeName = '/department';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DepartmentViewModel>.reactive(
      viewModelBuilder: () => DepartmentViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _DepartmentMobile(viewModel),
          desktop: _DepartmentMobile(viewModel),
          tablet: _DepartmentMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _DepartmentDesktop(viewModel),
          //tablet: _DepartmentTablet(viewModel),  
        );
      }
    );
  }
}