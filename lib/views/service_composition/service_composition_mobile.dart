part of service_composition_view;

// ignore: must_be_immutable
class _ServiceCompositionMobile extends StatelessWidget {
  final ServiceCompositionViewModel viewModel;

  _ServiceCompositionMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceCompositionMobile')),
    );
  }
}