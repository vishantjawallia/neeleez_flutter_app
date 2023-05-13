import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neeleez_flutter_app/models/company/company_profile.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/widgets/select_country_dialog.dart';

import '../../../../models/company/companies.dart';

class ContactPersonInfoProvider<E> extends ChangeNotifier {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  CompanyContact? data;
  String? code = "";

  bool departmentEnabled = false;
  bool designationEnabled = false;

  TextEditingController designationController = TextEditingController();

  TextEditingController departmentController = TextEditingController();

  ContactPersonInfoProvider() {
    mobileNo.addListener(() => notifyListeners());
    // countryCode.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    fullName.addListener(() => notifyListeners());
    designationController.addListener(() => notifyListeners());
    departmentController.addListener(() => notifyListeners());
  }

  void loadItems(CompanyContact? value) {
    if (value != null) {
      data = value;
      mobileNo.text = value.mobile ?? "";
      email.text = value.email ?? "";
      fullName.text = value.nameEn ?? "";
    }
  }

  void designationOnTap() {
    designationEnabled = !designationEnabled;
    notifyListeners();
  }

  void departmentOnTap() {
    departmentEnabled = !departmentEnabled;
    notifyListeners();
  }

  void onSaveHandler(_, CompanyProfileViewModel viewModel) async {
    viewModel.setBusy(true);
    await viewModel.putUpdateContactPerson(
      viewModel.companyId,
      0,
      fullName.text,
      "",
      email.text,
      mobileNo.text,
      viewModel.genInfo?.whatsapp ?? "",
      viewModel.genInfo?.tel1 ?? "",
      designationController.text,
      departmentController.text,
      0,
      0,
    );
    viewModel.setBusy(false);
    viewModel.packagesData(_, reload: true);
  }

  onCountryCodeTapHandler(BuildContext context, List<Countries>? list) {
    countrySelectDialog(
      context,
      list: list,
      onSubmit: (value) {
        Get.back();
        code = value!.countryCode!;
        notifyListeners();
      },
    );
  }
}
