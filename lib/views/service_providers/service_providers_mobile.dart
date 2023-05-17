part of service_providers_view;

// ignore: must_be_immutable
class _ServiceProvidersMobile extends StatelessWidget {
  final ServiceProvidersViewModel viewModel;

  _ServiceProvidersMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          height: 156,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                _appBar(),
                Container(
                  height: 82.h,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 20),
                  child: const NoStaffItem(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.only(top: 18),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Palettes.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Staff Management (0/3)',
                style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () => Get.to(() => StaffProfileView()),
                child: const Icon(
                  Icons.add_circle_outline_sharp,
                  color: Palettes.white,
                  size: 50,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
