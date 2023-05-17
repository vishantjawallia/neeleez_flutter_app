part of service_offer_view;

// ignore: must_be_immutable
class _ServiceOfferMobile extends StatelessWidget {
  final ServiceOfferViewModel viewModel;

  _ServiceOfferMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceOfferMobile')),
    );
  }
}