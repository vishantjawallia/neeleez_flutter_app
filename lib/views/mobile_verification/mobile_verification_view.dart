library mobile_verification_view;

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_ modal_progress_hud.dart';
import '../../widgets/custom_button.dart';
import 'mobile_verification_view_model.dart';
import 'widgets/phone_text_field.dart';

part 'mobile_verification_mobile.dart';
part 'mobile_verification_tablet.dart';
part 'mobile_verification_desktop.dart';

// ignore: must_be_immutable
class MobileVerificationView extends StatelessWidget {
  static const routeName = '/mobile_verification';
  final bool? loading;

  const MobileVerificationView({super.key, this.loading = false});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MobileVerificationViewModel>.reactive(
        viewModelBuilder: () => MobileVerificationViewModel(loading!),
        onViewModelReady: (viewModel) {
          // Do something once your viewModel is initialized
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _MobileVerificationMobile(viewModel),
            desktop: (_) => _MobileVerificationMobile(viewModel),
            tablet: (_) => _MobileVerificationMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _MobileVerificationDesktop(viewModel),
            //tablet: _MobileVerificationTablet(viewModel),
          );
        });
  }
}
