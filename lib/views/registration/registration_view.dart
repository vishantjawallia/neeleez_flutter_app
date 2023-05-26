library registration_view;

import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/config/my_Image.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/models/company/cities.dart';
import 'package:neeleez_flutter_app/models/company/companies.dart';
import 'package:neeleez_flutter_app/models/company/provinces.dart';
import 'package:neeleez_flutter_app/models/gender/gender.dart';
import 'package:neeleez_flutter_app/provider/MainProvider.dart';
import 'package:neeleez_flutter_app/views/registration/widgets/drop_down_Input.dart';
import 'package:neeleez_flutter_app/views/registration/widgets/multi_drop_down_Input.dart';
import 'package:neeleez_flutter_app/widgets/custom_%20modal_progress_hud.dart';
import 'package:neeleez_flutter_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../config/my_icon.dart';
import '../../helpers/helper.dart';
import '../../models/business_types/business_services_by_country.dart';
import '../../models/business_types/business_types.dart';
import '../../widgets/custom_text_field.dart';
import '../company_profile/components/custom_multi_drop_down.dart';
import '../company_profile/components/freelancer_switch.dart';
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
    final main = Provider.of<MainProvider>(context);
    return ViewModelBuilder<RegistrationViewModel>.reactive(
      viewModelBuilder: () => RegistrationViewModel(main.countries, main.countryDetail),
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return ScreenTypeLayout.builder(
          mobile: (_) => _RegistrationMobile(viewModel),
          desktop: (_) => _RegistrationMobile(viewModel),
          tablet: (_) => _RegistrationMobile(viewModel),
        );
      },
    );
  }
}
