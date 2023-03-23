// ignore_for_file: prefer_const_constructors_in_immutables

part of splash_view;

// ignore: must_be_immutable
class _SplashMobile extends StatelessWidget {
  final SplashViewModel viewModel;

  _SplashMobile(this.viewModel);

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 46.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Hero(
                      tag: 'logo',
                      child: Image.asset(
                        height: 175,
                        MyImage.logo,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.locale == const Locale('ur', 'PK') ? Get.updateLocale(const Locale('en', 'US')) : Get.updateLocale(const Locale('ur', 'PK')),
                    child: Text(
                      'businessApp'.tr,
                      style: Get.textTheme.displayLarge,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator(
                    color: Palettes.white,
                    strokeWidth: 3,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  'preparingApplicationEnvironment'.tr,
                  style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
