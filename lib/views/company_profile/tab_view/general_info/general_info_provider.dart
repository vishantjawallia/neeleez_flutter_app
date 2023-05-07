import 'package:flutter/material.dart';
import 'package:neeleez_flutter_app/models/general_info/general_info.dart';

class GeneralInfoProvider extends ChangeNotifier {
  GeneralInformation? data;
  ScrollController scrollController = ScrollController();
  TextEditingController companyName = TextEditingController();
  TextEditingController companyName2 = TextEditingController();
  TextEditingController tagline = TextEditingController();
  TextEditingController companyEsb = TextEditingController();
  TextEditingController additionalInfo = TextEditingController();
  TextEditingController whatsAppNo = TextEditingController();
  TextEditingController telephone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController website = TextEditingController();
  bool? isFreelancer = false;

  List<String> businessSubCategorySelectedList = [];

  GeneralInfoProvider() {
    scrollController.addListener(() => notifyListeners());
    companyName.addListener(() => notifyListeners());
    companyName2.addListener(() => notifyListeners());
    tagline.addListener(() => notifyListeners());
    companyEsb.addListener(() => notifyListeners());
    additionalInfo.addListener(() => notifyListeners());
    whatsAppNo.addListener(() => notifyListeners());
    telephone.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    website.addListener(() => notifyListeners());
  }

  void load() async {}

  void setFreelancer() {
    isFreelancer = !isFreelancer!;
    notifyListeners();
  }

  void copEstabYearOnTap(_) {
    isFreelancer = !isFreelancer!;
    notifyListeners();
  }

  void loadItem(GeneralInformation? generalInformation) {
    data = generalInformation;
    notifyListeners();
    if (data != null) {
      isFreelancer = data!.isFreeLancer ?? false;
      companyName.text = data!.nameEn ?? "";
      companyName2.text = data!.nameAr ?? "";
      tagline.text = data!.tagLine ?? "";
      companyEsb.text = data!.edate ?? "";
      website.text = data!.url ?? "";
      telephone.text = data!.tel1 ?? "";
      email.text = data!.email ?? "";
      whatsAppNo.text = data?.whatsapp ?? "";
      additionalInfo.text = data!.aboutUs ?? "";
      notifyListeners();
    }
  }
}
