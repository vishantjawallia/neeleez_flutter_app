part of package_subscriptions_view;

// ignore: must_be_immutable
class _PackageSubscriptionsDesktop extends StatelessWidget {
  final PackageSubscriptionsViewModel viewModel;

  _PackageSubscriptionsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('PackageSubscriptionsDesktop')),
    );
  }
}