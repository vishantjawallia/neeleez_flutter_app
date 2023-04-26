part of package_order_summary_view;

// ignore: must_be_immutable
class _PackageOrderSummaryMobile extends StatelessWidget {
  final PackageOrderSummaryViewModel viewModel;

  _PackageOrderSummaryMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          height: 150,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(22, 18, 22, 0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Container(
                        padding: EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Palettes.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Text(
                        'Order Summary',
                        style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 82.h,
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    children: <Widget>[],
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
