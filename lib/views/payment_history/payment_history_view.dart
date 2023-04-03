library payment_history_view;

import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'payment_history_view_model.dart';

part 'payment_history_mobile.dart';
part 'payment_history_tablet.dart';
part 'payment_history_desktop.dart';

// ignore: must_be_immutable
class PaymentHistoryView extends StatelessWidget {
  static const routeName = '/payment_history';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentHistoryViewModel>.reactive(
      viewModelBuilder: () => PaymentHistoryViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _PaymentHistoryMobile(viewModel),
          desktop: _PaymentHistoryMobile(viewModel),
          tablet: _PaymentHistoryMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _PaymentHistoryDesktop(viewModel),
          //tablet: _PaymentHistoryTablet(viewModel),  
        );
      }
    );
  }
}