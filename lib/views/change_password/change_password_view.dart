library change_password_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:neeleez_flutter_app/widgets/custom_text_field.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_Image.dart';
import '../../config/palettes.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/url_image.dart';
import 'change_password_view_model.dart';

part 'change_password_mobile.dart';
part 'change_password_tablet.dart';
part 'change_password_desktop.dart';

// ignore: must_be_immutable
class ChangePasswordView extends StatelessWidget {
  static const routeName = '/change_password';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChangePasswordViewModel>.reactive(
        viewModelBuilder: () => ChangePasswordViewModel(),
        onModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout(
            mobile: _ChangePasswordMobile(viewModel),
            desktop: _ChangePasswordMobile(viewModel),
            tablet: _ChangePasswordMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _ChangePasswordDesktop(viewModel),
            //tablet: _ChangePasswordTablet(viewModel),
          );
        });
  }
}
