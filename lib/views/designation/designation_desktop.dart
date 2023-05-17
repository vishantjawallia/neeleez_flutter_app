part of designation_view;

// ignore: must_be_immutable
class _DesignationDesktop extends StatelessWidget {
  final DesignationViewModel viewModel;

  _DesignationDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DesignationDesktop')),
    );
  }
}