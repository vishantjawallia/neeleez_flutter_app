part of promo_codes_view;

// ignore: must_be_immutable
class _PromoCodesMobile extends StatelessWidget {
  final PromoCodesViewModel viewModel;

  _PromoCodesMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'PromoCodesMobile',
        style: TextStyle(color: Palettes.black),
      )),
    );
  }
}
