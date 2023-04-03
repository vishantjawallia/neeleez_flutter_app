part of service_providers_view;

// ignore: must_be_immutable
class _ServiceProvidersTablet extends StatelessWidget {
  final ServiceProvidersViewModel viewModel;

  _ServiceProvidersTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceProvidersTablet')),
    );
  }
}