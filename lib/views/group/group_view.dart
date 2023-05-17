library group_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'group_view_model.dart';

part 'group_mobile.dart';
part 'group_tablet.dart';
part 'group_desktop.dart';

// ignore: must_be_immutable
class GroupView extends StatelessWidget {
  static const routeName = '/group';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<GroupViewModel>.reactive(
      viewModelBuilder: () => GroupViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _GroupMobile(viewModel),
          desktop: _GroupMobile(viewModel),
          tablet: _GroupMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _GroupDesktop(viewModel),
          //tablet: _GroupTablet(viewModel),  
        );
      }
    );
  }
}