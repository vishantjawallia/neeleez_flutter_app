library registration_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_icon.dart';
import '../../helpers/helper.dart';
import '../../widgets/custom_text_field.dart';
import 'registration_view_model.dart';

part 'registration_mobile.dart';
part 'registration_tablet.dart';
part 'registration_desktop.dart';

// ignore: must_be_immutable
class RegistrationView extends StatelessWidget {
  static const routeName = '/registration';

  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegistrationViewModel>.reactive(
        viewModelBuilder: () => RegistrationViewModel(),
        onViewModelReady: (viewModel) {},
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _RegistrationMobile(viewModel),
            desktop: (_) => _RegistrationMobile(viewModel),
            tablet: (_) => _RegistrationMobile(viewModel),
          );
        });
  }
}
