part of service_view;

// ignore: must_be_immutable
class _ServiceTablet extends StatelessWidget {
  final ServiceViewModel viewModel;

  _ServiceTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceTablet')),
    );
  }
}