part of staff_profile_view;

// ignore: must_be_immutable
class _StaffProfileMobile extends StatelessWidget {
  final StaffProfileViewModel viewModel;

  _StaffProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: DefaultLayout(
          height: 155,
          child: DefaultTabController(
            length: 7,
            child: Column(
              children: [
                _appBar(context),
                Flexible(
                  child: TabBarView(
                    children: [
                      TabBar1(viewModel),
                      TabBar1(viewModel),
                      TabBar1(viewModel),
                      TabBar1(viewModel),
                      TabBar1(viewModel),
                      TabBar1(viewModel),
                      TabBar1(viewModel),
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

  Padding _appBar(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: InkWell(
              onTap: () => Get.back(),
              child: Container(
                padding: const EdgeInsets.only(top: 8),
                alignment: Alignment.centerLeft,
                child: const Icon(
                  Icons.arrow_back_ios,
                  color: Palettes.white,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Text(
              'Staff Profile',
              style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Material(
            elevation: 20,
            child: Container(
              height: 45,
              color: Palettes.white,
              child: TabBar(
                indicatorWeight: 5,
                indicatorColor: Palettes.red,
                onTap: (value) => viewModel.onTabChanged(context, value),
                tabs: [
                  Tab(icon: Image.asset(MyIcon.profileGeneralInfo)),
                  Tab(icon: Image.asset(MyIcon.profileSocialMedia)),
                  Tab(icon: Image.asset(MyIcon.profileLocation)),
                  Tab(icon: Image.asset(MyIcon.profileContactPersonInfo)),
                  Tab(icon: Image.asset(MyIcon.profileBusinessHours)),
                  Tab(icon: Image.asset(MyIcon.profilePackage)),
                  Tab(icon: Image.asset(MyIcon.profileGallery)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
