part of service_providers_view;

// ignore: must_be_immutable
class _ServiceProvidersDesktop extends StatelessWidget {
  final ServiceProvidersViewModel viewModel;

  _ServiceProvidersDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceProvidersDesktop')),
    );
  }
}