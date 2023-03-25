part of forget_password_view;

// ignore: must_be_immutable
class _ForgetPasswordDesktop extends StatelessWidget {
  final ForgetPasswordViewModel viewModel;

  _ForgetPasswordDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('ForgetPasswordDesktop')),
    );
  }
}