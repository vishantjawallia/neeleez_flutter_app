part of change_password_view;

// ignore: must_be_immutable
class _ChangePasswordMobile extends StatelessWidget {
  final ChangePasswordViewModel viewModel;

  _ChangePasswordMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    // Get.log(jsonEncode(viewModel.isBusy));
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
              padding: const EdgeInsets.only(left: 26, right: 26, top: 36),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _upperNav(),
                  const SizedBox(height: 30),
                  _detailBox(),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, bottom: 2),
                      child: Text(
                        'Previous Password'.tr,
                        style: Get.textTheme.bodySmall,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const CustomTextField(
                    prefixIconPath: MyIcon.password,
                    name: 'Previous Password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14, top: 5),
                      child: Text(
                        'Password must be atLeast 6 characters long',
                        style: Get.textTheme.bodySmall!.copyWith(fontSize: 10),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, bottom: 2),
                      child: Text(
                        'New Password'.tr,
                        style: Get.textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const CustomTextField(
                    prefixIconPath: MyIcon.password,
                    name: 'New Password',
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 14, top: 5),
                      child: Text(
                        'Password must be atLeast 6 characters long',
                        style: Get.textTheme.bodySmall!.copyWith(fontSize: 10),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 2, bottom: 2),
                      child: Text(
                        'Confirm Password'.tr,
                        style: Get.textTheme.bodyText2,
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),
                  const CustomTextField(
                    prefixIconPath: MyIcon.password,
                    name: 'Confirm Password',
                    widgetMargin: EdgeInsets.only(bottom: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomButton(
                        width: 168,
                        text: 'Cancel',
                        onTap: () {},
                      ),
                      CustomButton(
                        width: 168,
                        text: 'Change Password',
                        textColor: Palettes.white,
                        backgroundColor: Colors.amber.shade900,
                        borderColor: Colors.amber.shade900,
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox _detailBox() {
    return SizedBox(
      height: 134,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 300,
                height: 90,
                padding: EdgeInsets.only(bottom: 8),
                decoration: BoxDecoration(
                  color: Palettes.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Test Law',
                      style: Get.textTheme.headlineSmall!.copyWith(color: Palettes.black, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'raheel@ymail.com',
                      style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.black),
                    )
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 1,
            right: 110,
            child: Container(
              height: 80,
              width: 80,
              child: UrlImage(
                url: '',
                // url: viewModel.user?.customerImage?.imageFileName,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _upperNav() {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Palettes.white,
            size: 16,
          ),
        ),
        const SizedBox(width: 14),
        Text(
          'Change Password',
          style: Get.textTheme.headlineMedium,
        ),
      ],
    );
  }
}
