part of service_composition_view;

// ignore: must_be_immutable
class _ServiceCompositionTablet extends StatelessWidget {
  final ServiceCompositionViewModel viewModel;

  _ServiceCompositionTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceCompositionTablet')),
    );
  }
}