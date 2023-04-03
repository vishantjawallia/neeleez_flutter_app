part of appointments_view;

// ignore: must_be_immutable
class _AppointmentsMobile extends StatelessWidget {
  final AppointmentsViewModel viewModel;

  _AppointmentsMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AppointmentsMobile')),
    );
  }
}