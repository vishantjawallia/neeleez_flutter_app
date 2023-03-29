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
        username: (viewModel.user?.firstName ?? "") + "" + (viewModel.user?.lastName ?? ""),
        email: viewModel.user?.email ?? "",
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
