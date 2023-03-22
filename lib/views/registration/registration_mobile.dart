part of registration_view;

// ignore: must_be_immutable
class _RegistrationMobile extends StatelessWidget {
  final RegistrationViewModel viewModel;

  const _RegistrationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      height: 220,
                      MyImage.logo,
                    ),
                    GestureDetector(
                      onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
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
                  children: const <Widget>[
                    CustomTextField(
                      name: 'Company Name:',
                      prefixIconPath: MyIcon.officeBuilding,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Business Type:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Gender:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'WhatsApp:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Telephone:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    CustomTextField(
                      name: 'Email:',
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
                    const CustomTextField(
                      name: 'Country:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'State/Province:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'City:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      height: 200,
                      decoration: BoxDecoration(
                        color: Palettes.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login Information:'.tr,
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
                    const CustomTextField(
                      name: 'Username / Email:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const CustomTextField(
                      name: 'Password:',
                      prefixIconPath: MyIcon.password,
                      widgetMargin: EdgeInsets.symmetric(vertical: 5),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onTap: () {},
                      text: 'register'.tr,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                _bottomLine(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
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
