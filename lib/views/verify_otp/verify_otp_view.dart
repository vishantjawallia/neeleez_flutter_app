library verify_otp_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:pinput/pinput.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_Image.dart';
import '../../widgets/custom_button.dart';
import 'verify_otp_view_model.dart';

part 'verify_otp_mobile.dart';
part 'verify_otp_tablet.dart';
part 'verify_otp_desktop.dart';

// ignore: must_be_immutable
class VerifyOtpView extends StatelessWidget {
  static const routeName = '/verify_otp';
  final String? phoneNumber;
  final String? countryCode;
  final Countries? country;

  const VerifyOtpView({super.key, this.phoneNumber, this.countryCode, this.country});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VerifyOtpViewModel>.reactive(
      viewModelBuilder: () => VerifyOtpViewModel(
        phoneNumber: phoneNumber,
        countryCode: countryCode,
        country: country,
      ),
      onViewModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      onDispose: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _VerifyOtpMobile(viewModel),
          desktop: (_) => _VerifyOtpMobile(viewModel),
          tablet: (_) => _VerifyOtpMobile(viewModel),
        );
      },
    );
  }
}
