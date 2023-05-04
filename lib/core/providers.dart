import 'package:neeleez_flutter_app/provider/MainProvider.dart';

import '../core/locator.dart';
import '../core/services/navigator_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../views/company_profile/tab_view/business_hours/business_hours_provider.dart';
import '../views/company_profile/tab_view/contact_person_info/contact_person_info_provider.dart';
import '../views/company_profile/tab_view/file_section/file_section_provider.dart';
import '../views/company_profile/tab_view/general_info/general_info_provider.dart';
import '../views/company_profile/tab_view/loaction/loaction_provider.dart';
import '../views/company_profile/tab_view/packages/packages_provider.dart';
import '../views/company_profile/tab_view/social_media/social_media_provider.dart';

class ProviderInjector {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(lazy: true, create: (_) => MainProvider()),
    ..._companyInfoServices,
    ..._independentServices,
    ..._dependentServices,
    ..._consumableServices,
  ];

  static final List<SingleChildWidget> _independentServices = [
    Provider.value(value: locator<NavigatorService>()),
  ];

  static final List<SingleChildWidget> _dependentServices = [];

  static final List<SingleChildWidget> _consumableServices = [];
  static final List<SingleChildWidget> _companyInfoServices = [
    ChangeNotifierProvider<BusinessHoursProvider>(create: (_) => BusinessHoursProvider()),
    ChangeNotifierProvider<ContactPersonInfoProvider>(create: (_) => ContactPersonInfoProvider()),
    ChangeNotifierProvider<FileSectionProvider>(create: (_) => FileSectionProvider()),
    ChangeNotifierProvider<GeneralInfoProvider>(create: (_) => GeneralInfoProvider()),
    ChangeNotifierProvider<LocationProvider>(create: (_) => LocationProvider()),
    ChangeNotifierProvider<PackagesProvider>(create: (_) => PackagesProvider()),
    ChangeNotifierProvider<SocialMediaProvider>(create: (_) => SocialMediaProvider()),
  ];
}
