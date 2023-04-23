part of support_view;

// ignore: must_be_immutable
class _SupportMobile extends StatelessWidget {
  final SupportViewModel viewModel;

  _SupportMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'SupportMobile',
        style: TextStyle(color: Palettes.black),
      )),
    );
  }
}
