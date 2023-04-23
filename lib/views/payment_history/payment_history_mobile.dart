part of payment_history_view;

// ignore: must_be_immutable
class _PaymentHistoryMobile extends StatelessWidget {
  final PaymentHistoryViewModel viewModel;

  _PaymentHistoryMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          height: 156,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              children: [
                _appBar(),
                Container(
                  height: 82.h,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      dateSelectionBox(),
                      Flexible(
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: Image.asset(
                              MyImage.imgEmptyPayment2x,
                              height: 140,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row dateSelectionBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From Date',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Palettes.grey3, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    '03-23-2023',
                    style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.grey3),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(width: 26),
                  const CircleAvatar(
                    backgroundColor: Palettes.greyPrimary,
                    minRadius: 10,
                    maxRadius: 14,
                    child: ImageIcon(
                      AssetImage(MyIcon.serviceStart3x),
                      color: Palettes.black,
                      size: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'To Date',
              style: Get.textTheme.bodyLarge!.copyWith(color: Palettes.grey3),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Palettes.grey3, width: 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 24),
                  Text(
                    '03-23-2023',
                    style: Get.textTheme.bodyMedium!.copyWith(color: Palettes.grey3),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(width: 26),
                  const CircleAvatar(
                    backgroundColor: Palettes.greyPrimary,
                    minRadius: 10,
                    maxRadius: 14,
                    child: ImageIcon(
                      AssetImage(MyIcon.serviceStart3x),
                      color: Palettes.black,
                      size: 10,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 1.8,
          child: CircleAvatar(
            backgroundColor: Palettes.greyPrimary,
            minRadius: 10,
            maxRadius: 16,
            child: Icon(
              Icons.search,
              color: Palettes.black,
              size: 18,
            ),
          ),
        )
      ],
    );
  }

  Column _appBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: Container(
            padding: const EdgeInsets.only(top: 18),
            alignment: Alignment.centerLeft,
            child: const Icon(
              Icons.arrow_back_ios,
              color: Palettes.white,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            'Payment History',
            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }
}
