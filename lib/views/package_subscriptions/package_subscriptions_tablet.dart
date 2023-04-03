part of package_subscriptions_view;

// ignore: must_be_immutable
class _PackageSubscriptionsTablet extends StatelessWidget {
  final PackageSubscriptionsViewModel viewModel;

  _PackageSubscriptionsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PackageSubscriptionsTablet')),
    );
  }
}