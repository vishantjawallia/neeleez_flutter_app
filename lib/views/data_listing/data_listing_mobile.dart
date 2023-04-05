part of data_listing_view;

// ignore: must_be_immutable
class _DataListingMobile extends StatelessWidget {
  final DataListingViewModel viewModel;

  _DataListingMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DataListingMobile',style: TextStyle(
          color: Palettes.black,
        ),)),
    );
  }
}