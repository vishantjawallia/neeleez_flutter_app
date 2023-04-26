// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/config/my_icon.dart';
import 'package:neeleez_flutter_app/views/about/about_view.dart';
import 'package:neeleez_flutter_app/views/appointments/appointments_view.dart';
import 'package:neeleez_flutter_app/views/change_password/change_password_view.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view.dart';
import 'package:neeleez_flutter_app/views/data_listing/data_listing_view.dart';
import 'package:neeleez_flutter_app/views/package_subscriptions/package_subscriptions_view.dart';
import 'package:neeleez_flutter_app/views/payment_history/payment_history_view.dart';
import 'package:neeleez_flutter_app/views/promo_codes/promo_codes_view.dart';
import 'package:neeleez_flutter_app/views/service_providers/service_providers_view.dart';
import 'package:neeleez_flutter_app/views/support/support_view.dart';

const String APP_NAME = "Neeleez - We Care (Services)";

const String baseUrl = "http://api.kayyen.com";

const rtlLanguage = [
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

List drawer = [
  {
    "id": 1,
    "name": "Dashboard",
    "route": "",
    "icon": MyIcon.menu2Dashboard,
  },
  {
    "id": 2,
    "name": "Appointments",
    "route": AppointmentsView(),
    "icon": MyIcon.menu2Appointments,
  },
  {
    "id": 3,
    "name": "Promo Codes",
    "route": PromoCodesView(),
    "icon": MyIcon.menu2Appointments,
  },
  {
    "id": 4,
    "name": "Story Page",
    "route": "",
    "icon": MyIcon.menu2StoryPage,
  },
  {
    "id": 5,
    "name": "Online Payments",
    "route": "",
    "icon": MyIcon.menu2Payments,
    "line": true,
  },
  {
    "id": 6,
    "name": "Data Listing",
    "route": DataListingView(),
    "icon": MyIcon.menu2Services,
  },
  {
    "id": 7,
    "name": "Service Providers",
    "route": ServiceProvidersView(),
    "icon": MyIcon.menu2StaffManagement,
  },
  {
    "id": 8,
    "name": "Ecommerce",
    "route": "",
    "icon": MyIcon.menu2Payments,
  },
  {
    "id": 9,
    "name": "Company Profile",
    "route": const CompanyProfileView(user: null),
    "icon": MyIcon.staffGeneral,
  },
  {
    "id": 10,
    "name": "Change Password",
    "route": ChangePasswordView(),
    "icon": MyIcon.password,
    "line": true,
  },
  {
    "id": 11,
    "name": "Package Subscriptions",
    "route": PackageSubscriptionsView(),
    "icon": MyIcon.menu2Packages,
  },
  {
    "id": 12,
    "name": "Payment History",
    "route": PaymentHistoryView(),
    "icon": MyIcon.menu2Payments,
    "line": true,
  },
  {
    "id": 13,
    "name": "Support",
    "route": SupportView(),
    "icon": MyIcon.menu2Support,
  },
  {
    "id": 14,
    "name": "About",
    "route": AboutView(),
    "icon": MyIcon.menu2Preferences,
  },
  {
    "id": 15,
    "name": "Logout",
    "route": "",
    "icon": MyIcon.menu2Logout,
  },
];

List languageList = [
  {
    "id": 15,
    "name": "Azerbaijan",
    "nameAr": null,
    "nameFr": "Azerbaijan",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/noflag.png",
    "languageList": [
      // {"id": 16, "name": "Azerbaijani", "nameAr": "الأذربيجانية", "nameFr": "azerbaïdjanais"}
    ]
  },
  {
    "id": 80,
    "name": "Georgia",
    "nameAr": null,
    "nameFr": "Georgia",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/noflag.png",
    "languageList": [
      // {"id": 47, "name": "Georgian", "nameAr": "الجورجية", "nameFr": "géorgien"}
    ]
  },
  {
    "id": 100,
    "name": "India",
    "nameAr": "الهند",
    "nameFr": "India",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/India.png",
    "languageList": [
      {
        "id": 41,
        "name": "English",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('en', 'US'),
      }
    ]
  },
  {
    "id": 143,
    "name": "Morocco",
    "nameAr": "المغرب",
    "nameFr": "Morocco",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/Morocco.png",
    "languageList": [
      {
        "id": 10,
        "name": "Arabic ",
        "nameAr": "العربية",
        "nameFr": "Arabe",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 41,
        "name": "English",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 46,
        "name": "French",
        "nameAr": "فرنسي",
        "nameFr": "français",
        "local": const Locale('en', 'US'),
      }
    ]
  },
  {
    "id": 162,
    "name": "Pakistan",
    "nameAr": "الباكستان",
    "nameFr": "Pakistan",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/Pakistan.png",
    "languageList": [
      {
        "id": 41,
        "name": "English",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 42,
        "name": "Urdu",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('ur', 'PK'),
      }
    ]
  },
  {
    "id": 177,
    "name": "Russia",
    "nameAr": null,
    "nameFr": "Russia",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/Russia.png",
    "languageList": [
      // {"id": 110, "name": "Russian", "nameAr": "الروسية", "nameFr": "russe",}
    ]
  },
  {
    "id": 187,
    "name": "Saudi Arabia",
    "nameAr": "المملكة العربية السعودية",
    "nameFr": "Saudi Arabia",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/noflag.png",
    "languageList": [
      {
        "id": 10,
        "name": "Arabic ",
        "nameAr": "العربية",
        "nameFr": "Arabe",
        "local": const Locale('en', 'US'),
      }
    ]
  },
  {
    "id": 216,
    "name": "Tunisia",
    "nameAr": "تونس",
    "nameFr": "Tunisia",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/Tunisia.png",
    "languageList": [
      {
        "id": 10,
        "name": "Arabic ",
        "nameAr": "العربية",
        "nameFr": "Arabe",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 41,
        "name": "English",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 46,
        "name": "French",
        "nameAr": "فرنسي",
        "nameFr": "français",
        "local": const Locale('en', 'US'),
      }
    ]
  },
  {
    "id": 223,
    "name": "United Arab Emirates",
    "nameAr": "متحدة عرب امارات",
    "nameFr": "United Arab Emirates",
    "iconImage": "https://api.kayyen.com/Uploads/CountryFlag/6d256dbe-c6f2-4b32-923a-ad31d750df8e/UAE.png",
    "languageList": [
      {
        "id": 10,
        "name": "Arabic ",
        "nameAr": "العربية",
        "nameFr": "Arabe",
        "local": const Locale('en', 'US'),
      },
      {
        "id": 41,
        "name": "English",
        "nameAr": "إنجليزي",
        "nameFr": "Anglais",
        "local": const Locale('en', 'US'),
      }
    ]
  }
];
