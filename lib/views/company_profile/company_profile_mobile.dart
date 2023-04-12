part of company_profile_view;

// ignore: must_be_immutable
class _CompanyProfileMobile extends StatelessWidget {
  final CompanyProfileViewModel viewModel;

  _CompanyProfileMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 155,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: DefaultTabController(
            length: 6,
            child: Column(
              children: [
                Column(
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
                                // const SizedBox(width: 3),
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
                      padding: const EdgeInsets.only(top: 12),
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
                        height: 50,
                        color: Palettes.white,
                        child: TabBar(
                          tabs: [
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_car)),
                            Tab(icon: Icon(Icons.directions_transit)),
                            Tab(icon: Icon(Icons.directions_bike)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text(
                          "Icons.directions_car",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Icons.directions_transit",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Icons.directions_bike",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Icons.directions_bike",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Icons.directions_bike",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Icons.directions_bike",
                          style: Get.textTheme.headlineMedium!.copyWith(color: Palettes.black),
                        ),
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
}
