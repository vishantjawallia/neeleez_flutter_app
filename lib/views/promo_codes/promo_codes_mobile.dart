part of promo_codes_view;

// ignore: must_be_immutable
class _PromoCodesMobile extends StatelessWidget {
  final PromoCodesViewModel viewModel;

  const _PromoCodesMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: DefaultLayout(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'PromoCodesMobile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
