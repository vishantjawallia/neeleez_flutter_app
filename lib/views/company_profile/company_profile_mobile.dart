// ignore_for_file: prefer_const_constructors

part of company_profile_view;

// ignore: must_be_immutable
class _CompanyProfileMobile extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  const _CompanyProfileMobile(this.viewModel);

  // static const List<Tab> myTabs = <Tab>[
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: DefaultLayout(
          height: 155,
          child: DefaultTabController(
            length: 7,
            initialIndex: viewModel.tabIndex,
            child: Column(
              children: [
                _appBar(),
                Flexible(
                  child: TabBarView(
                    // dragStartBehavior: DragStartBehavior.start,
                    children: [
                      GeneralInfo(
                        viewModel: viewModel,
                      ),
                      SocialMedia(
                        viewModel: viewModel,
                      ),
                      Location(
                        viewModel: viewModel,
                        countryList: viewModel.countryList,
                        regionInfo: viewModel.regionInfo,
                        cities: viewModel.cities,
                        provinces: viewModel.provinces,
                        country: viewModel.country,
                        city: viewModel.city,
                        province: viewModel.province,
                        // googleAddressController: viewModel.googleAddressController,
                        // additionalAddressController: viewModel.additionalAddressController,
                      ),
                      ContactPersonInfo(
                        viewModel: viewModel,
                      ),
                      BusinessHours(
                        viewModel: viewModel,
                        // onBusinessHoursSave: viewModel.onBusinessHoursSave,
                        // closedTimingList: viewModel.closedTimingList,
                        // onCloseTap: viewModel.onCloseTap,
                        // onEndTimingTap: viewModel.onEndTimingTap,
                        // onStartTimingTap: viewModel.onStartTimingTap,
                        // onOpenTap: viewModel.onOpenTap,
                        // onIconTap: viewModel.onIconTap,
                      ),
                      Packages(
                        viewModel: viewModel,
                        // companyPackage: viewModel.cp?.companyPackage,
                      ),
                      FileSection(
                        viewModel: viewModel,
                        // onUploadMedia: viewModel.onUploadMedia,
                        // companyImages: viewModel.cp?.companyImages ?? [],
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
                    padding: EdgeInsets.only(top: 8),
                    alignment: Alignment.centerLeft,
                    child: Icon(
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
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
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
                onTap: viewModel.onTabChanged,
                tabs: [
                  Tab(
                    icon: Image.asset(MyIcon.profileGeneralInfo),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profileSocialMedia),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profileLocation),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profileContactPersonInfo),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profileBusinessHours),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profilePackage),
                  ),
                  Tab(
                    icon: Image.asset(MyIcon.profileGallery),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
