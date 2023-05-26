part of registration_view;

// ignore: must_be_immutable
class _RegistrationMobile extends StatelessWidget {
  final RegistrationViewModel viewModel;

  const _RegistrationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: viewModel.onWillPop,
      child: Scaffold(
        body: ModalProgressHUD(
          load: viewModel.isBusy,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(MyImage.splashBackground1),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 50),
                        Image.asset(
                          height: 115,
                          MyImage.logo,
                        ),
                        const SizedBox(height: 50),
                        Text(
                          'registerNow'.tr,
                          style: Get.textTheme.displayLarge,
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 280,
                          child: Text(
                            'registerText'.tr,
                            style: Get.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'General Info:'.tr,
                            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 4,
                            width: 35,
                            decoration: const BoxDecoration(
                              color: Palettes.white,
                            ),
                            // child: ,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        FreelancerSwitch(
                          color: Palettes.white,
                          initialValue: viewModel.isFreelancer,
                          onChange: viewModel.freelancerOnChange,
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          name: 'Company Name:',
                          prefixIconPath: MyIcon.officeBuilding,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                        DropDownInput<BusinessServicesByCountry>(
                          name: 'Business Category: ',
                          prefixIconPath: MyIcon.portfolio,
                          value: viewModel.busObj,
                          onChanged: viewModel.busCategoryOnChange,
                          items: viewModel.bus
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.service!,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.black,
                                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        MultiDropDownInput<BusinessTypes>(
                          scrollController: viewModel.busTypeScrollController,
                          focusScopeNode: viewModel.busTypeFocusScopeNode,
                          name: 'Business Sub-Category: ',
                          prefixIconPath: MyIcon.portfolio,
                          selectedList: viewModel.busSelectedList.map((e) => e.businessTypeNameEn!).toList(),
                          onRemove: viewModel.busSubCategoryOnRemove,
                          onChanged: viewModel.busSubCategoryOnChange,
                          items: viewModel.busType
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.businessTypeNameEn!,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.black,
                                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        DropDownInput<Gender>(
                          name: 'Service For ',
                          prefixIconPath: MyIcon.sex,
                          value: viewModel.serviceObj,
                          onChanged: viewModel.serviceForOnChange,
                          items: viewModel.serviceList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e.genderEn!,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.black,
                                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        const CustomTextField(
                          name: 'Telephone',
                          prefixIconPath: MyIcon.telephone,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                        const CustomTextField(
                          name: 'Email',
                          prefixIconPath: MyIcon.mail,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                        const CustomTextField(
                          name: 'Password',
                          obscureText: true,
                          prefixIconPath: MyIcon.password,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Align(
                      alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Location:'.tr,
                            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            height: 4,
                            width: 35,
                            decoration: const BoxDecoration(
                              color: Palettes.white,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        DropDownInput<Countries>(
                          name: 'Country:',
                          prefixUrl: viewModel.country?.iconImage2 ?? "",
                          value: viewModel.country,
                          items: viewModel.countries!.map((e) {
                            return DropdownMenuItem<Countries>(
                              value: e,
                              child: Text(
                                e.nameEn!,
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  color: Palettes.black,
                                  fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }).toList(),
                          onChanged: viewModel.countryOnChange,
                        ),
                        DropDownInput<Provinces>(
                          name: 'State/Province:',
                          prefixIconPath: MyIcon.imgLocationState,
                          value: viewModel.province,
                          onChanged: (value) => viewModel.provinceOnChange(context, value),
                          items: viewModel.provinces
                              .map((e) => DropdownMenuItem<Provinces>(
                                    value: e,
                                    child: Text(
                                      e.provinceNameEn!,
                                      style: Get.textTheme.bodyMedium!.copyWith(
                                        color: Palettes.black,
                                        fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                        ),
                        DropDownInput<Cities>(
                          name: 'City:',
                          prefixIconPath: MyIcon.imgLocationCity,
                          value: viewModel.city,
                          onChanged: viewModel.cityOnChange,
                          items: viewModel.cities
                              .map((e) => DropdownMenuItem<Cities>(
                                    value: e,
                                    child: Text(
                                      e.cityNameEn!,
                                      style: Get.textTheme.bodyMedium!.copyWith(
                                        color: Palettes.black,
                                        fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ))
                              .toList(),
                        ),
                        const CustomTextField(
                          enabled: false,
                          name: 'Google Address:',
                          prefixIconPath: MyIcon.place,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: viewModel.googleMapOnTap,
                            child: Text(
                              'Open Google Map',
                              style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.white, decoration: TextDecoration.underline, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        const CustomTextField(
                          name: 'Additional  Address:',
                          prefixIconPath: MyIcon.place,
                          widgetMargin: EdgeInsets.symmetric(vertical: 5),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Align(
                      widthFactor: 0.945,
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          Checkbox(
                            fillColor: MaterialStateProperty.all(Palettes.white),
                            focusNode: FocusNode(),
                            focusColor: Palettes.primary,
                            checkColor: Palettes.primary,
                            visualDensity: VisualDensity.standard,
                            value: viewModel.isTerms,
                            onChanged: viewModel.termsOnChange,
                          ),
                          Flexible(
                            child: RichText(
                              text: TextSpan(
                                text: "By checking this, I agree to Neeleez - We Care's ",
                                style: Get.textTheme.bodyMedium!.copyWith(
                                  color: Palettes.white,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Terms of Use',
                                    recognizer: TapGestureRecognizer()..onTap = () => viewModel.termsHandler,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.white,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' & ',
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap = () => viewModel.privacyHandler,
                                    text: 'Privacy Policy',
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.white,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    CustomButton(
                      onTap: () => viewModel.registerOnTap(context),
                      text: 'register'.tr,
                    ),
                    const SizedBox(height: 40),
                    // _bottomLine(),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Change Mobile Number'.tr,
                          style: Get.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Back to Login Screen'.tr,
                          style: Get.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
