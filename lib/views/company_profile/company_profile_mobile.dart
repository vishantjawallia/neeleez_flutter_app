part of company_profile_view;

class _CompanyProfileMobile extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  const _CompanyProfileMobile(this.viewModel);

  // List<Widget> _data = [
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: DefaultLayout(
          height: 155,
          child: DefaultTabController(
            length: viewModel.tabController.length,
            initialIndex: viewModel.tabController.index,
            child: Column(
              children: [
                _appBar(),
                Flexible(
                  child: TabBarView(
                    controller: viewModel.tabController,
                    dragStartBehavior: DragStartBehavior.start,
                    children: [
                      GeneralInfo(viewModel),
                      SocialMedia(viewModel),
                      Location(viewModel),
                      ContactPersonInfo(viewModel),
                      BusinessHours(viewModel),
                      Packages(viewModel),
                      FileSection(viewModel),
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

  Padding _appBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
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
                Container(
                  width: 94,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Palettes.white),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.cancel_outlined,
                        color: Palettes.white,
                        size: 16,
                      ),
                      Text(
                        'Account',
                        style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(top: 12, bottom: 4),
            child: Text(
              'Company Profile',
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
                controller: viewModel.tabController,
                // onTap: viewModel.onTabChanged,
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
