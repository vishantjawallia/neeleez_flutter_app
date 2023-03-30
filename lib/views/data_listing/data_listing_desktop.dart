part of data_listing_view;

// ignore: must_be_immutable
class _DataListingDesktop extends StatelessWidget {
  final DataListingViewModel viewModel;

  _DataListingDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DataListingDesktop')),
    );
  }
}