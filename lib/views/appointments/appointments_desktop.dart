part of appointments_view;

// ignore: must_be_immutable
class _AppointmentsDesktop extends StatelessWidget {
  final AppointmentsViewModel viewModel;

  _AppointmentsDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('AppointmentsDesktop')),
    );
  }
}