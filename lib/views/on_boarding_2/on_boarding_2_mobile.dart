part of on_boarding_2_view;

class _OnBoarding2Mobile extends StatelessWidget {
  final OnBoarding2ViewModel viewModel;

  const _OnBoarding2Mobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(MyImage.onBoarding2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Image.asset(height: 125, MyImage.logo),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Lorem Ipsum',
                        style: Get.textTheme.headline3!.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Get.textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 6.h),
                      ElevatedButton(
                        onPressed: viewModel.onTap,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Palettes.red),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
                          ),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                              side: const BorderSide(
                                color: Palettes.red,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
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
    );
  }
}
