part of change_password_view;

// ignore: must_be_immutable
class _ChangePasswordDesktop extends StatelessWidget {
  final ChangePasswordViewModel viewModel;

  _ChangePasswordDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChangePasswordDesktop')),
    );
  }
}