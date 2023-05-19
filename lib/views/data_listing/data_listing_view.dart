library data_listing_view;

import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/helpers/helper.dart';
import 'package:neeleez_flutter_app/provider/MainProvider.dart';
import 'package:neeleez_flutter_app/views/data_listing/widgets/custom_list_tile.dart';
import 'package:neeleez_flutter_app/widgets/default_layout.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import 'data_listing_view_model.dart';

part 'data_listing_mobile.dart';
part 'data_listing_tablet.dart';
part 'data_listing_desktop.dart';

// ignore: must_be_immutable
class DataListingView extends StatelessWidget {
  static const routeName = '/data_listing';

  const DataListingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DataListingViewModel>.reactive(
        viewModelBuilder: () => DataListingViewModel(),
        onViewModelReady: (viewModel) {
          final main = Provider.of<MainProvider>(context, listen: false);
          viewModel.setUser(main.user);
        },
        builder: (context, viewModel, child) {
          return ScreenTypeLayout.builder(
            mobile: (_) => _DataListingMobile(viewModel),
            desktop: (_) => _DataListingMobile(viewModel),
            tablet: (_) => _DataListingMobile(viewModel),

            //Uncomment it if you've planned to support specifically for desktop and tablet
            //desktop: _DataListingDesktop(viewModel),
            //tablet: _DataListingTablet(viewModel),
          );
        });
  }
}
