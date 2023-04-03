part of login_view;

class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  const _LoginMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Get.log(jsonEncode(viewModel.isBusy));
    return Scaffold(
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: 100.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(MyImage.splashBackground1),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Image.asset(
                    height: 115,
                    MyImage.logo,
                  ),
                  SizedBox(height: 5.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        // onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                        child: Text(
                          'logIn'.tr,
                          style: Get.textTheme.displayLarge,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'loginText'.tr,
                          style: Get.textTheme.bodyText2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      CustomTextField(
                        controller: viewModel.usernameController,
                        name: 'Username / Email:',
                        prefixIconPath: MyIcon.user,
                        suffixIconPath: viewModel.usernameController.text.isNotEmpty ? MyIcon.checked1 : '',
                        widgetMargin: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CustomTextField(
                            controller: viewModel.passwordController,
                            name: 'Password',
                            obscureText: true,
                            prefixIconPath: MyIcon.password,
                            widgetMargin: const EdgeInsets.only(bottom: 6),
                            suffixIconPath: viewModel.passwordController.text.length > 5
                                ? MyIcon.checked1
                                : viewModel.passwordController.text.isNotEmpty
                                    ? MyIcon.crossed
                                    : '',
                          ),
                          viewModel.passwordController.text.length > 5
                              ? const SizedBox()
                              : viewModel.passwordController.text.isNotEmpty
                                  ? Text(
                                      'Password must be atLeast 6 characters long',
                                      style: Get.textTheme.bodySmall,
                                      textAlign: TextAlign.right,
                                    )
                                  : const SizedBox(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Align(
                            widthFactor: 0.68.sp,
                            child: Row(
                              children: [
                                Checkbox(
                                  fillColor: MaterialStateProperty.all(Palettes.white),
                                  focusNode: FocusNode(),
                                  focusColor: Palettes.primary,
                                  checkColor: Palettes.primary,
                                  visualDensity: VisualDensity.standard,
                                  value: viewModel.rememberMe,
                                  onChanged: viewModel.onChangeRemember,
                                ),
                                Text(
                                  'Remember Me',
                                  style: Get.textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: viewModel.forgetPasswordHandler,
                            child: Text(
                              'Forgot Password ?',
                              style: Get.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3.h),
                      CustomButton(
                        onTap: viewModel.loginHandler,
                        text: 'loginNow'.tr,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ],
                  ),
                  Align(
                    heightFactor: 1.4.h,
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: Get.textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: viewModel.signUpHandler,
                          child: Text(
                            "Sign Up",
                            style: Get.textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
