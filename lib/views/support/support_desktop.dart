part of support_view;

// ignore: must_be_immutable
class _SupportDesktop extends StatelessWidget {
  final SupportViewModel viewModel;

  _SupportDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SupportDesktop')),
    );
  }
}