part of appointments_view;

// ignore: must_be_immutable
class _AppointmentsTablet extends StatelessWidget {
  final AppointmentsViewModel viewModel;

  _AppointmentsTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AppointmentsTablet')),
    );
  }
}