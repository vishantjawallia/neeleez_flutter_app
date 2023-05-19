// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:neeleez_flutter_app/config/palettes.dart';
import 'package:neeleez_flutter_app/models/company/company_profile.dart';
import 'package:neeleez_flutter_app/views/company_profile/company_profile_view_model.dart';
import 'package:neeleez_flutter_app/views/company_profile/tab_view/general_info/widgets/select_country_dialog.dart';
import 'package:neeleez_flutter_app/views/department/service/department_service.dart';
import 'package:neeleez_flutter_app/views/designation/service/designation_service.dart';
import 'package:neeleez_flutter_app/widgets/global_widget.dart';

import '../../../../models/company/companies.dart';

class ContactPersonInfoProvider extends ChangeNotifier with DepartmentService, DesignationService {
  TextEditingController mobileNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController fullName = TextEditingController();
  CompanyContact? data;

  String? code = "";
  int? codeId;

  bool departmentEnabled = false;
  bool designationEnabled = false;

  TextEditingController designationController = TextEditingController();
  TextEditingController departmentController = TextEditingController();

  String? selectedDepartment;

  String? selectedDesignation;

  FocusNode mobileNoFocusNode = FocusNode();

  ContactPersonInfoProvider() {
    mobileNo.addListener(() => notifyListeners());
    // countryCode.addListener(() => notifyListeners());
    email.addListener(() => notifyListeners());
    fullName.addListener(() => notifyListeners());
    designationController.addListener(() => notifyListeners());
    departmentController.addListener(() => notifyListeners());
  }

  void loadItems(CompanyProfile? cp, List<Countries>? countryList) {
    if (cp != null) {
      data = cp.companyContact;
      mobileNo.text = cp.companyContact?.mobile ?? "";
      email.text = cp.companyContact?.email ?? "";
      fullName.text = cp.companyContact?.nameEn ?? "";
      code = countryList?.firstWhere((e) => e.id == cp.companyAddress?.countryId).countryCode.toString();
      codeId = countryList?.firstWhere((e) => e.id == cp.companyAddress?.countryId).id;
      //focus Node
      mobileNoFocusNode.addListener(() => notifyListeners());
      notifyListeners();
    }
  }

  void designationOnTap(CompanyProfileViewModel viewModel) {
    designationEnabled = !designationEnabled;
    notifyListeners();
  }

  void departmentOnTap(CompanyProfileViewModel viewModel) {
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
    mobileNoFocusNode.unfocus();
    countrySelectDialog(
      context,
      list: list,
      intialValue: list?.firstWhere((e) => e.id == codeId),
      onSubmit: (value) {
        Get.back();
        code = value!.countryCode!;
        notifyListeners();
      },
    );
  }

  void departmentOnChange(String? value) {
    selectedDepartment = value;
    notifyListeners();
  }

  void designationOnChange(String? value) {
    selectedDesignation = value;
    notifyListeners();
  }

  onNewDepartmentSave(BuildContext _, CompanyProfileViewModel viewModel) async {
    if (departmentController.text.isEmpty) {
      GlobalWidgets.toast('Empty Field Not Allowed', contentColor: Palettes.red);
      return;
    }
    viewModel.setBusy(true);
    DateTime dateTime = DateTime.now();
    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
    final res = await postDepartment(
      0,
      departmentController.text,
      "",
      int.parse(viewModel.companyId!),
      true,
      formattedDateTime,
      0,
      0,
    );
    if (res) {
      departmentEnabled = false;
      departmentController.text = "";
      notifyListeners();
      viewModel.setBusy(false);
      viewModel.packagesData(_, reload: true);
    }
  }

  onNewDesignationSave(BuildContext _, CompanyProfileViewModel viewModel) async {
    if (designationController.text.isEmpty) {
      GlobalWidgets.toast('Empty Field Not Allowed', contentColor: Palettes.red);
      return;
    }
    viewModel.setBusy(true);
    DateTime dateTime = DateTime.now();
    String formattedDateTime = DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'").format(dateTime.toUtc());
    final res = await postDesignation(
      0,
      int.parse(viewModel.companyId!),
      departmentController.text,
      "",
      "",
      formattedDateTime,
      true,
      0,
      0,
    );
    if (res) {
      designationEnabled = false;
      designationController.text = "";
      notifyListeners();
      viewModel.setBusy(false);
      viewModel.packagesData(_, reload: true);
    }
  }
}
