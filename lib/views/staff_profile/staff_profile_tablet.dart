part of staff_profile_view;

// ignore: must_be_immutable
class _StaffProfileTablet extends StatelessWidget {
  final StaffProfileViewModel viewModel;

  _StaffProfileTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('StaffProfileTablet')),
    );
  }
}