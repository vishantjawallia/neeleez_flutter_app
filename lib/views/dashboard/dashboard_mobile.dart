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
      appBar: AppBar(
        title: Text('Hello'),
      ),
      body: Container(
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
    );
  }
}
