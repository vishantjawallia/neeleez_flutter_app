part of service_composition_view;

// ignore: must_be_immutable
class _ServiceCompositionDesktop extends StatelessWidget {
  final ServiceCompositionViewModel viewModel;

  _ServiceCompositionDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceCompositionDesktop')),
    );
  }
}