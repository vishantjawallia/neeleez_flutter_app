part of promo_codes_view;

// ignore: must_be_immutable
class _PromoCodesMobile extends StatelessWidget {
  final PromoCodesViewModel viewModel;

  const _PromoCodesMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        load: viewModel.isBusy,
        child: DefaultLayout(
          height: 168,
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
                        child: InkWell(
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
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Promo Codes',
                              style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                            ),
                            const Icon(
                              Icons.add_circle_outline_sharp,
                              color: Palettes.white,
                              size: 48,
                            ),
                          ],
                        ),
                      ),
                      // Container(
                      //   alignment: Alignment.centerLeft,
                      //   padding: const EdgeInsets.only(top: 12, bottom: 4),
                      //   child: Text(
                      //     'Promo Codes',
                      //     style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
                      //   ),
                      // ),
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
                            labelColor: Palettes.red,
                            unselectedLabelColor: Palettes.black,
                            onTap: viewModel.onTabChanged,
                            labelStyle: Get.textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w600),
                            tabs: const [
                              Tab(text: 'Activated'),
                              Tab(text: 'Redeemed'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Flexible(
                  child: TabBarView(
                    dragStartBehavior: DragStartBehavior.start,
                    children: [Activated(), Redeemed()],
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
