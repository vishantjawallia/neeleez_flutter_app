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
      drawer: const CustomDrawer(),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEnableOpenDragGesture: true,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Palettes.white,
          height: 100.h,
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     fit: BoxFit.fill,
          //     image: AssetImage(
          //       MyImage.splashBackground,
          //     ),
          //   ),
          // ),
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                height: 25.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage(
                      MyImage.splashBackground,
                    ),
                  ),
                  color: Palettes.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    try {
                      _scaffoldKey.currentState!.openDrawer();
                    } catch (e) {
                      Get.log("$e");
                    }
                  },
                  child: Center(
                    child: Text(
                      'Dashboard',
                      style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 26.h,
                width: 100.w,
                height: 100.h,
                child: Container(
                  color: Colors.transparent,
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.fill,
                  //     image: AssetImage(
                  //       MyImage.splashBackground,
                  //     ),
                  //   ),
                  // ),
                  child: Center(
                    child: Text(
                      'Dashboard',
                      style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.h,
                width: 100.w,
                padding: EdgeInsets.symmetric(vertical: 50),
                color: Colors.transparent,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          try {
                            _scaffoldKey.currentState!.openDrawer();
                          } catch (e) {
                            Get.log("$e");
                          }
                        },
                        child: Text(
                          'Dashboard',
                          style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
                        ),
                      ),
                    ],
                    // Text(
                    //   'Dashboard',
                    //   style: Get.textTheme.displayLarge!.copyWith(color: Palettes.red),
                    // ),
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
