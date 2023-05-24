// ignore_for_file: prefer_final_fields, prefer_const_constructors_in_immutables

part of mobile_verification_view;

// ignore: must_be_immutable
class _MobileVerificationMobile extends StatelessWidget {
  final MobileVerificationViewModel viewModel;

  _MobileVerificationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: ModalProgressHUD(
            load: viewModel.isBusy,
            child: Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
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
                              child: Text(
                                'Mobile Verification'.tr,
                                style: Get.textTheme.displayLarge,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 22),
                              child: Text(
                                'mobileVerificationText'.tr,
                                style: Get.textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            PhoneTextField(
                              keyboardType: TextInputType.phone,
                              onChanged: viewModel.phoneOnChange,
                              inputFormatters: [viewModel.maskFormatter!],
                              countryCode: viewModel.country?.countryCode ?? "+000",
                              name: (viewModel.country?.mobileMaskFormat ?? '+000 00 000 0000').replaceAll('0', 'X'),
                              // name: (viewModel.country!.mobileMask ?? '+000 00 000 0000').substring(viewModel.country!.countryCode!.length, viewModel.country!.mobileMask!.length).replaceAll('0', 'X'),
                              prefixIconColor: Palettes.primary,
                              prefixIconPath: MyIcon.mobileAnalytics,
                              suffixIconPath: viewModel.phoneNumber.length == viewModel.country!.mobileNumberLength!
                                  ? MyIcon.checked1
                                  : viewModel.phoneNumber.isNotEmpty
                                      ? MyIcon.crossed
                                      : '',
                              outlineBorder: true,
                              onCountryCodeTap: () => viewModel.onCountryCodeTap(context, viewModel.countryList!, viewModel.country!.id),
                            ),
                            SizedBox(height: 3.h),
                            CustomButton(
                              onTap: viewModel.sendHandler,
                              text: 'sendOtp'.tr,
                              padding: const EdgeInsets.symmetric(horizontal: 85, vertical: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 34),
                        child: Text(
                          'Back to Login Screen'.tr,
                          style: Get.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
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
