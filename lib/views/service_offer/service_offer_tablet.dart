part of service_offer_view;

// ignore: must_be_immutable
class _ServiceOfferTablet extends StatelessWidget {
  final ServiceOfferViewModel viewModel;

  _ServiceOfferTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceOfferTablet')),
    );
  }
}