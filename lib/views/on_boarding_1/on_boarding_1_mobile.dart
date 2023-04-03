part of on_boarding_1_view;

// ignore: must_be_immutable
class _OnBoarding1Mobile extends StatelessWidget {
  final OnBoarding1ViewModel viewModel;

  const _OnBoarding1Mobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              MyImage.onBoarding1,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Hero(
                    tag: 'logo',
                    child: Image.asset(height: 115, MyImage.logo, fit: BoxFit.cover),
                  ),
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
                        style: Get.textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Get.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        onPressed: viewModel.onTap,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Palettes.red),
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 42, vertical: 10),
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
