part of service_view;

// ignore: must_be_immutable
class _ServiceDesktop extends StatelessWidget {
  final ServiceViewModel viewModel;

  _ServiceDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceDesktop')),
    );
  }
}