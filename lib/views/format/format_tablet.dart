part of format_view;

// ignore: must_be_immutable
class _FormatTablet extends StatelessWidget {
  final FormatViewModel viewModel;

  _FormatTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FormatTablet')),
    );
  }
}