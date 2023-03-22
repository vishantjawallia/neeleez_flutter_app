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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                MyImage.splashBackground1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  height: 220,
                  alignment: Alignment.bottomCenter,
                  MyImage.logo,
                ),
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
                    const SizedBox(height: 30),
                    Text(
                      "Enter your Mobile Number below to receive OTP code",
                      style: Get.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    PhoneTextField(
                      controller: _phone,
                      name: 'XXX-XXXXXXX',
                      obscureText: false,
                      prefixIconPath: MyIcon.mobileAnalytics,
                      suffixIconPath: MyIcon.checked,
                    ),
                    const SizedBox(height: 36),
                    Text(
                      "When you will click to Send OTP button, we will send you an OTP on given mobile number for verification",
                      style: Get.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 3.h),
                    CustomButton(
                      onTap: viewModel.sendHandler,
                      text: 'Send'.tr,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
