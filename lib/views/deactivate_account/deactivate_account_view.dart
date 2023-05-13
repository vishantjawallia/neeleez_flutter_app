library deactivate_account_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'deactivate_account_view_model.dart';

part 'deactivate_account_mobile.dart';
part 'deactivate_account_tablet.dart';
part 'deactivate_account_desktop.dart';

// ignore: must_be_immutable
class DeactivateAccountView extends StatelessWidget {
  static const routeName = '/deactivate_account';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DeactivateAccountViewModel>.reactive(
      viewModelBuilder: () => DeactivateAccountViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _DeactivateAccountMobile(viewModel),
          desktop: _DeactivateAccountMobile(viewModel),
          tablet: _DeactivateAccountMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _DeactivateAccountDesktop(viewModel),
          //tablet: _DeactivateAccountTablet(viewModel),  
        );
      }
    );
  }
}