part of designation_view;

// ignore: must_be_immutable
class _DesignationMobile extends StatelessWidget {
  final DesignationViewModel viewModel;

  _DesignationMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('DesignationMobile')),
    );
  }
}