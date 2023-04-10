part of package_subscriptions_view;

// ignore: must_be_immutable
class _PackageSubscriptionsMobile extends StatelessWidget {
  final PackageSubscriptionsViewModel viewModel;

  _PackageSubscriptionsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            fit: StackFit.passthrough,
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.asset(
                    MyImage.dashBack,
                    fit: BoxFit.fitWidth,
                    width: double.infinity,
                    height: 135,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 40, left: 22, right: 22),
                child: _appBar(),
              ),
            ],
          ),
          Flexible(
            fit: FlexFit.tight,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 22, right: 22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Text(
                        'Subscribe or Upgrade Now',
                        style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                      ),
                    ),
                    _packageListing(),
                    _packageInfo(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Material _packageInfo() {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 100.w,
        child: Column(
          children: [
            Container(
              height: 130,
              // margin: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Primo Package',
                    style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w800, fontSize: 24),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '118800 Dh ',
                        style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w700),
                      ),
                      Text(
                        '(per year)',
                        style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text(
                    'First 3 Months Free ',
                    style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Container(
              width: 100.w,
              margin: const EdgeInsets.only(top: 6),
              padding: const EdgeInsets.symmetric(vertical: 4),
              color: Palettes.greyPrimary.withOpacity(0.4),
              child: Text(
                'Services/Features',
                style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w700, color: Palettes.black),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Service Listing',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Profile Page',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Text(
                          '10 Views (Per Day)',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Services /  Menu / Price List',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Offers / Discounts',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Online Payment',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Online Appointment',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Service Providers / Users',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Text(
                          '2',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Ecommerce',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.checked1,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Media Gallery',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Text(
                          '300 MB',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Presence On Map',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Text(
                          '20 Clicks (Per Day)',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Customer Notification',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.crossed,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Priority Search',
                          style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500, color: Palettes.black),
                        ),
                        Image.asset(
                          MyIcon.crossed,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 26),
              child: CustomButton(
                width: 180,
                text: 'Subscribe Now',
                textColor: Palettes.white,
                backgroundColor: Colors.amber,
                borderColor: Colors.amber,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Align _packageListing() {
    return Align(
      alignment: Alignment.center,
      child: Container(
          height: 90,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.green,
                    )),
                alignment: Alignment.center,
                width: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Entry',
                      style: Get.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                    ),
                    Container(
                      color: Palettes.white,
                      width: 90,
                      child: Text(
                        '708,00 Dh',
                        style: Get.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w800, color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(
                      '(per year)',
                      style: Get.textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500, fontSize: 10),
                    )
                  ],
                ),
              );
            },
          )),
    );
  }

  Column _appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
            'Package Subscriptions',
            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
