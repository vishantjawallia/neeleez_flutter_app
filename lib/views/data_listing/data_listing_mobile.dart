// ignore_for_file: prefer_const_constructors

part of data_listing_view;

// ignore: must_be_immutable
class _DataListingMobile extends StatelessWidget {
  final DataListingViewModel viewModel;

  const _DataListingMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultLayout(
        height: 155,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              Container(
                height: 82.h,
                alignment: Alignment.center,
                padding: const EdgeInsets.only(top: 30),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Align(
                        alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Company'.tr,
                              style: Get.textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Palettes.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 3,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Palettes.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomListTile(
                        text: 'Department',
                        imagePathBackground: Palettes.yellow,
                        imagePath: MyImage.contolDepartment2x,
                        onTap: viewModel.departmentOnTap,
                      ),

                      CustomListTile(
                        text: 'Designation',
                        imagePathBackground: Colors.red,
                        imagePath: MyImage.contolDesignation,
                        onTap: viewModel.designationOnTap,
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Helper.isRtl() ? Alignment.centerLeft : Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Services'.tr,
                              style: Get.textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Palettes.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 3,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: Palettes.red,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomListTile(
                        text: 'Group',
                        imagePathBackground: Colors.purple,
                        imagePath: MyImage.contolGrouper,
                        onTap: viewModel.groupOnTap,
                      ),
                      CustomListTile(
                        text: 'Format',
                        imagePathBackground: Colors.blue,
                        imagePath: MyImage.contolFormat,
                        onTap: viewModel.formatOnTap,
                      ),
                      CustomListTile(
                        text: 'Service',
                        imagePathBackground: Colors.orange,
                        imagePath: MyImage.contolService,
                        onTap: viewModel.serviceOnTap,
                      ),
                      CustomListTile(
                        text: 'Service Format',
                        imagePathBackground: Colors.green,
                        imagePath: MyImage.contolServiceFormat,
                        onTap: viewModel.serviceFormatOnTap,
                      ),
                      CustomListTile(
                        text: 'Service Composition',
                        imagePathBackground: Colors.pink,
                        imagePath: MyImage.contolServicePrice,
                        onTap: viewModel.serviceCompositionOnTap,
                      ),
                      CustomListTile(
                        text: 'Service Offer',
                        imagePathBackground: Color.fromARGB(255, 45, 194, 159),
                        imagePath: MyImage.contolOffers,
                        onTap: () => viewModel.serviceOfferOnTap(context),
                      ),

                      // Material(
                      //   elevation: 6,
                      //   borderRadius: BorderRadius.circular(6),
                      //   child: Container(
                      //     padding: EdgeInsets.symmetric(vertical: 16,),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Image.asset(
                      //           MyIcon.checked1,
                      //         ),
                      //         Container(
                      //           alignment: Alignment.center,
                      //           child: Text(
                      //             'Department'.tr,
                      //             style: Get.textTheme.titleLarge!.copyWith(
                      //               color: Palettes.black,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // )
                    ],
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
          padding: const EdgeInsets.only(top: 18),
          child: Text(
            'Control Panel',
            style: Get.textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
