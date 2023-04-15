part of data_listing_view;

// ignore: must_be_immutable
class _DataListingMobile extends StatelessWidget {
  final DataListingViewModel viewModel;

  const _DataListingMobile(this.viewModel);

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
                        padding: const EdgeInsets.only(top: 8),
                        alignment: Alignment.centerLeft,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Palettes.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: Text(
                        'Control Panel',
                        style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
