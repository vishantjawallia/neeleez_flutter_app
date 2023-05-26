part of select_address_view;

// ignore: must_be_immutable
class _SelectAddressMobile extends StatelessWidget {
  final SelectAddressViewModel viewModel;

  const _SelectAddressMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 140,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            children: [
              _appBar(),
              Flexible(
                child: Center(
                  child: Text(
                    'No Notifications Yet',
                    style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600, color: Palettes.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            InkWell(
              onTap: viewModel.pickHandler,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Palettes.white),
                  borderRadius: BorderRadius.circular(4),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Pick this',
                  style: Get.textTheme.bodyMedium!,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Select Address',
            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
