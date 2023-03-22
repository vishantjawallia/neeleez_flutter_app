part of on_boarding_3_view;

// ignore: must_be_immutable
class _OnBoarding3Mobile extends StatelessWidget {
  final OnBoarding3ViewModel viewModel;

  const _OnBoarding3Mobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: 100.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(MyImage.onBoarding3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Image.asset(
                      height: 220,
                      MyImage.logo,
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Lorem Ipsum',
                          style: Get.textTheme.displayMedium,
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                          style: Get.textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.h),
                        ElevatedButton(
                          onPressed: viewModel.onTap,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Palettes.red),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(horizontal: 38, vertical: 8),
                            ),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Palettes.red,
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            style: Get.textTheme.headlineMedium,
                            'NEXT',
                          ),
                        ),
                      ],
                    ),
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
