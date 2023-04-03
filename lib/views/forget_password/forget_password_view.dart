library forget_password_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_Image.dart';
import '../../config/my_icon.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import 'forget_password_view_model.dart';

part 'forget_password_mobile.dart';
part 'forget_password_tablet.dart';
part 'forget_password_desktop.dart';

// ignore: must_be_immutable
class ForgetPasswordView extends StatelessWidget {
  static const routeName = '/forget_password';
  bool? loading;
  ForgetPasswordView({this.loading = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetPasswordViewModel>.reactive(
        viewModelBuilder: () => ForgetPasswordViewModel(loading!),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _ForgetPasswordMobile(viewModel),
            desktop: _ForgetPasswordMobile(viewModel),
            tablet: _ForgetPasswordMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _ForgetPasswordDesktop(viewModel),
            //tablet: _ForgetPasswordTablet(viewModel),
          );
        });
  }
}
