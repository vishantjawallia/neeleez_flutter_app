part of promo_codes_view;

// ignore: must_be_immutable
class _PromoCodesDesktop extends StatelessWidget {
  final PromoCodesViewModel viewModel;

  _PromoCodesDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PromoCodesDesktop')),
    );
  }
}