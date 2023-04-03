part of change_password_view;

// ignore: must_be_immutable
class _ChangePasswordTablet extends StatelessWidget {
  final ChangePasswordViewModel viewModel;

  _ChangePasswordTablet(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ChangePasswordTablet')),
    );
  }
}