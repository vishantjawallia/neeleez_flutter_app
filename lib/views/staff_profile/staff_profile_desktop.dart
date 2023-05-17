part of staff_profile_view;

// ignore: must_be_immutable
class _StaffProfileDesktop extends StatelessWidget {
  final StaffProfileViewModel viewModel;

  _StaffProfileDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StaffProfileDesktop')),
    );
  }
}