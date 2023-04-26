part of package_order_summary_view;

// ignore: must_be_immutable
class _PackageOrderSummaryDesktop extends StatelessWidget {
  final PackageOrderSummaryViewModel viewModel;

  _PackageOrderSummaryDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PackageOrderSummaryDesktop')),
    );
  }
}