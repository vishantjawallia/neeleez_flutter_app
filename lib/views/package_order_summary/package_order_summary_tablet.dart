part of package_order_summary_view;

// ignore: must_be_immutable
class _PackageOrderSummaryTablet extends StatelessWidget {
  final PackageOrderSummaryViewModel viewModel;

  _PackageOrderSummaryTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PackageOrderSummaryTablet')),
    );
  }
}