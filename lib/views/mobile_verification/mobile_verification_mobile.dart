// ignore_for_file: prefer_final_fields

part of mobile_verification_view;

// ignore: must_be_immutable
class _MobileVerificationMobile extends StatelessWidget {
  final MobileVerificationViewModel viewModel;

  _MobileVerificationMobile(this.viewModel);
  TextEditingController _phone = TextEditingController();
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
                      'Mobile Verification'.tr,
                      style: Get.textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Enter your Mobile Number below to receive OTP code",
                      style: Get.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: PhoneTextField(
                      controller: _phone,
                      name: 'XXX-XXXXXXX',
                      obscureText: false,
                      prefixIconPath: MyIcon.mobileAnalytics,
                      suffixIconPath: MyIcon.checked,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    "When you will click to Send OTP button, we will send you an OTP on given mobile number for verification",
                    style: Get.textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5.5.h),
                  CustomButton(
                    onTap: viewModel.sendHandler,
                    text: 'Send'.tr,
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
