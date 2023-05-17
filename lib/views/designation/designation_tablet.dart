part of designation_view;

// ignore: must_be_immutable
class _DesignationTablet extends StatelessWidget {
  final DesignationViewModel viewModel;

  const _DesignationTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('DesignationTablet')),
    );
  }
}