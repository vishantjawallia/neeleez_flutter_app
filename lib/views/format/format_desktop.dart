part of format_view;

// ignore: must_be_immutable
class _FormatDesktop extends StatelessWidget {
  final FormatViewModel viewModel;

  _FormatDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('FormatDesktop')),
    );
  }
}