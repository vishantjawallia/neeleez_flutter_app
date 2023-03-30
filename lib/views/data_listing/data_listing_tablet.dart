part of data_listing_view;

// ignore: must_be_immutable
class _DataListingTablet extends StatelessWidget {
  final DataListingViewModel viewModel;

  _DataListingTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DataListingTablet')),
    );
  }
}