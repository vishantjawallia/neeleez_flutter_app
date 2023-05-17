part of format_view;

// ignore: must_be_immutable
class _FormatMobile extends StatelessWidget {
  final FormatViewModel viewModel;

  _FormatMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FormatMobile')),
    );
  }
}