part of promo_codes_view;

// ignore: must_be_immutable
class _PromoCodesTablet extends StatelessWidget {
  final PromoCodesViewModel viewModel;

  const _PromoCodesTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('PromoCodesTablet')),
    );
  }
}