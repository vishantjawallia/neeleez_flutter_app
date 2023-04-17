// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_literals_to_create_immutables, void_checks, sized_box_for_whitespace, unnecessary_cast

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
        viewModel,
        onItemTap: (Map obj) {
          _scaffoldKey.currentState!.closeDrawer();
          return viewModel.onDrawerItemTap(context, obj);
        },
      ),
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: DashboardLayout(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _topBox(context),
                  _userDetail(),
                  const SizedBox(height: 20),
                  _box1(),
                  const SizedBox(height: 10),
                  _box2(),
                  const SizedBox(height: 20),
                  _box4(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _box4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BoxWidget(
          color: Palettes.primary,
          icon: "",
          dsc: "0",
          head1: "Clicks",
          head2: "Total Clicks",
        ),
        BoxWidget(
          color: Palettes.red,
          icon: "",
          dsc: "0",
          head1: "Appointments",
          head2: "Total Appointments",
        ),
      ],
    );
  }

  Material _box2() {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Get.to(() => PackageSubscriptionsView()),
        child: Container(
          padding: EdgeInsets.all(8),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: Radius.circular(14),
            dashPattern: [4, 4],
            color: Palettes.yellowDark,
            strokeWidth: 1.5,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Entry Package'.tr,
                    style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800, color: Palettes.yellowDark),
                    textAlign: TextAlign.left,
                  ),
                  Divider(
                    height: 3,
                    color: Palettes.black,
                    thickness: 1,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Renew Date: 09-29-2021'.tr,
                    style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w700, color: Palettes.grey1),
                    textAlign: TextAlign.left,
                  ),
                  // const SizedBox(height: 6),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _box1() {
    return Container(
      height: 100,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 90.w,
                height: 63,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
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
                    stops: [0.1, 0.3, 0.5, 0.7, 1],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '300'.tr,
                      style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w900, color: Color.fromARGB(255, 255, 214, 142)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      'Point Earned'.tr,
                      style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
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
              child: Image.asset(
                height: 90,
                MyImage.imgDashboard1,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ],
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
              } catch (e) {
                print(e);
              }
              // viewModel.loadItems();
              // Get.
            },
            child: Icon(Icons.menu, color: Palettes.white),
          ),
          Row(
            children: [
              Material(
                elevation: 20,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => viewModel.onLanguageTap(_),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Row(
                      children: <Widget>[
                        UrlImage(
                          height: 20,
                          url: (viewModel.lang?['iconImage']) ?? null,
                        ),
                        SizedBox(width: 4),
                        Container(
                          child: Text(
                            Get.locale!.languageCode.toString().toUpperCase(),
                            style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.black, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              GestureDetector(
                onTap: viewModel.onNotificationTap,
                child: Icon(Icons.notification_add, color: Palettes.white),
              ),
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
              viewModel.user?.firstName ?? "",
              // ''.tr,
              style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            )
          ],
        ),
        UrlImage(
          height: 56,
          width: 56,
          url: viewModel.user?.customerImage?.imageFileName,
        ),
      ],
    );
  }
}
