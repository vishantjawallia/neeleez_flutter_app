library verify_otp_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'verify_otp_view_model.dart';

part 'verify_otp_mobile.dart';
part 'verify_otp_tablet.dart';
part 'verify_otp_desktop.dart';

// ignore: must_be_immutable
class VerifyOtpView extends StatelessWidget {
  static const routeName = '/verify_otp';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyOtpViewModel>.reactive(
      viewModelBuilder: () => VerifyOtpViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _VerifyOtpMobile(viewModel),
          desktop: _VerifyOtpMobile(viewModel),
          tablet: _VerifyOtpMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _VerifyOtpDesktop(viewModel),
          //tablet: _VerifyOtpTablet(viewModel),  
        );
      }
    );
  }
}