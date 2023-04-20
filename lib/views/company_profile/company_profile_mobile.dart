// ignore_for_file: prefer_const_constructors

part of company_profile_view;

// ignore: must_be_immutable
class _CompanyProfileMobile extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  const _CompanyProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 155,
        child: DefaultTabController(
          length: 7,
          child: Column(
            children: [
              Padding(
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
              ),
              Flexible(
                child: TabBarView(
                  dragStartBehavior: DragStartBehavior.start,
                  children: [
                    GeneralInfo(
                      isFreelancer: viewModel.isFreelancer,
                      companyNameController: viewModel.companyNameController,
                      taglineController: viewModel.taglineController,
                      companyEstablishmentYearController: viewModel.companyEstablishmentYearController,
                      businessCategory: viewModel.businessCategory,
                      businessCategoryList: viewModel.businessCategoryList,
                      businessSubCategorySelectedList: viewModel.businessSubCategorySelectedList,
                      businessSubCategoryList: viewModel.businessSubCategoryList,
                      serviceFor: viewModel.serviceFor,
                      serviceForList: viewModel.serviceForList,
                      whatsAppNoController: viewModel.whatsAppNoController,
                      telephoneController: viewModel.telephoneController,
                      emailController: viewModel.emailController,
                      websiteController: viewModel.websiteController,
                      amentiasList: viewModel.amentiasList,
                      amentiasSelectedList: viewModel.amentiasSelectedList,
                      onSave: viewModel.onGeneralSave,
                      additionalInfoController: viewModel.additionalInfoController,
                      onFreelancerChange: viewModel.onFreelancerChange,
                      companyEstablishmentYearDate: viewModel.companyEstablishmentYearDate,
                    ),
                    SocialMedia(
                      facebookController: viewModel.facebookController,
                      twitterController: viewModel.twitterController,
                      instagramController: viewModel.instagramController,
                      linkedInController: viewModel.linkedInController,
                      onSocialSave: viewModel.onSocialSave,
                    ),
                    Location(
                      countryList: viewModel.countryList,
                      stateList: viewModel.stateList,
                      cityList: viewModel.cityList,
                      countrySelected: viewModel.countrySelected,
                      stateSelected: viewModel.stateSelected,
                      citySelected: viewModel.citySelected,
                      googleAddressController: viewModel.googleAddressController,
                      additionalAddressController: viewModel.additionalAddressController,
                    ),
                    ContactPersonInfo(
                      fullNameController: viewModel.fullNameController,
                      mobileNoController: viewModel.mobileNoController,
                      countryCodeController: viewModel.countryCodeController,
                      emailController: viewModel.emailController,
                      isDepartment: viewModel.isDepartment,
                      isDesignation: viewModel.isDesignation,
                      onContactSave:viewModel.onContactSave,
                    ),
                    BusinessHours(
                      onBusinessHoursSave:viewModel.onBusinessHoursSave,
                    ),
                    Packages(),
                    FileSection(
                      onUploadMedia:viewModel.onUploadMedia,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
