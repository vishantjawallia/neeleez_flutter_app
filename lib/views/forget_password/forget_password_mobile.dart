part of forget_password_view;

// ignore: must_be_immutable
class _ForgetPasswordMobile extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

  _ForgetPasswordMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              MyImage.splashBackground1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              Image.asset(
                height: 115,
                MyImage.logo,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                    child: Text(
                      'forgetPass'.tr,
                      style: Get.textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      'forgetPassText'.tr,
                      style: Get.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  const CustomTextField(
                    name: 'Email',
                    prefixIconPath: MyIcon.mail,
                    prefixIconColor: Palettes.black,
                    widgetMargin: EdgeInsets.symmetric(vertical: 5),
                  ),
                  // PhoneTextField(
                  //   controller: _phone,
                  //   name: 'XXX-XXXXXXX',
                  //   obscureText: false,
                  //   prefixIconPath: MyIcon.mobileAnalytics,
                  //   suffixIconPath: MyIcon.checked,
                  // ),
                  SizedBox(height: 3.h),
                  CustomButton(
                    onTap: viewModel.sendHandler,
                    text: 'send'.tr.capitalizeFirst,
                    padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
