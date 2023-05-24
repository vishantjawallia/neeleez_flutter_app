part of registration_view;

// ignore: must_be_immutable
class _RegistrationMobile extends StatelessWidget {
  final RegistrationViewModel viewModel;

  const _RegistrationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      GestureDetector(
                        // onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                        child: Text(
                          'registerNow'.tr,
                          style: Get.textTheme.displayLarge,
                        ),
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
                      DropDownInput<BusinessTypes>(
                        name: 'Business Sub-Category: ',
                        prefixIconPath: MyIcon.portfolio,
                        value: viewModel.busTypeObj,
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
                      // DropDownInput(
                      //   name: 'Service For:',
                      //   prefixIconPath: MyIcon.sex,
                      //   items: ['hi', 'go']
                      //       .map((e) => DropdownMenuItem(
                      //             value: e,
                      //             child: Text(
                      //               e,
                      //               style: Get.textTheme.bodyMedium!.copyWith(
                      // color: Palettes.black,
                      // fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                      // ),
                      //               overflow: TextOverflow.ellipsis,
                      //             ),
                      //           ))
                      //       .toList(),
                      //   onChanged: (p0) {},
                      // ),
                      const CustomTextField(
                        name: 'Telephone:',
                        prefixIconPath: MyIcon.telephone,
                        widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      ),
                      // const CustomTextField(
                      //   name: 'WhatsApp:',
                      //   prefixIconPath: MyIcon.whatsapp,
                      //   widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      // ),
                      const CustomTextField(
                        name: 'Email:',
                        prefixIconPath: MyIcon.mail,
                        widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      ),
                      const CustomTextField(
                        name: 'Password:',
                        prefixIconPath: MyIcon.mail,
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
                        prefixIconPath: MyIcon.mail,
                        value: viewModel.country,
                        items: viewModel.countries!
                            .map((e) => DropdownMenuItem<Countries>(
                                  value: e,
                                  child: Text(
                                    e.nameEn!,
                                    style: Get.textTheme.bodyMedium!.copyWith(
                                      color: Palettes.black,
                                      fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        onChanged: viewModel.countryOnChange,
                      ),
                      DropDownInput<Provinces>(
                        name: 'State/Province:',
                        prefixIconPath: MyIcon.locationPin,
                        value: viewModel.province,
                        onChanged: viewModel.provinceOnChange,
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
                        // items: dropDownItem([]),
                      ),
                      DropDownInput<Cities>(
                        name: 'City:',
                        prefixIconPath: MyIcon.place,

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
                      // const CustomTextField(
                      //   name: 'Country:',
                      //   prefixIconPath: MyIcon.mail,
                      //   widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      //   suffixIconPath: MyIcon.polygon,
                      // ),
                      // const CustomTextField(
                      //   name: 'State/Province:',
                      //   prefixIconPath: MyIcon.locationPin,
                      //   widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      //   suffixIconPath: MyIcon.polygon,
                      // ),
                      const CustomTextField(
                        name: 'Google Address:',
                        prefixIconPath: MyIcon.place,
                        widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      ),
                      const SizedBox(height: 10),
                      const CustomTextField(
                        name: 'Additional  Address:',
                        prefixIconPath: MyIcon.place,
                        widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      ),
                      // const CustomTextField(
                      //   height: 90,
                      //   name: 'Additional Information:',
                      //   prefixIconPath: MyIcon.information,
                      //   widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      //   prefixPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 30),
                      //   // prefixPadding: EdgeInsets.symmetric(
                      //   //   vertical: 1000,
                      //   // ),
                      //   // maxLength: 500,
                      //   // maxLines: 0,
                      //   // minLines: 10,
                      //   maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 0.5.h),
                      //   decoration: BoxDecoration(
                      //     // color: Palettes.transparent,
                      //     border: Border.all(width: 1, color: Palettes.white),
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      //   child: TextFormField(
                      //     autofocus: false,
                      //     // controller: _desc,
                      //     maxLength: 500,
                      //     maxLines: 20,
                      //     minLines: 10,
                      //     maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      //     // style: MyTextStyle.bodyText1.copyWith(color: Palettes.black),
                      //     decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      //       fillColor: Colors.white,
                      //       filled: true,
                      //       hintText: 'About Me',
                      //       // hintStyle: MyTextStyle.bodyText1.copyWith(color: Palettes.grey),
                      //       errorBorder: InputBorder.none,
                      //       border: const OutlineInputBorder(
                      //         borderSide: BorderSide.none,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      //CustomTextField(
                      //   name: 'City:',
                      //   prefixIconPath: MyIcon.place,
                      //   widgetMargin: EdgeInsets.symmetric(vertical: 5),
                      // ),
                      // Container(
                      //   margin: const EdgeInsets.symmetric(vertical: 5),
                      //   height: 200,
                      //   decoration: BoxDecoration(
                      //     color: Palettes.white,
                      //     borderRadius: BorderRadius.circular(12),
                      //   ),
                      // )
                    ],
                  ),
                  // const SizedBox(height: 30),
                  // Align(
                  //   alignment: Alignment.centerLeft,
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         'Login Information:'.tr,
                  //         style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                  //         textAlign: TextAlign.left,
                  //       ),
                  //       Container(
                  //         alignment: Alignment.centerLeft,
                  //         height: 4,
                  //         width: 35,
                  //         decoration: const BoxDecoration(
                  //           color: Palettes.white,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 50),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //     const CustomTextField(
                  //       name: 'Username / Email:',
                  //       prefixIconPath: MyIcon.user,
                  //       widgetMargin: EdgeInsets.symmetric(vertical: 5),
                  //     ),
                  //     const CustomTextField(
                  //       name: 'Password:',
                  //       prefixIconPath: MyIcon.password,
                  //       widgetMargin: EdgeInsets.symmetric(vertical: 5),
                  //     ),
                  //     const SizedBox(height: 30),
                  //   ],
                  // ),
                  CustomButton(
                    onTap: () {},
                    text: 'register'.tr,
                  ),
                  const SizedBox(height: 40),
                  _bottomLine(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> dropDownItem(e) {
    return e
        .map((value) => DropdownMenuItem(
              value: value,
              child: Text(
                value,
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: Palettes.black,
                  fontWeight: FontWeight.lerp(FontWeight.w500, FontWeight.w600, 0.755),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ))
        .toList();
  }

  _bottomLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${'alreadyHaveAnAccount'.tr} ',
          style: Get.textTheme.bodyMedium,
        ),
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Text(
            'logIn'.tr,
            style: Get.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
