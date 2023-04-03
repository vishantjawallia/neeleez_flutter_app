part of package_subscriptions_view;

// ignore: must_be_immutable
class _PackageSubscriptionsMobile extends StatelessWidget {
  final PackageSubscriptionsViewModel viewModel;

  _PackageSubscriptionsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PackageSubscriptionsMobile')),
    );
  }
}