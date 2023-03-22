part of login_view;

// ignore: must_be_immutable
class _LoginMobile extends StatelessWidget {
  final LoginViewModel viewModel;

  _LoginMobile(this.viewModel);

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
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
              image: AssetImage(MyImage.splashBackground1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                Image.asset(
                  height: 220,
                  MyImage.logo,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                      child: Text(
                        'logIn'.tr,
                        style: Get.textTheme.displayLarge,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sedadipiscing elit",
                      style: Get.textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36),
                    CustomTextField(
                      controller: _email,
                      name: 'Username / Email:',
                      prefixIconPath: MyIcon.user,
                      suffixIconPath: MyIcon.checked1,
                    ),
                    const SizedBox(height: 12),
                    CustomTextField(
                      controller: _password,
                      name: 'Password',
                      obscureText: true,
                      prefixIconPath: MyIcon.password,
                      suffixIconPath: MyIcon.checked1,
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
                          onTap: () {},
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
                    ),
                  ],
                ),
                Align(
                  heightFactor: 4.5.sp,
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
    );
  }
}
