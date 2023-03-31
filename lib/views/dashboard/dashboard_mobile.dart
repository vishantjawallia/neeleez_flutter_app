// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

part of dashboard_view;

// ignore: must_be_immutable
class _DashboardMobile extends StatelessWidget {
  final DashboardViewModel viewModel;

  _DashboardMobile(this.viewModel);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(
        username: (viewModel.user.firstName ?? "") + "" + (viewModel.user.lastName ?? ""),
        email: viewModel.user.email ?? "",
        onItemTap: viewModel.onDrawerItemTap,
      ),
      body: DashboardLayout(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _topBox(context),
              _userDetail(),
              Container(
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 90.w,
                          // height: 20,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            // color: Palettes.red,
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                colors: [
                                  Palettes.red,
                                  Palettes.red.withOpacity(0.75),
                                  Palettes.red.withOpacity(0.55),
                                  Palettes.red.withOpacity(0.45),
                                  Colors.transparent,
                                ],
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                stops: [
                                  0.1,
                                  0.3,
                                  0.5,
                                  0.7,
                                  1,
                                ]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                '300'.tr,
                                style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                'Point Earned'.tr,
                                style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 1,
                      child: Container(
                        height: 90,
                        // height: 60,
                        child: Image.asset(MyImage.imgDashboard1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _topBox(_) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
            onTap: () {
              try {
                _scaffoldKey.currentState!.openDrawer();
                // Scaffold.of(_).openDrawer();
                // _scaffoldKey.currentState!.openDrawer();
              } catch (e) {
                print(e);
              }
              // Get.
            },
            child: Icon(Icons.menu, color: Palettes.white),
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Palettes.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                    ),
                    SizedBox(width: 4),
                    Container(
                      child: Text(
                        'EN',
                        style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12),
              Icon(Icons.notification_add, color: Palettes.white),
            ],
          ),
          // IconButton(
          //   padding: EdgeInsets.zero,
          //   onPressed: () {},
          //   icon: Icon(Icons.menu),
          // ),
        ],
      ),
    );
  }

  Row _userDetail() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Afternoon'.tr,
              style: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            Text(
              'Test Law'.tr,
              style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )
          ],
        ),
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Palettes.red,
            border: Border.all(color: Palettes.white),
          ),
        ),
      ],
    );
  }
}
