part of service_offer_view;

// ignore: must_be_immutable
class _ServiceOfferDesktop extends StatelessWidget {
  final ServiceOfferViewModel viewModel;

  _ServiceOfferDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceOfferDesktop')),
    );
  }
}