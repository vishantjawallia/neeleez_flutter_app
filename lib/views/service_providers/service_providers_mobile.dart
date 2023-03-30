part of service_providers_view;

// ignore: must_be_immutable
class _ServiceProvidersMobile extends StatelessWidget {
  final ServiceProvidersViewModel viewModel;

  _ServiceProvidersMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceProvidersMobile')),
    );
  }
}