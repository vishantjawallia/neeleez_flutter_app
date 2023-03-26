part of verify_otp_view;

// ignore: must_be_immutable
class _VerifyOtpMobile extends StatelessWidget {
  final VerifyOtpViewModel viewModel;

  _VerifyOtpMobile(this.viewModel);

  final TextEditingController _otp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Center(child: Text('VerifyOtpMobile')),
    // );
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
                      'Verify OTP'.tr,
                      style: Get.textTheme.displayLarge,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Text(
                      'Provide 6 digit OTP (One Time Password) we just sent you on +212 242-352345'.tr,
                      style: Get.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Pinput(
                    controller: _otp,
                    onCompleted: (pin) => print(pin),
                    length: 6,
                    obscureText: false,
                    // textInputAction: Text,
                    defaultPinTheme: PinTheme(
                      height: 100,
                      width: 200,
                      textStyle: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black, fontWeight: FontWeight.w600),
                      margin: const EdgeInsets.symmetric(vertical: 36),
                      decoration: BoxDecoration(
                        color: Palettes.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  StreamBuilder<int?>(
                      stream: viewModel.timerStream(),
                      builder: (context, snapshot) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 30),
                          child: Text(
                            '00:${snapshot?.data ?? 00}',
                            style: Get.textTheme.bodyLarge,
                          ),
                        );
                      }),
                  // SizedBox(height: 3.h),
                  CustomButton(
                    onTap: viewModel.verifyHandler,
                    text: 'Verify'.tr,
                    padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 12),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 34),
                child: Text(
                  'Change Mobile Number'.tr,
                  style: Get.textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
