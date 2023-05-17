part of service_view;

// ignore: must_be_immutable
class _ServiceMobile extends StatelessWidget {
  final ServiceViewModel viewModel;

  _ServiceMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ServiceMobile')),
    );
  }
}