// ignore_for_file: prefer_const_constructors

part of notifications_view;

// ignore: must_be_immutable
class _NotificationsMobile extends StatelessWidget {
  final NotificationsViewModel viewModel;

  _NotificationsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                Column(
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
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Notifications',
                            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.delete,
                            color: Palettes.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Container(
                  height: 82.h,
                  padding: EdgeInsets.only(top: 20),
                  child: Center(
                    child: Text(
                      'No Notifications Yet',
                      style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
                    ),
                  ),
                ),
                // Text(
                //   'No Notifications Yet',
                //   style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
