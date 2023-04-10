library notifications_view;

import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'notifications_view_model.dart';

part 'notifications_mobile.dart';
part 'notifications_tablet.dart';
part 'notifications_desktop.dart';

// ignore: must_be_immutable
class NotificationsView extends StatelessWidget {
  static const routeName = '/notifications';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationsViewModel>.reactive(
      viewModelBuilder: () => NotificationsViewModel(),
      onModelReady: (viewModel) {
        // Do something once your viewModel is initialized
      },
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _NotificationsMobile(viewModel),
          desktop: _NotificationsMobile(viewModel),
          tablet: _NotificationsMobile(viewModel),

          //Uncomment it if you've planned to support specifically for desktop and tablet
          //desktop: _NotificationsDesktop(viewModel),
          //tablet: _NotificationsTablet(viewModel),  
        );
      }
    );
  }
}